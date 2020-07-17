## Ferramentas

Para o consumo das funcionalidades do MonetDB podem ser utilizadas diversas linguagens de programação, como Python, R e C/C++. Para mais detalhes consulte a [documentação do projeto](https://www.monetdb.org/Documentation/Cookbooks/SQLrecipes/Clients). Além das interfaces de clientes em várias linguagens, o MonetDB tem disponível também a ferramenta [mclient](https://www.monetdb.org/Documentation/Reference/MonetDBClientApplications/mclient), uma ferramenta de linha de comando que permite interação completa com Sistem Gerenciador de Banco de Dados. Com esta ferramenta é possível acessar o terminal interativo, bem como fazer importação e exportação de dados.

Aqui são apresentadas algumas formas de importar/exportar dados do banco de dados.

### Carregando dados - mclient

Para a importação dos dados, neste exemplo será considerado a ferramenta mclient e um conjunto de instruções SQL. Desta forma, a importação dos dados pode ser feita da seguinte maneira.

```shell
mclient -u monetdb --encoding=UTF-8 --log=a.log -d db uf.prepared.sql
```

Os dados carregados são os polígonos de unidades federativas do Brasil.

> Como apresentado [nesta discussão](https://www.monetdb.org/pipermail/users-list/2013-September/006788.html), o MonetDB não tem um utilitário como o shp2pgsql, então, para importar os dados geográficos foi feita a criação de alguns scripts, estes disponíveis no diretório [import-geospatial-data](import-geospatial-data).

### Exportando dados - msqldump

Para exportar dados, o MonetDB tem em seu ecossistema a ferramenta [msqldump](https://www.monetdb.org/Documentation/Reference/MonetDBClientApplications/msqldump). Com esta ferramenta é possível exportar os dados em diferentes formatos. Abaixo é apresentado um exemplo de exportação do banco de dados `db`.

```shell
msqldump --database=db --host=localhost --user=monetdb --inserts > dump.sql
```

É importante notar que há muitas outras ferramentas e formas de trabalhar os dados no MonetDB. Caso esteja interessado, recomenda-se a consulta as páginas de [ferramentas Cliente/Servidor](https://www.monetdb.org/Documentation/Reference)

