#!/usr/bin/perl

use strict;
use warnings;
use Test::More tests => 8;

BEGIN {
	use Net::APE::Cmd::Inlinepush;
	use Net::APE::Cmd::Check;
	use Net::APE::Cmd::Join;
	use Net::APE::Cmd::Connect;

	my $ape_cmd_inlinepush = Net::APE::Cmd::Inlinepush->new(
		raw => 'mytest',
	);
	isa_ok($ape_cmd_inlinepush, 'Net::APE::Cmd::Inlinepush');
	is_deeply($ape_cmd_inlinepush->get_request_hash,{
		'params' => {
			'password' => 'testpasswd',
			'data' => {},
			'channel' => '*global',
			'raw' => 'mytest',
		},
		'cmd' => 'inlinepush',
	},'structure of the request hash is correct for Net::APE::Cmd::Inlinepush');
	
	my $ape_cmd_check = Net::APE::Cmd::Check->new();
	isa_ok($ape_cmd_check, 'Net::APE::Cmd::Check');
	is_deeply($ape_cmd_check->get_request_hash,{
		'cmd' => 'CHECK',
	},'structure of the request hash is correct for Net::APE::Cmd::Check'); 

	my $ape_connect_check = Net::APE::Cmd::Connect->new();
	isa_ok($ape_connect_check, 'Net::APE::Cmd::Connect');
	is_deeply($ape_connect_check->get_request_hash,{
		'params' => {
			'transport' => 0,
		},
		'cmd' => 'CONNECT',
	},'structure of the request hash is correct for Net::APE::Cmd::Connect'); 

	my $ape_join_check = Net::APE::Cmd::Join->new();
	isa_ok($ape_join_check, 'Net::APE::Cmd::Join');
	is_deeply($ape_join_check->get_request_hash,{
		'params' => {
			'channels' => [],
		},
		'cmd' => 'JOIN',
	},'structure of the request hash is correct for Net::APE::Cmd::Join'); 
	
}
