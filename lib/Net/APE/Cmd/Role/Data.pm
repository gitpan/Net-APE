package Net::APE::Cmd::Role::Data;
use Moose::Role;

=head1 NAME

Net::APE::Cmd::Role::Data - Role for APE Requests with data

=head1 SYNOPSIS
	
=head1 DESCRIPTION

=cut

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

=pod

=head1 METHODS

=over 4

=item B<set_data($key, $value)>

=item B<get_data($key)>

=item B<has_no_datas()>

=item B<num_datas()>

=item B<delete_data($key)>

=item B<param_datas()>

=head1 AUTHOR

Torsten Raudssus <torsten@raudssus.de>

=head1 COPYRIGHT & LICENSE 

Copyright 2010 Torsten Raudssus, all rights reserved.

This library is free software; you can redistribute it and/or modify it under the same terms as 
Perl itself, either Perl version 5.8.8 or, at your option, any later version of Perl 5 you may 
have available.

=cut
