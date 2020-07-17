## Ferramentas

Para o consumo das funcionalidades do MonetDB podem ser utilizadas diversas linguagens de programação, como Python, R e C/C++. Para mais detalhes consulte a [documentação do projeto](https://www.monetdb.org/Documentation/Cookbooks/SQLrecipes/Clients).

Além das interfaces de clientes em várias linguagens, o MonetDB tem disponível também a ferramenta [mclient](https://www.monetdb.org/Documentation/Reference/MonetDBClientApplications/mclient), uma ferramenta de linha de comando que permite interação completa com Sistem Gerenciador de Banco de Dados. Com esta ferramenta é possível acessar o terminal interativo, bem como fazer importação e exportação de dados.

> Neste documento será feita a apresentação das formas de carregar dados com o mclient.

### Carregando dados - mclient

Considerando que os dados estejam disponíveis no formato `sql`, a importação desses pode ser feita da seguinte forma.

```shell
mclient -u monetdb -d db uf.prepared.sql --encoding=UTF-8 --log=a.log
```

Os dados carregados são os polígonos de unidades federativas do Brasil.

> Como apresentado [nesta discussão](https://www.monetdb.org/pipermail/users-list/2013-September/006788.html), o MonetDB não tem um utilitário como o shp2pgsql, então, para importar os dados geográficos foi feita a criação de alguns scripts, estes disponíveis no diretório [import-geospatial-data](import-geospatial-data).

### Exportando dados - mclient

