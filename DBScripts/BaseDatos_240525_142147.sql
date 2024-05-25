-- Device [Device]
create table "public"."device" (
   "oid"  int4  not null,
   "device_id"  varchar(255),
   "notification_device_id"  varchar(255),
   "model"  varchar(255),
   "platform"  varchar(255),
   "platform_version"  varchar(255),
   "browser"  varchar(255),
  primary key ("oid")
);


-- User [User]
create table "public"."user" (
   "user_id"  varchar(255)  not null,
   "secret_key"  varchar(255),
  primary key ("user_id")
);


-- Authorized Grant Type [authAgt]
create table "public"."authorized_grant_type" (
   "oid"  int4  not null,
   "name"  varchar(255),
  primary key ("oid")
);


-- Application [authApl]
create table "public"."application" (
   "app_id"  varchar(255)  not null,
   "refresh_token_validity"  int4,
   "access_token_validity"  int4,
   "authorities"  varchar(255),
   "secret"  varchar(255),
   "description"  varchar(255),
   "name"  varchar(255),
   "type"  varchar(255),
  primary key ("app_id")
);


-- Approval [authApv]
create table "public"."approval" (
   "updated_at"  timestamp,
   "expiration_date"  timestamp,
   "status"  varchar(255),
   "scope"  varchar(255),
   "oid"  int4  not null,
  primary key ("oid")
);


-- Claim [authClaim]
create table "public"."claim" (
   "oid"  int4  not null,
   "key"  varchar(255),
   "value"  varchar(1000),
  primary key ("oid")
);


-- Code [authCod]
create table "public"."code" (
   "code"  varchar(255)  not null,
   "authentication"  varchar(255),
   "authenticationblob"  oid,
   "creation_date"  timestamp,
  primary key ("code")
);


-- Identity [authIdy]
create table "public"."identity" (
   "expired"  bool,
   "locked"  bool,
   "password"  varchar(255),
   "user_id"  varchar(255)  not null,
   "disabled"  bool,
   "attempts_number"  int4,
   "password_expiration_date"  timestamp,
   "email"  varchar(255),
   "auth_admin"  bool,
   "first_name"  varchar(255),
   "last_name"  varchar(255),
  primary key ("user_id")
);


-- Refresh Token [authRft]
create table "public"."refresh_token" (
   "oid"  int4  not null,
   "token"  varchar(2500),
   "expiration_date"  timestamp,
  primary key ("oid")
);


-- Authorized Resource [authRsc]
create table "public"."authorized_resource" (
   "oid"  int4  not null,
   "name"  varchar(255),
  primary key ("oid")
);


-- Scope [authScp]
create table "public"."scope" (
   "oid"  int4  not null,
   "auto_approve"  bool,
   "name"  varchar(255),
  primary key ("oid")
);


-- Redirect Uri [authUri]
create table "public"."redirect_uri" (
   "oid"  int4  not null,
   "url"  varchar(255),
  primary key ("oid")
);


-- AuthorizedGrantType_Application [authAgt_Apl]
alter table "public"."authorized_grant_type"  add column  "application_app_id"  varchar(255);
alter table "public"."authorized_grant_type"   add constraint fk_authorized_grant_type_appli foreign key ("application_app_id") references "public"."application" ("app_id");


-- Approval_Application [authApv_Apl]
alter table "public"."approval"  add column  "application_app_id"  varchar(255);
alter table "public"."approval"   add constraint fk_approval_application foreign key ("application_app_id") references "public"."application" ("app_id");


-- Approval_Identity [authApv_Idy]
alter table "public"."approval"  add column  "identity_user_id"  varchar(255);
alter table "public"."approval"   add constraint fk_approval_identity foreign key ("identity_user_id") references "public"."identity" ("user_id");


-- Claim_Identity [authClaim_Idy]
create table "public"."claim_identity" (
   "claim_oid"  int4 not null,
   "identity_user_id"  varchar(255) not null,
  primary key ("claim_oid", "identity_user_id")
);
alter table "public"."claim_identity"   add constraint fk_claim_identity_claim foreign key ("claim_oid") references "public"."claim" ("oid");
alter table "public"."claim_identity"   add constraint fk_claim_identity_identity foreign key ("identity_user_id") references "public"."identity" ("user_id");


-- Device_Application [authDevice_Apl]
alter table "public"."device"  add column  "application_app_id"  varchar(255);
alter table "public"."device"   add constraint fk_device_application foreign key ("application_app_id") references "public"."application" ("app_id");


-- Device_Identity [authDevice_Idy]
alter table "public"."device"  add column  "identity_user_id"  varchar(255);
alter table "public"."device"   add constraint fk_device_identity foreign key ("identity_user_id") references "public"."identity" ("user_id");


-- RefreshToken_Application [authRft_Apl]
alter table "public"."refresh_token"  add column  "application_app_id"  varchar(255);
alter table "public"."refresh_token"   add constraint fk_refresh_token_application foreign key ("application_app_id") references "public"."application" ("app_id");


-- RefreshToken_Identity [authRft_Idy]
alter table "public"."refresh_token"  add column  "identity_user_id"  varchar(255);
alter table "public"."refresh_token"   add constraint fk_refresh_token_identity foreign key ("identity_user_id") references "public"."identity" ("user_id");


-- AuthorizedResource_Application [authRsc_Apl]
alter table "public"."authorized_resource"  add column  "application_app_id"  varchar(255);
alter table "public"."authorized_resource"   add constraint fk_authorized_resource_applica foreign key ("application_app_id") references "public"."application" ("app_id");


-- Scope_Application [authScp_Apl]
alter table "public"."scope"  add column  "application_app_id"  varchar(255);
alter table "public"."scope"   add constraint fk_scope_application foreign key ("application_app_id") references "public"."application" ("app_id");


-- RedirectUri_Application [authUri_Apl]
alter table "public"."redirect_uri"  add column  "application_app_id"  varchar(255);
alter table "public"."redirect_uri"   add constraint fk_redirect_uri_application foreign key ("application_app_id") references "public"."application" ("app_id");


