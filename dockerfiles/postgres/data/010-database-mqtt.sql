DO
$do$
	BEGIN
		IF EXISTS (SELECT 1 FROM pg_database WHERE datname = 'mqtt') THEN
		   RAISE NOTICE 'Database mqtt already exists'; 
		ELSE
			CREATE EXTENSION dblink;
			PERFORM dblink_exec('dbname=' || current_database()  -- current db
			                     , 'CREATE DATABASE mqtt');
		END IF;
	END
$do$