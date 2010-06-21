package LBCPodcast::Controller::Root;
use Moose;
use namespace::autoclean;

use LWP::UserAgent;

BEGIN { extends 'Catalyst::Controller' }

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config(namespace => '');

=head1 NAME

LBCPodcast::Controller::Root - Root Controller for LBCPodcast

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=cut

sub ShowFeed :Chained('/') :PathPart('') :Args(1) {
	my ( $self, $c, $host ) = @_;

	my $base_url = $c->config->{base_url};

	if (defined(my $channel = $c->config->{channels}->{$host})) {
		$base_url .= $channel;

		$c->response->body( $base_url );

		my $username = $c->config->{credentials}->{username};
		my $password = $c->config->{credentials}->{password};

		my $browser = LWP::UserAgent->new();

		$browser->credentials(
			'lbc.audioagain.com:80',
			'AudioAgain Login',
			$username => $password
		);

		my $response = $browser->get($base_url);

		$c->response->body( $response->content );
	}
	else {
		$c->response->status(404);
		$c->response->body("$host is not a valid LBC podcast host.");
	}

}

=head1 AUTHOR

James Telford,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
