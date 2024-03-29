
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Packages for using APE-Project (Ajax Push Engine)',
  'AUTHOR' => 'Torsten Raudssus <torsten@raudssus.de> L<http://www.raudssus.de/>',
  'BUILD_REQUIRES' => {
    'LWP::UserAgent' => '0',
    'Test::More' => '0.96'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'Net-APE',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'Net::APE',
  'PREREQ_PM' => {
    'DateTime' => '0',
    'HTTP::Request' => '5.814',
    'HTTP::Response' => '0',
    'JSON' => '0',
    'Moose' => '1.15',
    'URI::Encode' => '0'
  },
  'VERSION' => '0.003',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



