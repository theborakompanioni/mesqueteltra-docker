DO
$do$
	BEGIN
		IF EXISTS (
		    SELECT *
		    FROM   pg_catalog.pg_tables 
		    WHERE  tablename  = 'mqtt_user'
		    ) THEN
		   RAISE NOTICE 'Table mqtt_user already exists.';
		ELSE
			CREATE TABLE mqtt_user (
			  id SERIAL primary key,
			  username character varying(100),
			  password character varying(100),
			  salt character varying(40)
			);
		END IF;
	END
$do$
