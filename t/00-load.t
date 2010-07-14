#!/usr/bin/perl

use strict;
use warnings;
use Test::More tests => 5;

BEGIN {
	use_ok('Net::APE');
    use_ok('Net::APE::Cmd');
    use_ok('Net::APE::Cmd::Inlinepush');
    use_ok('Net::APE::Server');
    use_ok('Net::APE::Request');
}
