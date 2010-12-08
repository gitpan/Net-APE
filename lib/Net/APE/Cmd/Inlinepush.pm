package Net::APE::Cmd::Inlinepush;
BEGIN {
  $Net::APE::Cmd::Inlinepush::AUTHORITY = 'cpan:GETTY';
}
BEGIN {
  $Net::APE::Cmd::Inlinepush::VERSION = '0.003';
}
# ABSTRACT: Executing an inline push on the APE-Server
use Moose;
extends 'Net::APE::Cmd';

with qw(
	Net::APE::Cmd::Role::Data
);


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


__END__
=pod

=head1 NAME

Net::APE::Cmd::Inlinepush - Executing an inline push on the APE-Server

=head1 VERSION

version 0.003

=head1 SYNOPSIS

  use Net::APE::Cmd::Inlinepush;

=head1 DESCRIPTION

=head1 METHODS

=head1 AUTHOR

Torsten Raudssus <torsten@raudssus.de> L<http://www.raudssus.de/>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Raudssus Social Software.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

