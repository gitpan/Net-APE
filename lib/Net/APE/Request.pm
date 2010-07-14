package Net::APE::Request;
use Moose;
use JSON;
use HTTP::Request;
use URI::Encode qw(uri_encode uri_decode);

=head1 NAME

Net::APE::Request - Executing a command on the APE-Server

=head1 SYNOPSIS
	
=head1 DESCRIPTION

=cut

has cmds => (
	traits => ['Array'],
	is => 'ro',
	isa => 'ArrayRef[Net::APE::Cmd]',
	default => sub {[]},
	handles => {
		add_cmd => 'push',
		count_cmds => 'count',
		has_cmds => 'count',
		no_cmds => 'is_empty',
	},
);

has server => (
	is        => 'ro',
	isa       => 'Net::APE::Server',
	required  => 1,
	default   => sub {
		Net::APE::Server->new();
	},
);

sub get_http_request {
	my ( $self ) = @_;
	return if $self->no_cmds;
	my @cmds;
	for (@{$self->cmds}) {
		if ($_->can('get_request_hash')) {
			push @cmds, $_->get_request_hash;
		}
	}
	HTTP::Request->new(GET => $self->server->url.'?'.uri_encode(encode_json(\@cmds)));
}

1;

=pod

=head1 METHODS

=over 4

=item B<add_cmd($cmd)>

Adding an L<Net::APE::Cmd> object to the request

=item B<has_cmds>

=item B<count_cmds>

Getting a count of the added commands.

=item B<no_cmds>

Gives back true of there are no commands added.

=item B<server>

Get the L<Net::APE::Server> for the request

=head1 AUTHOR

Torsten Raudssus <torsten@raudssus.de>

=head1 COPYRIGHT & LICENSE 

Copyright 2010 Torsten Raudssus, all rights reserved.

This library is free software; you can redistribute it and/or modify it under the same terms as 
Perl itself, either Perl version 5.8.8 or, at your option, any later version of Perl 5 you may 
have available.

=cut
