package ReqLog::Manager;

use base 'Rose::DB::Object::Manager';
sub object_class { 'ReqLog::ReqLog' }
__PACKAGE__->make_manager_methods('reqlog');

1;
