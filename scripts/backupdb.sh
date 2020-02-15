cockroach dump bf --insecure > backup.sql
dato=$(date)
dato2=$(echo $dato | tr " " _)
scp /home/ubuntu/backup.sql ubuntu@192.168.128.124:/backup/backup_$dato2


 


