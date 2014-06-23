package ReqLog::Object;

use ReqLog::DB;
use base qw(Rose::DB::Object);
sub init_db { ReqLog::DB->new }

1;
