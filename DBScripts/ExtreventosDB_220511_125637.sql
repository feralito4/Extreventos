-- ProductosAsignados [ent8]
create table "public"."productosasignados" (
   "oid"  int4  not null,
   "nombreproducto"  varchar(255),
   "descripcionproducto"  text,
   "precioproducto"  float8,
   "unidadesproducto"  int4,
  primary key ("oid")
);


