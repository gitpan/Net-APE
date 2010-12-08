#!/usr/bin/perl

use strict;
use warnings;
use Test::More tests => 4;
use Net::APE::Server;
use Net::APE::Cmd::Inlinepush;
use Net::APE::Request;
use Net::APE::Response;

my $testcount = 4;

SKIP: {

	eval { require LWP::UserAgent };
	skip "LWP::UserAgent not installed", $testcount if $@;

	my $http_client = LWP::UserAgent->new();
	$http_client->timeout(10);
	
	my $ape_server = Net::APE::Server->new();
	my $response = $http_client->get($ape_server->url);

	if ( $response->content !~ qr/ape-project.org/ ) {
		diag(
			"\n==================================================================================================\n",
			"There is no ape server running on the suggested hostname and port (default is localhost and 6969).\n\n",
			"If you want to run this test and you got an APE-Server running on another host and port those can\n",
			"be set via the environment variables NET_APE_SERVER_HOST and NET_APE_SERVER_PORT, which are used\n",
			"by this test and also by the module itself, if you want to configure the APE via environment.\n\n",
			"The APE-Server needs to have the distribution standard setup\n",
			"==================================================================================================\n",
		);
		skip "APE-Server not found", $testcount if $@;
	}

	my $ape_cmd = Net::APE::Cmd::Inlinepush->new(
		raw => 'mytest',
		channel => 'net_ape_test',
	);

	my $ape_request = Net::APE::Request->new(
		server => $ape_server,
	);
	
	$ape_request->add_cmd($ape_cmd);
	my $http_request = $ape_request->get_http_request;

	my $http_response = $http_client->request($http_request);

	my $ape_response = Net::APE::Response->new(
		http_response => $http_response,
	);

	my $raw = $ape_response->shift_raw;
	isa_ok($raw, 'Net::APE::Raw');
	isa_ok($raw->time, 'DateTime');	
	is($raw->raw, 'ERR', "ape gives correct ERR");
	is($raw->code, '401', "ape gives correct code");

}
