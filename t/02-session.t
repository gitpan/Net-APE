#!/usr/bin/perl

use strict;
use warnings;
use Test::More tests => 5;

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

	is(scalar $http_request->uri,
		'http://localhost:6969/?[%7B%22params%22:%7B%22transport%22:0%7D,%22cmd%22:%22CONNECT%22,%22chl%22:%220%22%7D]',
		'request looks like expected');
	  
}
