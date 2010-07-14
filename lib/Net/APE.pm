package Net::APE;
use strict;
use warnings;

our $VERSION = '0.002';

1;

=pod

=head1 NAME

Net::APE - Packages for using APE-Project (Ajax Push Engine)

=head1 SYNOPSIS

  use Net::APE::Server;
  use Net::APE::Cmd::Inlinepush;
  use Net::APE::Request;

  my $ape_server = Net::APE::Server->new();

  my $ape_cmd = Net::APE::Cmd::Inlinepush->new(
    raw => 'mytest',
  );

  my $ape_request = Net::APE::Request->new(
    server => $ape_server,
  );

  $ape_request->add_cmd($ape_cmd);
  my $http_request = $ape_request->get_http_request;
	
=head1 DESCRIPTION

So much todo...

=head1 METHODS

Here is nothing... but see L<Net::APE::Cmd>, L<Net::APE::Server>, L<Net::APE::Request>

=head1 AUTHOR

Torsten Raudssus <torsten@raudssus.de>

=head1 BUGS 

Please report any bugs or feature requests through the methods following.

=head1 SUPPORT

IRC

  You can join #ape-project on irc.freenode.net, talk to Getty
  or you can connect to irc.perl.org and talk there to Getty

Repository

  http://github.com/Getty/net-ape
  Pull request and additional contributors are welcome
 
Issue Tracker

  http://github.com/Getty/net-ape/issues  

=head1 COPYRIGHT & LICENSE 

Copyright 2010 Torsten Raudssus, all rights reserved.

This library is free software; you can redistribute it and/or modify it under the same terms as 
Perl itself, either Perl version 5.8.8 or, at your option, any later version of Perl 5 you may 
have available.

=cut
