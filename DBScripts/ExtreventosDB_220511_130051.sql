-- stand_PRODUCTOS [rel10]
alter table "public"."productosasignados"  add column  "stand_oid"  int4;
alter table "public"."productosasignados"   add constraint fk_productosasignados_stand foreign key ("stand_oid") references "public"."stand" ("oid");


-- ProductosAsignados_PRODUCTOS [rel12]
alter table "public"."productosasignados"  add column  "productos_oid"  int4;
alter table "public"."productosasignados"   add constraint fk_productosasignados_producto foreign key ("productos_oid") references "public"."productos" ("oid");


