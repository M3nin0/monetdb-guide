# MonetDB

Caracterização do banco de dados colunar MonetDB.

## Questões consideradas

Neste repositório as seguintes questões estão sendo consideradas

- [O sistema segue a OGC-SFS ou alguma outra especificação padrão?](GEOMETRY.md)
    - Qual o modelo geométrico suportado?
    - Quais os operadores espaciais suportados?
    - Relacionamentos espaciais baseado na DE9IM?

- [Quais os métodos de indexação espacial suportados?](SPATIAL_INDEX.md)

- [Sistema possui ferramentas para carga de dados?](TOOLS.md)
    - Como carregar dados?
    - Como exportar dados?

- [Exemplos de consultas](EXAMPLES.md)

## Executando

Para a execução do MonetDB ,faça a criação de um container com a imagem [https://hub.docker.com/r/monetdb/monetdb-r-docker/](monetdb-r-docker).

```shell
docker run -d -P -p 50000:50000 --name monetdb-data monetdb/monetdb-r-docker
```

Feito isto o sistema do banco de dados já estará disponível na porta `50000`. Para acessar use como usuário `monetdb` e como senha `monetdb`. Para mais informações consulte a [documentação da imagem](https://hub.docker.com/r/monetdb/monetdb-r-docker/).
