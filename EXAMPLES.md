## Exemplos de consultas

Utilizando os dados de municípios, uf e focos de incêndio (2020), são apresentados alguns exemplos.

* Quais os municípios vizinhos de Ouro Preto em Minas Gerais?

```sql
SELECT
	nome, ma.geom
FROM
	municipios AS ma,
	(SELECT geom FROM municipios WHERE nome = 'OURO PRETO') AS ms
WHERE
	ST_Touches(
		ms.geom,
		ma.geom
	);
```

