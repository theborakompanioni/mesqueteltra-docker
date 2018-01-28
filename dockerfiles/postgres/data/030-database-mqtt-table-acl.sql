WITH data(id, allow, ipaddr, username, clientid, access, topic) AS (
VALUES
    (1,1,NULL,'$all',NULL,2,'#'),
    (2,0,NULL,'$all',NULL,1,'$SYS/#'),
    (3,0,NULL,'$all',NULL,1,'eq #'),
    (5,1,'127.0.0.1',NULL,NULL,2,'$SYS/#'),
    (6,1,'127.0.0.1',NULL,NULL,2,'#'),
    (7,1,NULL,'client',NULL,1,'/World/#')
)
INSERT INTO mqtt_acl (id, allow, ipaddr, username, clientid, access, topic)
SELECT d.id, d.allow, d.ipaddr, d.username, d.clientid, d.access, d.topic
FROM data d
WHERE NOT EXISTS (SELECT 1
                  FROM mqtt_acl a
                  WHERE a.id = d.id
                 );
