package Net::APE::Raw;
use Moose;
use DateTime;

=head1 NAME

Net::APE::Raw - Raw object from the APE-Server

=head1 SYNOPSIS
	
=head1 DESCRIPTION

=cut

has 'time' => (
	is => 'ro',
	isa => 'DateTime',
	lazy => 1,
	default => sub {
		my $self = shift;
		DateTime->from_epoch( epoch => $self->raw_hash->{time} );		
	},
);

has data => (
	is => 'ro',
	isa => 'HashRef',
	lazy => 1,
	default => sub {
		my $self = shift;
		$self->raw_hash->{data};
	},
);

has raw => (
	is => 'ro',
	isa => 'Str',
	lazy => 1,
	default => sub {
		my $self = shift;
		$self->raw_hash->{raw};
	},
);

has raw_hash => (
	is => 'ro',
	isa => 'HashRef',
	required => 1,
);

has code => (
	is => 'ro',
	isa => 'Int',
	lazy => 1,
	default => sub {
		my $self = shift;
		$self->data->{code};
	},
);

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
