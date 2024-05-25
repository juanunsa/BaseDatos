UPDATE "public"."application" 
SET refresh_token_validity = 2592000, 
    access_token_validity = 3600
WHERE app_id = 'BaseDatos';

