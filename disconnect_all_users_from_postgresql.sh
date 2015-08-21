#!/usr/bin/env bash
# kill all connections to the postgres server

if [ -n "$1" ] ; then
  where="where pg_stat_activity.datname = '$1'"
  echo "killing all connections to database '$1'"
else
  where="where pg_stat_activity.datname in (select datname from pg_database where datname != 'postgres')"
  echo "killing all connections to database"
fi

cat <<-EOF | psql -U postgres -d postgres -h $2
SELECT pg_terminate_backend(pg_stat_activity.pid)
FROM pg_stat_activity
${where}
