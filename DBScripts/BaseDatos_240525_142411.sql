-- convocatoria [cls1]
create table "public"."convocatoria" (
   "oid"  int4  not null,
   "desde"  date,
   "hasta"  date,
   "cargo"  int4,
  primary key ("oid")
);


