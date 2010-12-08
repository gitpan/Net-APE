#!/usr/bin/perl

use strict;
use warnings;
use Test::More tests => 5;
use JSON;
use URI::Encode qw(uri_encode uri_decode);

BEGIN {
	use Net::APE::Server;
	use Net::APE::Session;
	
	my $ape_server = Net::APE::Server->new();
	isa_ok($ape_server, 'Net::APE::Server');
	
	my $ape_session = Net::APE::Session->new(
		server => $ape_server,
	);
	isa_ok($ape_session, 'Net::APE::Session');
	
	my $ape_request = $ape_session->next_request;
	isa_ok($ape_request, 'Net::APE::Request');

	my $http_request = $ape_request->get_http_request;
	isa_ok($http_request, 'HTTP::Request');

	my @uriparts = split(/\?/,scalar $http_request->uri);

	is_deeply(decode_json(uri_decode($uriparts[1])),[{
		'params' => {
			'transport' => 0,
		},
		'cmd' => 'CONNECT',
		'chl' => '0',
	}]);

}
