package Net::APE;
BEGIN {
  $Net::APE::AUTHORITY = 'cpan:GETTY';
}
BEGIN {
  $Net::APE::VERSION = '0.003';
}
# ABSTRACT: Packages for using APE-Project (Ajax Push Engine)
use strict;
use warnings;

1;


__END__
=pod

=head1 NAME

Net::APE - Packages for using APE-Project (Ajax Push Engine)

=head1 VERSION

version 0.003

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

=head1 BUGS 

Please report any bugs or feature requests through the methods following.

=head1 SUPPORT

IRC

  You can join #ape-project on irc.freenode.net, talk to Getty
  or you can connect to irc.perl.org and talk there to Getty

Repository

  http://github.com/Getty/p5-net-ape
  Pull request and additional contributors are welcome

Issue Tracker

  http://github.com/Getty/p5-net-ape/issues  

=head1 AUTHOR

Torsten Raudssus <torsten@raudssus.de> L<http://www.raudssus.de/>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Raudssus Social Software.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

