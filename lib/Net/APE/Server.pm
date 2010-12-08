package Net::APE::Server;
BEGIN {
  $Net::APE::Server::AUTHORITY = 'cpan:GETTY';
}
BEGIN {
  $Net::APE::Server::VERSION = '0.003';
}
# ABSTRACT: Abstraction of an APE Server
use Moose;


has host => (
	is => 'ro',
	isa => 'Str',
	required => 1,
	default => sub { $ENV{NET_APE_SERVER_HOST} ? $ENV{NET_APE_SERVER_HOST} : 'localhost' },
);

has port => (
	is => 'ro',
	isa => 'Int',
	required => 1,
	default => sub { $ENV{NET_APE_SERVER_PORT} ? $ENV{NET_APE_SERVER_PORT} : 6969 },
);

sub url {
	my ( $self ) = @_;
	'http://'.$self->host.':'.$self->port.'/';
}

1;


__END__
=pod

=head1 NAME

Net::APE::Server - Abstraction of an APE Server

=head1 VERSION

version 0.003

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 METHODS

=head2 host

Setting the hostname of the APE-Server, can also be set via NET_APE_SERVER_HOST Environment variable.
Elsewhere the default value is localhost.

=head2 port

Setting the hostname of the APE-Server, can also be set via NET_APE_SERVER_PORT Environment variable.
Elsewhere the default value is 6969.

=head2 url

Returns the URL for the APE-Server

=head1 AUTHOR

Torsten Raudssus <torsten@raudssus.de> L<http://www.raudssus.de/>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Raudssus Social Software.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

