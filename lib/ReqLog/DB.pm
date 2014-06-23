package ReqLog::DB;

use Rose::DB;
our @ISA = qw(Rose::DB);

__PACKAGE__->use_private_registry;
__PACKAGE__->default_domain('production');
__PACKAGE__->default_type('main');

__PACKAGE__->register_db(
    domain      => 'test',
    type        => 'main',
    driver      => 'mysql',
    database    => 'reqlog_test',
    host        => 'localhost',
    username    => 'reqlog',
    password    => 'reqlog',
);

__PACKAGE__->register_db(
    domain      => 'development',
    type        => 'main',
    driver      => 'mysql',
    database    => 'reqlog_dev',
    host        => 'localhost',
    username    => 'reqlog',
    password    => 'reqlog',
);

__PACKAGE__->register_db(
    domain      => 'production',
    type        => 'main',
    driver      => 'mysql',
    database    => 'reqlog_prod',
    host        => 'localhost',
    username    => 'reqlog',
    password    => 'reqlog',
);

my $reqlog_table =<< "EOT";
DROP TABLE IF EXISTS reqlog;
CREATE TABLE reqlog (
    id                  bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    t                   int,
    req                 text,
    params              text,
    PRIMARY             KEY (id),
    UNIQUE              KEY id (id)
    ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

EOT

1;
