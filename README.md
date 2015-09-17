# PostgreSQLExoprtAndRestore
###備份方式

>因為備份的Role和還原的Role如果不同 會出現錯誤, 所以備份使用以下方式

pg_dump --no-owner --no-acl blah > blah.psql

###還原方式

Very Easy 

```
postgresql_restore.sh {source} {distination} {server_ip}
```

Example :
```
postgresql_restore.sh mydb.sql shopdb 192.168.1.88

```


