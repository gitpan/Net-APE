package Net::APE::Cmd::Check;
BEGIN {
  $Net::APE::Cmd::Check::AUTHORITY = 'cpan:GETTY';
}
BEGIN {
  $Net::APE::Cmd::Check::VERSION = '0.003';
}
# ABSTRACT: CHECK Command
use Moose;
extends 'Net::APE::Cmd';


has '+name' => (
	default => sub { 'CHECK' },
);

1;


__END__
=pod

=head1 NAME

Net::APE::Cmd::Check - CHECK Command

=head1 VERSION

version 0.003

=head1 SYNOPSIS

=head1 DESCRIPTION

B<WARNING:> This command is "hold up" request on an APE-Server, if its successful (so it just
instantly returns if its a failing CHECK). We advice to not use it without a non-blocking 
environment like L<POE> and L<Reflex>. Packages for both systems will arrive soon.

=head1 METHODS

=head1 AUTHOR

Torsten Raudssus <torsten@raudssus.de> L<http://www.raudssus.de/>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Raudssus Social Software.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

