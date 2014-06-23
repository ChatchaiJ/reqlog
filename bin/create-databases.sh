#!/bin/bash


cat <<EOT | mysql mysql
drop database if exists reqlog_test;
drop database if exists reqlog_dev;
drop database if exists reqlog_prod;

create database reqlog_test;
create database reqlog_dev;
create database reqlog_prod;

grant all privileges on reqlog_test.* to 'reqlog'@'localhost' identified by 'reqlog';
grant all privileges on reqlog_dev.* to 'reqlog'@'localhost' identified by 'reqlog';
grant all privileges on reqlog_prod.* to 'reqlog'@'localhost' identified by 'reqlog';
EOT

for db in test dev prod; do

cat <<EOT | mysql reqlog_$db
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

done
