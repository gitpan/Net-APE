use inc::Module::Install;

name 'Net-APE';

perl_version '5.008';
license 'perl';
all_from 'lib/Net/APE.pm';

requires 'DateTime';
requires 'JSON';
requires 'HTTP::Request' => '5.814';
requires 'HTTP::Response';
requires 'Moose';
requires 'URI::Encode';

test_requires 'Test::More';
test_requires 'LWP::UserAgent';

WriteAll;
