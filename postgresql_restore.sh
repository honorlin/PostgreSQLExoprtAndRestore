sh disconnect_all_users_from_postgresql.sh $2 $3
dropdb -U apps $2 -h $3
createdb -U apps $2 -h $3
psql -U apps $2 < $1 -h $3