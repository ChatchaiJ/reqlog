#!/usr/bin/perl -w-

package ReqLog::ReqLog;

use base 'ReqLog::Object';

__PACKAGE__->meta->setup
(
    table       => 'reqlog',
    columns     =>  
    [
        id              => { type => 'int', primary_key => 1 },
        t               => { type => 'int' },
        req             => { type => 'varchar', length => 255 },
        params          => { type => 'varchar', length => 255 },
    ],
);

1;
