use Test::More tests => 6;

use strict;
use warnings;

use lib '../lib';

use Data::Dumper;

use ReqLog::DB;
use ReqLog::Manager;

my $domain = "test";

ReqLog::DB->default_domain($domain);

is (ReqLog::DB->default_domain, $domain, "default domain = $domain");

my $r;

my $t = time();

# remove all request log, if exist
my $c = ReqLog::Manager->delete_reqlog( all => 1 );

# now start to add a new one.
my $n = ReqLog::ReqLog->new(id => 1, t => $t, req => '/', params => '' );
$n->save;

$r = ReqLog::Manager->get_reqlog();

is (@$r, 1, "reqlog has one record");

my $x = @$r[0];

is($x->id, 1, "id = $x->{'id'}");
is($x->t, $t, "t = $x->{'t'}");
is($x->req, '/', "req = $x->{'req'}");

$n->delete;

$r = ReqLog::Manager->get_reqlog();
is (@$r, 0, "reqlog has zero record after delete");

1;
