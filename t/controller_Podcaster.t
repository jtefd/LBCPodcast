use strict;
use warnings;
use Test::More;

BEGIN { use_ok 'Catalyst::Test', 'LBCPodcast' }
BEGIN { use_ok 'LBCPodcast::Controller::Podcaster' }

ok( request('/podcaster')->is_success, 'Request should succeed' );
done_testing();
