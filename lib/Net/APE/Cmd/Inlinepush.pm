package Net::APE::Cmd::Inlinepush;
use Moose;
extends 'Net::APE::Cmd';

with qw(
	Net::APE::Cmd::Role::Data
);

=head1 NAME

Net::APE::Cmd::Inlinepush - Executing an inline push on the APE-Server

=head1 SYNOPSIS

  use Net::APE::Cmd::Inlinepush;

=head1 DESCRIPTION

=cut

has '+name' => (
	default => sub { 'inlinepush' },
);

has password => (
	is => 'ro',
	isa => 'Str',
	required => 1,
	default => sub { 'testpasswd' },
);

has raw => (
	is => 'ro',
	isa => 'Str',
	required => 1,
);

has channel => (
	is => 'ro',
	isa => 'Str',
	required => 1,
	default => sub { '*global' },
);

before get_request_hash => sub {
	my ( $self ) = @_;
	$self->set_param('password',$self->password);
	$self->set_param('raw',$self->raw);
	$self->set_param('channel',$self->channel);
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
