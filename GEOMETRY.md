## Representação geométrica

Segundo a documentação do MonetDB, a representação geométrica é feita seguindo a OGC-SFS. Abaixo é feita a apresentação do diagrama de classes das geometrias suportadas.

![class_geometry]()

Como o MonetDB é um banco de dados modular, estas representações geométricas são feitas através de uma extensão nomeada [geom/GIS](https://www.monetdb.org/Documentation/ServerProgramming/ExtendingSQL/GeoSpatial).

### Operadores espaciais

MonetDB faz a implementação de vários operadores espaciais com o auxílio da biblioteca GEOS (Geometry Engine - Open Source). Alguns desses operadores são listados abaixo

- ST_Relate;
- ST_Intersection;
- ST_Intersects;
- ST_Overlaps;
- ST_Distance.

> Perceba que na [documentação oficial](https://www.monetdb.org/Documentation/ServerProgramming/ExtendingSQL/GeoSpatial/SpatialFunctions) os operadores estão com outros nomes, porém, conferindo o [código fonte](https://github.com/MonetDB/MonetDB/tree/master/geom) da extensão geom percebeu-se a mudança. O que deixou o uso das funcionalidades mais próximas com o que é feito no PostGIS.

Cabe lembrar que estas implementações, conforme indicado pela documentação, são as versões iniciais, que estão em constante desenvolvimento. Para saber sobre as demais operações consulte a página de [Funções espaciais do MonetDB](https://www.monetdb.org/Documentation/ServerProgramming/ExtendingSQL/GeoSpatial/SpatialFunctions).

### Matriz de 9 intersecções extendida dimensionalmente (DE-9IM)

Por seguir o padrão OGC-SFS, o MonetDB/geom implementa a DE-9IM em sua estrutura, disponibilizando também o operador `ST_Relate`, da mesma forma como é feito no PostGIS.

> Note que, na implementação deste operador, está implementado apenas a operação de comparação entre a relação de dois objetos e uma string (Que representa a DE-9IM resultante).

O mesmo exemplo apresentado na [documentação do PostGIS](https://postgis.net/docs/ST_Relate.html) pode ser reproduzido no MonetDB.

```sql
SELECT ST_Relate(ST_GeometryFromText('POINT(1 2)'), ST_Buffer(ST_GeometryFromText('POINT(1 2)'),2), '0FFFFF212');
```

e também

```sql
SELECT ST_Relate(ST_GeometryFromText('POINT(1 2)'), ST_Buffer(ST_GeometryFromText('POINT(1 2)'),2), '*FF*FF212');
```

