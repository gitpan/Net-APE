package Net::APE::Cmd::Connect;
use Moose;
extends 'Net::APE::Cmd';

=head1 NAME

Net::APE::Cmd::Connect - Making a clean connect to the APE-Server

=head1 SYNOPSIS

  use Net::APE::Cmd::Connect;

=head1 DESCRIPTION

=cut

has '+name' => (
	default => sub { 'CONNECT' },
);

has transport => (
	is => 'ro',
	isa => 'Int',
	required => 1,
	default => sub { 0 },
);

before get_request_hash => sub {
	my ( $self ) = @_;
	$self->set_param('transport',$self->transport);
};

1;

=pod

=head1 METHODS

=head1 AUTHOR

Torsten Raudssus <torsten@raudssus.de>

=head1 COPYRIGHT & LICENSE 

Copyright 2010 Torsten Raudssus, all rights reserved.

This library is free software; you can redistribute it and/or modify it under the same terms as 
Perl itself, either Perl version 5.8.8 or, at your option, any later version of Perl 5 you may 
have available.

=cut
