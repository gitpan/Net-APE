#!/usr/bin/perl

use strict;
use warnings;
use Test::More tests => 5;
use JSON;
use URI::Encode qw(uri_encode uri_decode);

BEGIN {
	use Net::APE::Server;
	use Net::APE::Cmd::Inlinepush;
	use Net::APE::Request;
	
	my $ape_server = Net::APE::Server->new();
	isa_ok($ape_server, 'Net::APE::Server');
	
	my $ape_cmd = Net::APE::Cmd::Inlinepush->new(
		raw => 'mytest',
	);
	isa_ok($ape_cmd, 'Net::APE::Cmd::Inlinepush');

	my $ape_request = Net::APE::Request->new(
		server => $ape_server,
	);
	isa_ok($ape_request, 'Net::APE::Request');
	
	$ape_request->add_cmd($ape_cmd);
	$ape_request->add_cmd($ape_cmd);
	my $http_request = $ape_request->get_http_request;
	isa_ok($http_request, 'HTTP::Request');

	my @uriparts = split(/\?/,scalar $http_request->uri);

	is_deeply(decode_json(uri_decode($uriparts[1])),[{
		'params' => {
			'password' => 'testpasswd',
			'channel' => '*global',
			'data' => {},
			'raw' => 'mytest'
		},
		'cmd' => 'inlinepush',
	},{
		'params' => {
			'password' => 'testpasswd',
			'channel' => '*global',
			'data' => {},
			'raw' => 'mytest'
		},
		'cmd' => 'inlinepush'
	}]);

}
