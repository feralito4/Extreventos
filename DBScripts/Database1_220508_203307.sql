-- Group [Group]
create table "public"."group" (
   "oid"  int4  not null,
   "groupname"  varchar(255),
  primary key ("oid")
);


-- Module [Module]
create table "public"."module" (
   "oid"  int4  not null,
   "moduleid"  varchar(255),
   "modulename"  varchar(255),
  primary key ("oid")
);


-- User [User]
create table "public"."user" (
   "oid"  int4  not null,
   "username"  varchar(255),
   "password"  varchar(255),
   "email"  varchar(255),
   "fecha_alta"  varchar(255),
  primary key ("oid")
);


-- tipoStand [ent12]
create table "public"."tipostand" (
   "oid"  int4  not null,
   "nombrecategoria"  varchar(255),
  primary key ("oid")
);


-- Categoria [ent16]
create table "public"."categoria" (
   "oid"  int4  not null,
   "nombrecategoria"  varchar(255),
  primary key ("oid")
);


-- PRODUCTOS [ent17]
create table "public"."productos" (
   "oid"  int4  not null,
   "nombreproducto"  varchar(255),
   "descripcionproducto"  text,
   "precioproducto"  float8,
   "unidadesproducto"  int4,
  primary key ("oid")
);


-- stand [ent18]
create table "public"."stand" (
   "oid"  int4  not null,
   "representante"  varchar(255),
   "nombre"  varchar(255),
   "preciototal"  int4,
   "cantidadtotal"  int4,
  primary key ("oid")
);


-- ProductosOferta [ent19]
create table "public"."productosoferta" (
   "productos_oid"  int4  not null,
   "porcentajedescuento"  float8,
   "preciocondescuento"  float8,
  primary key ("productos_oid")
);


-- Ubicacion [ent20]
create table "public"."ubicacion" (
   "oid"  int4  not null,
   "aforo"  int4,
   "direccion"  varchar(255),
   "nombre"  varchar(255),
   "precio_alquiler"  int4,
   "maxstands"  int4,
  primary key ("oid")
);


-- ubicacion-evento-fecha [ent21]
create table "public"."ubicacion_evento_fecha" (
   "fecha"  date  not null,
  primary key ("fecha")
);


-- Almacen [ent22]
create table "public"."almacen" (
   "oid"  int4  not null,
   "nombre"  varchar(255),
   "direccion"  varchar(255),
   "capacidadmaxima"  int4,
   "descripcion"  text,
  primary key ("oid")
);


-- ProductosAsignados [ent8]
create table "public"."productosasignados" (
   "oid"  int4  not null,
   "nombreproducto"  varchar(255),
   "descripcionproducto"  text,
   "precioproducto"  float8,
   "unidadesproducto"  int4,
  primary key ("oid")
);


-- Eventos [ent9]
create table "public"."eventos" (
   "oid"  int4  not null,
   "nombre"  varchar(255),
   "fecha"  date,
   "descripcion"  text,
   "precioentrada"  float8,
  primary key ("oid")
);


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table "public"."group"  add column  "module_oid"  int4;
alter table "public"."group"   add constraint fk_group_module foreign key ("module_oid") references "public"."module" ("oid");


-- Group_Module [Group2Module_Module2Group]
create table "public"."group_module" (
   "group_oid"  int4 not null,
   "module_oid"  int4 not null,
  primary key ("group_oid", "module_oid")
);
alter table "public"."group_module"   add constraint fk_group_module_group foreign key ("group_oid") references "public"."group" ("oid");
alter table "public"."group_module"   add constraint fk_group_module_module foreign key ("module_oid") references "public"."module" ("oid");


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table "public"."user"  add column  "group_oid"  int4;
alter table "public"."user"   add constraint fk_user_group foreign key ("group_oid") references "public"."group" ("oid");


-- User_Group [User2Group_Group2User]
create table "public"."user_group" (
   "user_oid"  int4 not null,
   "group_oid"  int4 not null,
  primary key ("user_oid", "group_oid")
);
alter table "public"."user_group"   add constraint fk_user_group_user foreign key ("user_oid") references "public"."user" ("oid");
alter table "public"."user_group"   add constraint fk_user_group_group foreign key ("group_oid") references "public"."group" ("oid");


-- User_Eventos [rel1]
alter table "public"."eventos"  add column  "user_oid"  int4;
alter table "public"."eventos"   add constraint fk_eventos_user foreign key ("user_oid") references "public"."user" ("oid");


-- stand_PRODUCTOS [rel10]
alter table "public"."productosasignados"  add column  "stand_oid"  int4;
alter table "public"."productosasignados"   add constraint fk_productosasignados_stand foreign key ("stand_oid") references "public"."stand" ("oid");


-- tipoStand_PRODUCTOS [rel11]
create table "public"."tipostand_productos" (
   "tipostand_oid"  int4 not null,
   "productos_oid"  int4 not null,
  primary key ("tipostand_oid", "productos_oid")
);
alter table "public"."tipostand_productos"   add constraint fk_tipostand_productos_tiposta foreign key ("tipostand_oid") references "public"."tipostand" ("oid");
alter table "public"."tipostand_productos"   add constraint fk_tipostand_productos_product foreign key ("productos_oid") references "public"."productos" ("oid");


-- ProductosAsignados_PRODUCTOS [rel12]
alter table "public"."productosasignados"  add column  "productos_oid"  int4;
alter table "public"."productosasignados"   add constraint fk_productosasignados_producto foreign key ("productos_oid") references "public"."productos" ("oid");


-- sitio-evento-fecha_sitio [rel14]
alter table "public"."ubicacion_evento_fecha"  add column  "ubicacion_oid"  int4;
alter table "public"."ubicacion_evento_fecha"   add constraint fk_ubicacion_evento_fecha_ubic foreign key ("ubicacion_oid") references "public"."ubicacion" ("oid");


-- Almacen_Categoria [rel15]
alter table "public"."categoria"  add column  "almacen_oid"  int4;
alter table "public"."categoria"   add constraint fk_categoria_almacen foreign key ("almacen_oid") references "public"."almacen" ("oid");


-- stand_tipoStand [rel16]
alter table "public"."stand"  add column  "tipostand_oid"  int4;
alter table "public"."stand"   add constraint fk_stand_tipostand foreign key ("tipostand_oid") references "public"."tipostand" ("oid");


-- stand_Eventos [rel17]
alter table "public"."stand"  add column  "eventos_oid"  int4;
alter table "public"."stand"   add constraint fk_stand_eventos foreign key ("eventos_oid") references "public"."eventos" ("oid");


-- Almacen_PRODUCTOS [rel18]
alter table "public"."productos"  add column  "almacen_oid"  int4;
alter table "public"."productos"   add constraint fk_productos_almacen foreign key ("almacen_oid") references "public"."almacen" ("oid");


-- Eventos_sitio-evento-fecha [rel4]
alter table "public"."ubicacion_evento_fecha"  add column  "eventos_oid"  int4;
alter table "public"."ubicacion_evento_fecha"   add constraint fk_ubicacion_evento_fecha_even foreign key ("eventos_oid") references "public"."eventos" ("oid");


-- GEN FK: ProductosOferta --> PRODUCTOS
alter table "public"."productosoferta"   add constraint fk_productosoferta_productos foreign key ("productos_oid") references "public"."productos" ("oid");


