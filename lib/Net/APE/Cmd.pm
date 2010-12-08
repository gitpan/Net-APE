package Net::APE::Cmd;
BEGIN {
  $Net::APE::Cmd::AUTHORITY = 'cpan:GETTY';
}
BEGIN {
  $Net::APE::Cmd::VERSION = '0.003';
}
# ABSTRACT: Executing a command on the APE-Server
use Moose;


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


__END__
=pod

=head1 NAME

Net::APE::Cmd - Executing a command on the APE-Server

=head1 VERSION

version 0.003

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 METHODS

=head2 B<set_param($key, $value)>

=head2 B<get_param($key)>

=head2 B<has_no_params()>

=head2 B<num_params()>

=head2 B<delete_param($key)>

=head2 B<param_pairs()>

=head2 B<get_request_hash()>

=head1 AUTHOR

Torsten Raudssus <torsten@raudssus.de> L<http://www.raudssus.de/>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Raudssus Social Software.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

