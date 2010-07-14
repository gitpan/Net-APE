package Net::APE::Response;
use Moose;
use JSON;
use Net::APE::Raw;

=head1 NAME

Net::APE::Response - Parsing an APE-Server response

=head1 SYNOPSIS
	
=head1 DESCRIPTION

=cut

has raws => (
	traits => ['Array'],
	is => 'ro',
	isa => 'ArrayRef[Net::APE::Raw]',
	default => sub {[]},
	handles => {
		add_raw => 'push',
		shift_raw => 'shift',
		count_raws => 'count',
		has_raws => 'count',
		no_raws => 'is_empty',
	},
);

has http_response => (
	is => 'ro',
	isa => 'HTTP::Response',
	required => 1,
);

use Data::Dumper;

sub BUILD {
	my ( $self ) = @_;
	my $answer = decode_json($self->http_response->content);
	for (@{$answer}) {
		$self->add_raw(Net::APE::Raw->new({
			raw_hash => $_,
		}));
	}
}

1;

=pod

=head1 METHODS

=over 4

=head1 AUTHOR

Torsten Raudssus <torsten@raudssus.de>

=head1 COPYRIGHT & LICENSE 

Copyright 2010 Torsten Raudssus, all rights reserved.

This library is free software; you can redistribute it and/or modify it under the same terms as 
Perl itself, either Perl version 5.8.8 or, at your option, any later version of Perl 5 you may 
have available.

=cut
