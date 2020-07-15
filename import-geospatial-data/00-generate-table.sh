
CREATE TABLE uf (gid serial, id float, nome varchar(50), sigla varchar(2), geocodigo varchar(2), regiao varchar(20), regiao_sig varchar(2), geom MULTIPOLYGON);

CREATE TABLE municipios (gid serial, id float, nome varchar(60), geocodigo varchar(7), uf varchar(50), uf_sigla varchar(2), uf_geocodi varchar(2), regiao varchar(20), regiao_sig varchar(2), geom MULTIPOLYGON);
