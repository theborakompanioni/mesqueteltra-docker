DO
$do$
	BEGIN
		IF EXISTS (
		    SELECT *
		    FROM   pg_catalog.pg_tables 
		    WHERE  tablename  = 'mqtt_acl'
		    ) THEN
		   RAISE NOTICE 'Table mqtt_acl already exists.';
		ELSE
			CREATE TABLE mqtt_acl (
			  id SERIAL primary key,
			  allow integer,
			  ipaddr character varying(60),
			  username character varying(100),
			  clientid character varying(100),
			  access  integer,
			  topic character varying(100)
			);
		END IF;
	END
$do$
