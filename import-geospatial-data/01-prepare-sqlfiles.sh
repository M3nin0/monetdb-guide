#!/bin/bash
#
# Script para a preparação dos dados a serem inseridos
#

# uf
shp2pgsql -c -g "geom" -s 4674 -i -I -t "2D" -W UTF-8 uf_2018.shp public.uf > uf.sql
sed -i 's/INSERT INTO "public"."uf" ("id","nome","sigla","geocodigo","regiao","regiao_sig",geom)/INSERT INTO uf (id,nome,sigla,geocodigo,regiao,regiao_sig,geom)/g' uf.sql
tail -n +13 uf.sql > uf.prepared.sql

# municípios
shp2pgsql -c -g "geom" -s 4674 -i -I -t "2D" -W UTF-8 municipios_2018.shp public.municipios > municipios.sql
sed -i 's/"public"."municipios" ("id","nome","geocodigo","uf","uf_sigla","uf_geocodi","regiao","regiao_sig",geom)/municipios (id,nome,geocodigo,uf,uf_sigla,uf_geocodi,regiao,regiao_sig,geom)/g' municipios.sql
tail -n +14 municipios.sql > municipios.prepared.sql

# focos (2020)
shp2pgsql -c -g "geom" -s 4326 -i -I -t "2D" -W UTF-8 focos_2020.shp public.focos_2020 > focos_2020.sql
sed -i 's/INSERT INTO "public"."focos_2020" ("__gid","datahora","satelite","pais","estado","municipio","bioma","diasemchuv","precipitac","riscofogo","latitude","longitude","frp",geom)/INSERT INTO focos_2020 (gid,datahora,satelite,pais,estado,municipio,bioma,diasemchuv,precipitac,riscofogo,latitude,longitude,frp,geom)/g' focos_2020.sql
tail -n +21 focos_2020.sql > focos_2020.prepared.sql
