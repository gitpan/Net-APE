package Net::APE::Cmd::Role::Data;
BEGIN {
  $Net::APE::Cmd::Role::Data::AUTHORITY = 'cpan:GETTY';
}
BEGIN {
  $Net::APE::Cmd::Role::Data::VERSION = '0.003';
}
# ABSTRACT: Role for APE Requests with data
use Moose::Role;


has data => (
	traits    => ['Hash'],
	is        => 'ro',
	isa       => 'HashRef',
	default   => sub { {} },
	handles   => {
		set_data      => 'set',
		get_data      => 'get',
		has_no_datas  => 'is_empty',
		num_datas     => 'count',
		delete_data   => 'delete',
		param_datas   => 'kv',
	},
);

before get_request_hash => sub {
	my ( $self ) = @_;
	$self->set_param('data',$self->data);
};

1;


__END__
=pod

=head1 NAME

Net::APE::Cmd::Role::Data - Role for APE Requests with data

=head1 VERSION

version 0.003

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 METHODS

=head2 B<set_data($key, $value)>

=head2 B<get_data($key)>

=head2 B<has_no_datas()>

=head2 B<num_datas()>

=head2 B<delete_data($key)>

=head2 B<param_datas()>

=head1 AUTHOR

Torsten Raudssus <torsten@raudssus.de> L<http://www.raudssus.de/>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Raudssus Social Software.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

