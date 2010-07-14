package Net::APE::Server;
use Moose;

=head1 NAME

Net::APE::Server - Abstraction of an APE Server

=head1 SYNOPSIS
	
=head1 DESCRIPTION

=cut

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

=pod

=head1 METHODS

=head2 host

Setting the hostname of the APE-Server, can also be set via NET_APE_SERVER_HOST Environment variable.
Elsewhere the default value is localhost.

=head2 port

Setting the hostname of the APE-Server, can also be set via NET_APE_SERVER_PORT Environment variable.
Elsewhere the default value is 6969.

=head2 url

Returns the URL for the APE-Server

=over 4

=head1 AUTHOR

Torsten Raudssus <torsten@raudssus.de>

=head1 COPYRIGHT & LICENSE 

Copyright 2010 Torsten Raudssus, all rights reserved.

This library is free software; you can redistribute it and/or modify it under the same terms as 
Perl itself, either Perl version 5.8.8 or, at your option, any later version of Perl 5 you may 
have available.

=cut
