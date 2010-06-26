package LBCPodcast::Controller::Podcaster;

use Moose;
use namespace::autoclean;
use LWP::UserAgent;

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

LBCPodcast::Controller::Podcaster - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub ShowFeed :Chained('/') :PathPart('channel') :Args(1) {
	my ( $self, $c, $host ) = @_;

	my $base_url = $c->config->{base_url};

	if (defined(my $channel = $c->config->{channels}->{$host})) {
		$base_url .= $channel;

		my $username = $c->config->{credentials}->{username};
		my $password = $c->config->{credentials}->{password};

		my $browser = LWP::UserAgent->new();

		$browser->credentials(
			'lbc.audioagain.com:80',
			'AudioAgain Login',
			$username => $password
		);

		my $response = $browser->get($base_url);	
		my $content = $response->content;
		$content =~ s/\/shared\/podcast\.xsl/$base_url\/shared\/podcast\.xsl/;
	
		$c->response->body($content);
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
