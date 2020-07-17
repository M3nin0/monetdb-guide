## Índice espacial

Os índices espaciais são utilizados para otimizar o tempo de execução de consultas espaciais em bancos de dados. No MonetDB, como apresentado na [documentação](https://www.monetdb.org/Documentation/ServerProgramming/ExtendingSQL/GeoSpatial), atualmente não há disponível indexação espacial. Como forma de contornar esta questão, o banco de dados disponibiliza um conjunto de funções que, trabalhando com as simplificações de *Minimum Bouding Rectangle* (mbr), busca melhorar a velocidade das consultas.

Isto é feito já que, com a representação dos dados no formato MBR, tem-se uma forma de filtro nos dados, o que pode tornar as consultas mais rápidas.

> Exemplos de uso destas funções estão disponíveis nos [Exemplos](EXAMPLES.md)

Cabe notar que, o tipo `mbr`, consumido por essas funções não segue o padrão OGC-SFS.

