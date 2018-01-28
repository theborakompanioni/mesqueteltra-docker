#!/bin/sh

HOST=${HOST:-postgres}
PORT=${PORT:-5432}
export PGPASSWORD=${POSTGRES_PASSWORD}

psql -h ${HOST} -p ${PORT} --user ${POSTGRES_USER} -a -c 'SELECT 1;'
STATUS=$?
while [ ${STATUS} != 0 ] ; do
	printf "."
	sleep 1
	psql -h ${HOST} -p ${PORT} --user ${POSTGRES_USER} -a -c 'SELECT 1;'
	STATUS=$?
done

psql -h ${HOST} -p ${PORT} --user ${POSTGRES_USER} -a -f 010-database-mqtt.sql
psql -h ${HOST} -p ${PORT} --user ${POSTGRES_USER} -d ${POSTGRES_DB} -a -f 020-database-mqtt-table-user.sql
psql -h ${HOST} -p ${PORT} --user ${POSTGRES_USER} -d ${POSTGRES_DB} -a -f 020-database-mqtt-table-acl.sql
psql -h ${HOST} -p ${PORT} --user ${POSTGRES_USER} -d ${POSTGRES_DB} -a -f 030-database-mqtt-table-user.sql
psql -h ${HOST} -p ${PORT} --user ${POSTGRES_USER} -d ${POSTGRES_DB} -a -f 030-database-mqtt-table-acl.sql