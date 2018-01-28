-- SALT=$(uuidgen) && echo SALT=$SALT && printf ${SALT}public | shasum -a 256

INSERT INTO mqtt_user (id,username,password,salt)
       SELECT 
			1,
			'client',
			'bc32109b3b03a6e3d272a42befd838e607a17e61912aee9ab09465f50fb630c8', -- public
			'EFE4F2D7-C80C-4ACF-B697-679798385A78'
       WHERE NOT EXISTS (SELECT 1 FROM mqtt_user WHERE id=1);
