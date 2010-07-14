#!/usr/bin/perl

use strict;
use warnings;
use Test::More tests => 5;

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

	is(scalar $http_request->uri,
	  'http://localhost:6969/?[%7B%22params%22:%7B%22password%22:%22testpasswd%22,%22data%22:%7B%7D,%22channel%22:%22*global%22,%22raw%22:%22mytest%22%7D,%22cmd%22:%22inlinepush%22%7D,%7B%22params%22:%7B%22password%22:%22testpasswd%22,%22data%22:%7B%7D,%22channel%22:%22*global%22,%22raw%22:%22mytest%22%7D,%22cmd%22:%22inlinepush%22%7D]');
	
}
