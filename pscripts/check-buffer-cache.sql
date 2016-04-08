-- сколько сейчас в буфере или почему тормозит база
SELECT c.relname,
       count(*) AS buffers
FROM pg_class c
INNER JOIN pg_buffercache b ON b.relfilenode=c.relfilenode
INNER JOIN pg_database d ON (b.reldatabase=d.oid AND d.datname=current_database())
GROUP BY c.relname
ORDER BY 2 DESC LIMIT 10;
