#!/usr/bin/perl

use strict;
use warnings;
use Test::More tests => 10;

BEGIN {
    use_ok('Net::APE::Cmd');
    use_ok('Net::APE::Cmd::Check');
    use_ok('Net::APE::Cmd::Connect');
    use_ok('Net::APE::Cmd::Inlinepush');
    use_ok('Net::APE::Cmd::Join');
    use_ok('Net::APE::Request');
	use_ok('Net::APE::Response');
    use_ok('Net::APE::Server');
    use_ok('Net::APE::Session');
	use_ok('Net::APE');
}
