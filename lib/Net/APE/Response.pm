package Net::APE::Response;
BEGIN {
  $Net::APE::Response::AUTHORITY = 'cpan:GETTY';
}
BEGIN {
  $Net::APE::Response::VERSION = '0.003';
}
# ABSTRACT: Parsing an APE-Server response
use Moose;
use JSON;
use Net::APE::Raw;


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


__END__
=pod

=head1 NAME

Net::APE::Response - Parsing an APE-Server response

=head1 VERSION

version 0.003

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 METHODS

=head1 AUTHOR

Torsten Raudssus <torsten@raudssus.de> L<http://www.raudssus.de/>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Raudssus Social Software.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

