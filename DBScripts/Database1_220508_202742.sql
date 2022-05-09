-- Group [Group]
create table "public"."group_2" (
   "oid"  int4  not null,
   "groupname"  varchar(255),
  primary key ("oid")
);


-- Module [Module]
create table "public"."module_2" (
   "oid"  int4  not null,
   "moduleid"  varchar(255),
   "modulename"  varchar(255),
  primary key ("oid")
);


-- User [User]
create table "public"."user_2" (
   "oid"  int4  not null,
   "username"  varchar(255),
   "password"  varchar(255),
   "email"  varchar(255),
   "fecha_alta"  varchar(255),
  primary key ("oid")
);


-- tipoStand [ent12]
create table "public"."tipostand_2" (
   "oid"  int4  not null,
   "nombrecategoria"  varchar(255),
  primary key ("oid")
);


-- Categoria [ent16]
create table "public"."categoria_2" (
   "oid"  int4  not null,
   "nombrecategoria"  varchar(255),
  primary key ("oid")
);


-- PRODUCTOS [ent17]
create table "public"."productos_2" (
   "oid"  int4  not null,
   "nombreproducto"  varchar(255),
   "descripcionproducto"  text,
   "precioproducto"  float8,
   "unidadesproducto"  int4,
  primary key ("oid")
);


-- stand [ent18]
create table "public"."stand_2" (
   "oid"  int4  not null,
   "representante"  varchar(255),
   "nombre"  varchar(255),
   "preciototal"  int4,
   "cantidadtotal"  int4,
  primary key ("oid")
);


-- ProductosOferta [ent19]
create table "public"."productosoferta_2" (
   "productos_2_oid"  int4  not null,
   "porcentajedescuento"  float8,
   "preciocondescuento"  float8,
  primary key ("productos_2_oid")
);


-- Ubicacion [ent20]
create table "public"."ubicacion_2" (
   "oid"  int4  not null,
   "aforo"  int4,
   "direccion"  varchar(255),
   "nombre"  varchar(255),
   "precio_alquiler"  int4,
   "maxstands"  int4,
  primary key ("oid")
);


-- ubicacion-evento-fecha [ent21]
create table "public"."ubicacion_evento_fecha_2" (
   "fecha"  date  not null,
  primary key ("fecha")
);


-- Almacen [ent22]
create table "public"."almacen_2" (
   "oid"  int4  not null,
   "nombre"  varchar(255),
   "direccion"  varchar(255),
   "capacidadmaxima"  int4,
   "descripcion"  text,
  primary key ("oid")
);


-- ProductosAsignados [ent8]
create table "public"."productosasignados_2" (
   "oid"  int4  not null,
   "nombreproducto"  varchar(255),
   "descripcionproducto"  text,
   "precioproducto"  float8,
   "unidadesproducto"  int4,
  primary key ("oid")
);


-- Eventos [ent9]
create table "public"."eventos_2" (
   "oid"  int4  not null,
   "nombre"  varchar(255),
   "fecha"  date,
   "descripcion"  text,
   "precioentrada"  float8,
  primary key ("oid")
);


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table "public"."group_2"  add column  "module_2_oid"  int4;
alter table "public"."group_2"   add constraint fk_group_2_module_2 foreign key ("module_2_oid") references "public"."module_2" ("oid");


-- Group_Module [Group2Module_Module2Group]
create table "public"."group_module_2" (
   "group_2_oid"  int4 not null,
   "module_2_oid"  int4 not null,
  primary key ("group_2_oid", "module_2_oid")
);
alter table "public"."group_module_2"   add constraint fk_group_module_2_group_2 foreign key ("group_2_oid") references "public"."group_2" ("oid");
alter table "public"."group_module_2"   add constraint fk_group_module_2_module_2 foreign key ("module_2_oid") references "public"."module_2" ("oid");


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table "public"."user_2"  add column  "group_2_oid"  int4;
alter table "public"."user_2"   add constraint fk_user_2_group_2 foreign key ("group_2_oid") references "public"."group_2" ("oid");


-- User_Group [User2Group_Group2User]
create table "public"."user_group_2" (
   "user_2_oid"  int4 not null,
   "group_2_oid"  int4 not null,
  primary key ("user_2_oid", "group_2_oid")
);
alter table "public"."user_group_2"   add constraint fk_user_group_2_user_2 foreign key ("user_2_oid") references "public"."user_2" ("oid");
alter table "public"."user_group_2"   add constraint fk_user_group_2_group_2 foreign key ("group_2_oid") references "public"."group_2" ("oid");


-- User_Eventos [rel1]
alter table "public"."eventos_2"  add column  "user_2_oid"  int4;
alter table "public"."eventos_2"   add constraint fk_eventos_2_user_2 foreign key ("user_2_oid") references "public"."user_2" ("oid");


-- stand_PRODUCTOS [rel10]
alter table "public"."productosasignados_2"  add column  "stand_2_oid"  int4;
alter table "public"."productosasignados_2"   add constraint fk_productosasignados_2_stand foreign key ("stand_2_oid") references "public"."stand_2" ("oid");


-- tipoStand_PRODUCTOS [rel11]
create table "public"."tipostand_productos_2" (
   "tipostand_2_oid"  int4 not null,
   "productos_2_oid"  int4 not null,
  primary key ("tipostand_2_oid", "productos_2_oid")
);
alter table "public"."tipostand_productos_2"   add constraint fk_tipostand_productos_2_tipos foreign key ("tipostand_2_oid") references "public"."tipostand_2" ("oid");
alter table "public"."tipostand_productos_2"   add constraint fk_tipostand_productos_2_produ foreign key ("productos_2_oid") references "public"."productos_2" ("oid");


-- ProductosAsignados_PRODUCTOS [rel12]
alter table "public"."productosasignados_2"  add column  "productos_2_oid"  int4;
alter table "public"."productosasignados_2"   add constraint fk_productosasignados_2_produc foreign key ("productos_2_oid") references "public"."productos_2" ("oid");


-- sitio-evento-fecha_sitio [rel14]
alter table "public"."ubicacion_evento_fecha_2"  add column  "ubicacion_2_oid"  int4;
alter table "public"."ubicacion_evento_fecha_2"   add constraint fk_ubicacion_evento_fecha_2_ub foreign key ("ubicacion_2_oid") references "public"."ubicacion_2" ("oid");


-- Almacen_Categoria [rel15]
alter table "public"."categoria_2"  add column  "almacen_2_oid"  int4;
alter table "public"."categoria_2"   add constraint fk_categoria_2_almacen_2 foreign key ("almacen_2_oid") references "public"."almacen_2" ("oid");


-- stand_tipoStand [rel16]
alter table "public"."stand_2"  add column  "tipostand_2_oid"  int4;
alter table "public"."stand_2"   add constraint fk_stand_2_tipostand_2 foreign key ("tipostand_2_oid") references "public"."tipostand_2" ("oid");


-- stand_Eventos [rel17]
alter table "public"."stand_2"  add column  "eventos_2_oid"  int4;
alter table "public"."stand_2"   add constraint fk_stand_2_eventos_2 foreign key ("eventos_2_oid") references "public"."eventos_2" ("oid");


-- Almacen_PRODUCTOS [rel18]
alter table "public"."productos_2"  add column  "almacen_2_oid"  int4;
alter table "public"."productos_2"   add constraint fk_productos_2_almacen_2 foreign key ("almacen_2_oid") references "public"."almacen_2" ("oid");


-- Eventos_sitio-evento-fecha [rel4]
alter table "public"."ubicacion_evento_fecha_2"  add column  "eventos_2_oid"  int4;
alter table "public"."ubicacion_evento_fecha_2"   add constraint fk_ubicacion_evento_fecha_2_ev foreign key ("eventos_2_oid") references "public"."eventos_2" ("oid");


-- GEN FK: ProductosOferta --> PRODUCTOS
alter table "public"."productosoferta_2"   add constraint fk_productosoferta_2_productos foreign key ("productos_2_oid") references "public"."productos_2" ("oid");


