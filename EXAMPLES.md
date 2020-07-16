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
```

```sql
SELECT 
    COUNT(f.geom) 
FROM 
    municipios_mbr AS ma,
    focos_2020 AS f 
WHERE 
    ST_Contains(ma.geom, f.geom) AND ma.nome = 'JACAREÍ';
```

Note que, testes foram realizados sem a criação do mbr e neste, as consultas foram muito demoradas.

