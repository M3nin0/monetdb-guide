/**
    Script para a criação das tabelas dos dados a serem importados.

    OBS: A criação foi feita separada para evitar problemas com os scripts de importação
*/

CREATE TABLE uf (gid serial, id float, nome varchar(50), sigla varchar(2), geocodigo varchar(2), regiao varchar(20), regiao_sig varchar(2), geom MULTIPOLYGON);
CREATE TABLE municipios (gid serial, id float, nome varchar(60), geocodigo varchar(7), uf varchar(50), uf_sigla varchar(2), uf_geocodi varchar(2), regiao varchar(20), regiao_sig varchar(2), geom MULTIPOLYGON);
CREATE TABLE focos_2020 (gid serial, datahora varchar(80), satelite varchar(80), pais varchar(80), estado varchar(80), municipio varchar(80), bioma varchar(80), diasemchuv int, precipitac numeric, riscofogo numeric, latitude numeric, longitude numeric, frp numeric, geom POINT);
