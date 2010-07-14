use inc::Module::Install;

name 'Net-APE';

perl_version '5.008';
license 'perl';
all_from 'lib/Net/APE.pm';

requires 'JSON';
requires 'HTTP::Request' => '5.814';
requires 'Moose';
requires 'MooseX::LazyRequire';
requires 'URI::Encode';

WriteAll;
