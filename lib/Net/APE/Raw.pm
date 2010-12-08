package Net::APE::Raw;
BEGIN {
  $Net::APE::Raw::AUTHORITY = 'cpan:GETTY';
}
BEGIN {
  $Net::APE::Raw::VERSION = '0.003';
}
# ABSTRACT: Raw object from the APE-Server
use Moose;
use DateTime;


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


__END__
=pod

=head1 NAME

Net::APE::Raw - Raw object from the APE-Server

=head1 VERSION

version 0.003

=head1 SYNOPSIS

  my $http_request = $ape_request->get_http_request;

  my $http_response = $http_client->request($http_request);

  my $ape_response = Net::APE::Response->new(
    http_response => $http_response,
  );

  my $raw = $ape_response->shift_raw;
  
  $raw->time;
  $raw->raw;
  $raw->data;
  $raw->code;

=head1 DESCRIPTION

=head1 METHODS

=head2 B<time>

Gives back the L<DateTime> object of the time variable of the answer

=head2 B<raw>

Gives back a string of the raw variable in the answer

=head2 B<data>

Gives back the hashref of the data variable in the answer

=head2 B<code>

Gives back the code of the code variable inside the data of the answer

=head1 AUTHOR

Torsten Raudssus <torsten@raudssus.de> L<http://www.raudssus.de/>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Raudssus Social Software.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

