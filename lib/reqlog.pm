package reqlog;
use Dancer ':syntax';

use strict;
use warnings;

use POSIX qw(strftime);

use ReqLog::DB;
use ReqLog::Manager;

our $VERSION = '0.1';

sub addToDb() {
    my ($t, $r, $p) = @_;

    my $n = ReqLog::ReqLog->new( t => $t, req => $r, params => $p );
    $n->save;
}

hook before => sub {
    my $route_handler = shift;

    &addToDb(time(), $route_handler->pattern, '');
};

get '/' => sub {
    template 'index';
};

get '/settings' => sub {
    template 'settings';
};

get '/list' => sub {
    my $reqlog = ReqLog::Manager->get_reqlog();
    my $count = scalar @$reqlog;
    my @r = ();

    for my $n (@$reqlog) {
        my %x = %$n;
        $x{'t'} = strftime "%Y-%m-%d %H:%M:%S", localtime($n->t);
        push(@r, \%x);
    }

    template 'list', {
        r => \@r,
        count => $count
    };
};

true;
