package Net::APE::Request;
BEGIN {
  $Net::APE::Request::AUTHORITY = 'cpan:GETTY';
}
BEGIN {
  $Net::APE::Request::VERSION = '0.003';
}
# ABSTRACT: Executing a command on the APE-Server
use Moose;
use JSON;
use HTTP::Request;
use URI::Encode qw(uri_encode uri_decode);


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


__END__
=pod

=head1 NAME

Net::APE::Request - Executing a command on the APE-Server

=head1 VERSION

version 0.003

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 METHODS

=head2 B<add_cmd($cmd)>

Adding an L<Net::APE::Cmd> object to the request

=head2 B<has_cmds>

=head2 B<count_cmds>

Getting a count of the added commands.

=head2 B<no_cmds>

Gives back true of there are no commands added.

=head2 B<server>

Get the L<Net::APE::Server> for the request

=head1 AUTHOR

Torsten Raudssus <torsten@raudssus.de> L<http://www.raudssus.de/>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Raudssus Social Software.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

