package Net::APE::Cmd::Join;
BEGIN {
  $Net::APE::Cmd::Join::AUTHORITY = 'cpan:GETTY';
}
BEGIN {
  $Net::APE::Cmd::Join::VERSION = '0.003';
}
# ABSTRACT: JOIN Cmd
use Moose;
extends 'Net::APE::Cmd';


has '+name' => (
	default => sub { 'JOIN' },
);

has channels => (
	is => 'rw',
	isa => 'ArrayRef[Str]',
	required => 1,
	default => sub {[]},
);

before get_request_hash => sub {
	my ( $self ) = @_;
	$self->set_param('channels',$self->channels);
};

1;


__END__
=pod

=head1 NAME

Net::APE::Cmd::Join - JOIN Cmd

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

