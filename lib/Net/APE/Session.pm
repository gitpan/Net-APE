package Net::APE::Session;
use Moose;

use Net::APE::Request;
use Net::APE::Cmd::Connect;

=head1 NAME

Net::APE::Session - A session to an ape server

=head1 SYNOPSIS
	
=head1 DESCRIPTION

=cut

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

=pod

=head1 METHODS

=item B<server>

Get the L<Net::APE::Server> for the session

=item B<sessid>

Get or set the L<Net::APE::Server> to send the commands

=item B<add_cmd($cmd)>

Adding an L<Net::APE::Cmd> object to the request

=item B<has_cmds>

=item B<count_cmds>

Getting a count of the added commands.

=item B<no_cmds>

Gives back true of there are no commands added.

=over 4

=head1 AUTHOR

Torsten Raudssus <torsten@raudssus.de>

=head1 COPYRIGHT & LICENSE 

Copyright 2010 Torsten Raudssus, all rights reserved.

This library is free software; you can redistribute it and/or modify it under the same terms as 
Perl itself, either Perl version 5.8.8 or, at your option, any later version of Perl 5 you may 
have available.

=cut
