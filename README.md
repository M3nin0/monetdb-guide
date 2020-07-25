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

Caso queira, está disponível a imagem [m3nin0/bdgeo-monetdb](https://hub.docker.com/r/m3nin0/bdgeo-monetdb), que já vem com os dados de focos de incêndio 2020 (Tabela `focos_2020`), estados (Tabela `uf`) e municípios (Tabela `municipios`), utilizados na disciplina CAP-349. Para utilizar esta imagem, o seguinte comando pode ser utilizado.

```shell
docker run -d -P -p 50000:50000 --name monetdb-data-bdgeo m3nin0/bdgeo-monetdb
```

> As credenciais e formas de acesso continuam as mesmas informadas anteriormente.
