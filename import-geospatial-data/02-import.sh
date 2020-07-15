#!/bin/bash
#
# Script para a importação dos dados tratados para o banco de dados
#

# uf
mclient -u monetdb -d db uf.prepared.sql --encoding=UTF-8 --log=a.log

# municípios
mclient -u monetdb -d db municipios.prepared.sql --encoding=UTF-8 --log=b.log

# focos (2020)
mclient -u monetdb -d db focos_2020.prepared.sql --encoding=UTF-8 --log=c.log
