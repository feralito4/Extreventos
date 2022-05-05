-- User [User]
alter table "public"."user"  add column  "fecha_alta"  varchar(255);


-- User_Eventos [rel1]
alter table "public"."eventos"  add column  "user_oid"  int4;
alter table "public"."eventos"   add constraint fk_eventos_user foreign key ("user_oid") references "public"."user" ("oid");


