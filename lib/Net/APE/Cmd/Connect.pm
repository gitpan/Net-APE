package Net::APE::Cmd::Connect;
BEGIN {
  $Net::APE::Cmd::Connect::AUTHORITY = 'cpan:GETTY';
}
BEGIN {
  $Net::APE::Cmd::Connect::VERSION = '0.003';
}
# ABSTRACT: Making a clean connect to the APE-Server
use Moose;
extends 'Net::APE::Cmd';


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


__END__
=pod

=head1 NAME

Net::APE::Cmd::Connect - Making a clean connect to the APE-Server

=head1 VERSION

version 0.003

=head1 SYNOPSIS

  use Net::APE::Cmd::Connect;

=head1 DESCRIPTION

=head1 METHODS

=head1 AUTHOR

Torsten Raudssus <torsten@raudssus.de> L<http://www.raudssus.de/>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Raudssus Social Software.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

