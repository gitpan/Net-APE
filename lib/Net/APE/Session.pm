package Net::APE::Session;
BEGIN {
  $Net::APE::Session::AUTHORITY = 'cpan:GETTY';
}
BEGIN {
  $Net::APE::Session::VERSION = '0.003';
}
# ABSTRACT: A session to an ape server
use Moose;

use Net::APE::Request;
use Net::APE::Cmd::Connect;


has server => (
	is => 'ro',
	required => 1,
	isa => 'Net::APE::Server',
);

has sessid => (
	is => 'rw',
	isa => 'Str',
	predicate => 'has_sessid',
);

has chl => (
	is => 'rw',
	isa => 'Int',
	default => sub { 0 },
);

has cmds => (
	traits => ['Array'],
	is => 'ro',
	isa => 'ArrayRef[Net::APE::Cmd]',
	default => sub {[
		Net::APE::Cmd::Connect->new(),
	]},
	handles => {
		add_cmd => 'push',
		count_cmds => 'count',
		has_cmds => 'count',
		no_cmds => 'is_empty',
	},
);

sub next_chl {
	my $self = shift;
	my $chl = $self->chl;
	$self->chl($chl+1);
	return $chl;
}

sub next_request {
	my ( $self ) = @_;
	my $request = Net::APE::Request->new({
		server => $self->server,
	});
	for (@{$self->cmds}) {
		$_->sessid($self->sessid) if $self->has_sessid;
		$_->chl($self->next_chl);
		$request->add_cmd($_);
	}
	return $request;
}

sub next_response {
	my ( $self, @responses ) = @_;
	for my $response (@responses) {
		
	}
}

1;


__END__
=pod

=head1 NAME

Net::APE::Session - A session to an ape server

=head1 VERSION

version 0.003

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 METHODS

=head2 B<server>

Get the L<Net::APE::Server> for the session

=head2 B<sessid>

Get or set the L<Net::APE::Server> to send the commands

=head2 B<add_cmd($cmd)>

Adding an L<Net::APE::Cmd> object to the request

=head2 B<has_cmds>

=head2 B<count_cmds>

Getting a count of the added commands.

=head2 B<no_cmds>

Gives back true of there are no commands added.

=head1 AUTHOR

Torsten Raudssus <torsten@raudssus.de> L<http://www.raudssus.de/>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Raudssus Social Software.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

