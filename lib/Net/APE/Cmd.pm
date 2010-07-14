package Net::APE::Cmd;
use Moose;

=head1 NAME

Net::APE::Cmd - Executing a command on the APE-Server

=head1 SYNOPSIS
	
=head1 DESCRIPTION

=cut

has name => (
	is => 'ro',
	isa => 'Str',
	required => 1,
);

has sessid => (
	is => 'rw',
	isa => 'Str',
	predicate => 'has_sessid',
);

has chl => (
	is => 'rw',
	isa => 'Int',
	predicate => 'has_chl',
);

has params => (
	traits    => ['Hash'],
	is        => 'ro',
	isa       => 'HashRef',
	default   => sub { {} },
	handles   => {
		set_param      => 'set',
		get_param      => 'get',
		has_no_params  => 'is_empty',
		num_params     => 'count',
		delete_param   => 'delete',
		param_pairs    => 'kv',
	},
);

sub get_request_hash {
	my ( $self ) = @_;
	my $return = {
		'cmd' => $self->name,
	};
	$return->{params} = $self->params if $self->num_params;
	$return->{sessid} = $self->sessid if $self->has_sessid;
	$return->{chl} = $self->chl if $self->has_chl;
	return $return;
}

1;

=pod

=head1 METHODS

=over 4

=item B<set_param($key, $value)>

=item B<get_param($key)>

=item B<has_no_params()>

=item B<num_params()>

=item B<delete_param($key)>

=item B<param_pairs()>

=item B<get_request_hash()>

=head1 AUTHOR

Torsten Raudssus <torsten@raudssus.de>

=head1 COPYRIGHT & LICENSE 

Copyright 2010 Torsten Raudssus, all rights reserved.

This library is free software; you can redistribute it and/or modify it under the same terms as 
Perl itself, either Perl version 5.8.8 or, at your option, any later version of Perl 5 you may 
have available.

=cut
