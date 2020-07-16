## Exemplos de consultas

Utilizando os dados de municípios, uf e focos de incêndio (2020), são apresentados alguns exemplos.

* Quais os municípios vizinhos de Jacareí em São Paulo?

```sql
SELECT
	nome, ma.geom
FROM
	municipios AS ma,
	(SELECT geom FROM municipios WHERE nome = 'JACAREÍ') AS ms
WHERE
	ST_Touches(
		ms.geom,
		ma.geom
	);
```
* Quantos focos de incêndio há em Jacareí ? 

Criando uma tabela de MBRs para acelerar a consulta, como apresentado na documentação.

```sql
CREATE TABLE municipios_mbr AS (
    SELECT *, mbr(geom) as geom_mbr FROM municipios
);

CREATE TABLE focos_2020_mbr AS (
    SELECT *, mbr(geom) as geom_mbr FROM focos_2020
);
```

```sql
SELECT 
    COUNT(f.gid) 
FROM 
    municipios_mbr AS ma, 
    focos_2020_mbr AS f 
WHERE 
    ST_Contains(ma.geom_mbr, f.geom_mbr) AND 
    ma.nome = 'SANTA ISABEL' AND ma.uf = 'SÃO PAULO';
```

Note que, testes foram realizados sem a criação do mbr e neste, as consultas foram muito demoradas.

* Focos de incêndio por unidade federativa

```sql
CREATE TABLE uf_mbr AS (
	SELECT *, mbr(geom) as geom_mbr FROM uf
);
```

```sql
SELECT
	u.nome, COUNT(f.gid) as qtdqueimada
FROM
	uf_mbr AS u,
	focos_2020_mbr AS f
WHERE
	ST_Contains(u.geom_mbr, f.geom_mbr)
GROUP BY
	u.nome
ORDER BY qtdqueimada ASC;
```

