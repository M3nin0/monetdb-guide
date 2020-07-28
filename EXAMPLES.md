## Exemplos de consultas

Utilizando os dados de municípios, uf e focos de incêndio (2020), são apresentados alguns exemplos.

* Quais os municípios vizinhos de Jacareí em São Paulo?

```sql
CREATE TABLE municipios_mbr AS (
    SELECT *, mbr(geom) as geom_mbr FROM municipios
);
```

```sql
SELECT
 	ma.nome
FROM
	municipios_mbr AS ma,
	(SELECT * FROM municipios_mbr WHERE nome = 'JACAREÍ') AS ms
WHERE
	mbr_overlap(ms.geom_mbr, ma.geom_mbr) AND
	ST_Touches(
		ms.geom,
		ma.geom
    	);
```
* Quantos focos de incêndio há em Santarém ? 

```sql
SELECT
	COUNT(f.gid)
FROM
	municipios AS ma,
	focos_2020 AS f
WHERE
	ma.nome = 'SANTARÉM' AND ma.uf = 'PARÁ' AND
	ST_Contains(ma.geom, f.geom);
```

* Quantos focos de incêndio há próximo ao ponto (-55.557, -1.992) ?

```sql
SELECT
	COUNT(*)
FROM
	focos_2020 AS f
WHERE
	ST_DWithin(
           ST_SetSRID(f.geom, 4674),
           ST_GeomFromText('POINT(-55.577 -1.992)', 4674),
           2.0
       );
```
