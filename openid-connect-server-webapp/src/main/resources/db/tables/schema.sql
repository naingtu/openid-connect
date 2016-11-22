
CREATE TABLE access_token (
  id NUMBER PRIMARY KEY,
  token_value VARCHAR2(4000),
  expiration TIMESTAMP NULL,
  token_type VARCHAR2(256),
  refresh_token_id NUMBER(19),
  client_id NUMBER(19),
  auth_holder_id NUMBER(19),
  id_token_id NUMBER(19),
  approved_site_id NUMBER(19)
);

CREATE SEQUENCE access_token_seq START WITH 1;

CREATE TABLE access_token_permissions (
  access_token_id NUMBER(19) NOT NULL,
  permission_id NUMBER(19) NOT NULL
);

CREATE TABLE address (
  id NUMBER PRIMARY KEY,
  formatted VARCHAR2(256),
  street_address VARCHAR2(256),
  locality VARCHAR2(256),
  region VARCHAR2(256),
  postal_code VARCHAR2(256),
  country VARCHAR2(256)
);

CREATE SEQUENCE address_seq START WITH 1;

CREATE TABLE approved_site (
  id NUMBER PRIMARY KEY,
  user_id VARCHAR2(256),
  client_id VARCHAR2(256),
  creation_date TIMESTAMP NULL,
  access_date TIMESTAMP NULL,
  timeout_date TIMESTAMP NULL,
  whitelisted_site_id NUMBER(19)
);

CREATE SEQUENCE approved_site_seq START WITH 1;

CREATE TABLE approved_site_scope (
  owner_id NUMBER,
scope VARCHAR2(256)
  );

CREATE TABLE auth_holder (
  id NUMBER PRIMARY KEY,
  user_auth_id NUMBER(19),
  approved NUMBER(1), --BOOLEAN
  redirect_uri VARCHAR2(2048),
  client_id VARCHAR2(256)
);

CREATE SEQUENCE auth_holder_seq START WITH 1;

CREATE TABLE auth_holder_authority (
  owner_id NUMBER,
  authority VARCHAR2(256)
);

CREATE TABLE auth_holder_resource_id (
  owner_id NUMBER,
  resource_id VARCHAR2(2048)
);

CREATE TABLE auth_holder_response_type (
  owner_id NUMBER,
  response_type VARCHAR2(2048)
);

CREATE TABLE auth_holder_extension (
  owner_id NUMBER,
  extension VARCHAR2(2048),
  val VARCHAR2(2048)
);

CREATE TABLE auth_holder_scope (
  owner_id NUMBER,
scope VARCHAR2(2048)
  );

CREATE TABLE auth_holder_request_parameter (
  owner_id NUMBER,
  param VARCHAR2(2048),
  val VARCHAR2(2048)
);

CREATE TABLE saved_user_auth (
  id NUMBER PRIMARY KEY,
  name VARCHAR2(1024),
  authenticated NUMBER(1),--BOOLEAN,
  source_class VARCHAR2(2048)
);

CREATE SEQUENCE saved_user_auth_seq START WITH 1;

CREATE TABLE saved_user_auth_authority (
  owner_id NUMBER,
  authority VARCHAR2(256)
);

CREATE TABLE client_authority (
  owner_id NUMBER,
  authority VARCHAR2(256)
);

CREATE TABLE authorization_code (
  id NUMBER PRIMARY KEY,
  code VARCHAR2(256),
  auth_holder_id NUMBER(19),
  expiration TIMESTAMP NULL
);

CREATE SEQUENCE authorization_code_seq START WITH 1;

CREATE TABLE client_grant_type (
  owner_id NUMBER,
  grant_type VARCHAR2(2000)
);

CREATE TABLE client_response_type (
  owner_id NUMBER,
  response_type VARCHAR2(2000)
);

CREATE TABLE blacklisted_site (
  id NUMBER PRIMARY KEY,
  uri VARCHAR2(2048)
);

CREATE SEQUENCE blacklisted_site_seq START WITH 1;

CREATE TABLE client_details (
  id NUMBER PRIMARY KEY,
  client_description VARCHAR2(1024),
  reuse_refresh_tokens NUMBER(1) DEFAULT 1 NOT NULL, --boolean
  dynamically_registered NUMBER(1) DEFAULT 0 NOT NULL, --boolean
  allow_introspection NUMBER(1) DEFAULT 0 NOT NULL, --boolean
  id_token_validity_sec NUMBER(19) DEFAULT 600 NOT NULL, --bigint
  client_id VARCHAR2(256) UNIQUE,
  client_secret VARCHAR2(2048),
  access_token_validity_sec NUMBER(19),
  refresh_token_validity_sec NUMBER(19),
  application_type VARCHAR2(256),
  client_name VARCHAR2(256),
  token_endpoint_auth_method VARCHAR2(256),
  subject_type VARCHAR2(256),
  logo_uri VARCHAR2(2048),
  policy_uri VARCHAR2(2048),
  client_uri VARCHAR2(2048),
  tos_uri VARCHAR2(2048),
  jwks_uri VARCHAR2(2048),
  jwks VARCHAR2(4000), --this was 8192... let's see if 4,000 works
  sector_identifier_uri VARCHAR2(2048),
  request_object_sign_alg VARCHAR2(256),
  user_info_signed_resp_alg VARCHAR2(256),
  user_info_encr_resp_alg VARCHAR2(256),
  user_info_encr_resp_enc VARCHAR2(256),
  id_token_signed_resp_alg VARCHAR2(256),
  id_token_encr_resp_alg VARCHAR2(256),
  id_token_encr_resp_enc VARCHAR2(256),
  token_endpoint_auth_sign_alg VARCHAR2(256),
  default_max_age NUMBER(19),
  require_auth_time NUMBER(1), --BOOLEAN,
  created_at TIMESTAMP NULL,
  initiate_login_uri VARCHAR2(2048),
  clear_access_tokens_on_refresh NUMBER(1) DEFAULT 1 NOT NULL, --BOOLEAN
  software_statement VARCHAR2(4000),
  code_challenge_method VARCHAR2(256)
);

CREATE SEQUENCE client_details_seq START WITH 1;

CREATE TABLE client_request_uri (
  owner_id NUMBER,
  request_uri VARCHAR2(2000)
);

CREATE TABLE client_post_logout_redir_uri (
  owner_id NUMBER,
  post_logout_redirect_uri VARCHAR2(2000)
);

CREATE TABLE client_default_acr_value (
  owner_id NUMBER,
  default_acr_value VARCHAR2(2000)
);

CREATE TABLE client_contact (
  owner_id NUMBER,
  contact VARCHAR2(256)
);

CREATE TABLE client_redirect_uri (
  owner_id NUMBER,
  redirect_uri VARCHAR2(2048)
);

CREATE TABLE client_claims_redirect_uri (
  owner_id NUMBER,
  redirect_uri VARCHAR2(2048)
);

CREATE TABLE refresh_token (
  id NUMBER PRIMARY KEY,
  token_value VARCHAR2(4000),--4096
  expiration TIMESTAMP NULL,
  auth_holder_id NUMBER(19),
  client_id NUMBER(19)
);

CREATE SEQUENCE refresh_token_seq START WITH 1;

CREATE TABLE client_resource (
  owner_id NUMBER,
  resource_id VARCHAR2(256)
);

CREATE TABLE client_scope (
  owner_id NUMBER,
scope VARCHAR2(2048)
  );

CREATE TABLE token_scope (
  owner_id NUMBER,
scope VARCHAR2(2048)
  );

CREATE TABLE system_scope (
  id NUMBER PRIMARY KEY,
scope VARCHAR2(256) NOT NULL UNIQUE,
  description VARCHAR2(4000),--4096
  icon VARCHAR2(256),
restricted NUMBER(1) DEFAULT 0 NOT NULL, --boolean
  default_scope NUMBER(1) DEFAULT 0 NOT NULL, --boolean
  structured NUMBER(1) DEFAULT 0 NOT NULL, --boolean
  structured_param_description VARCHAR2(256)
);

CREATE SEQUENCE system_scope_seq START WITH 1;

CREATE TABLE user_info (
  id NUMBER PRIMARY KEY,
  sub VARCHAR2(256),
  preferred_username VARCHAR2(256),
  name VARCHAR2(256),
  given_name VARCHAR2(256),
  family_name VARCHAR2(256),
  middle_name VARCHAR2(256),
  nickname VARCHAR2(256),
  profile VARCHAR2(256),
  picture VARCHAR2(256),
  website VARCHAR2(256),
  email VARCHAR2(256),
  email_verified NUMBER(1), --BOOLEAN,
  gender VARCHAR2(256),
  zone_info VARCHAR2(256),
  locale VARCHAR2(256),
  phone_number VARCHAR2(256),
  phone_number_verified NUMBER(1), --BOOLEAN,
  address_id VARCHAR2(256),
  updated_time VARCHAR2(256),
  birthdate VARCHAR2(256),
  src VARCHAR2(4000)
);

CREATE SEQUENCE user_info_seq START WITH 1;

CREATE TABLE whitelisted_site (
  id NUMBER PRIMARY KEY,
  creator_user_id VARCHAR2(256),
  client_id VARCHAR2(256)
);

CREATE SEQUENCE whitelisted_site_seq START WITH 1;

CREATE TABLE whitelisted_site_scope (
  owner_id NUMBER,
scope VARCHAR2(256)
  );

CREATE TABLE pairwise_identifier (
  id NUMBER PRIMARY KEY,
  identifier VARCHAR2(256),
  sub VARCHAR2(256),
  sector_identifier VARCHAR2(2048)
);

CREATE SEQUENCE pairwise_identifier_seq START WITH 1;

CREATE TABLE resource_set (
  id NUMBER PRIMARY KEY,
  name VARCHAR2(1024) NOT NULL,
  uri VARCHAR2(1024),
  icon_uri VARCHAR2(1024),
  rs_type VARCHAR2(256),
  owner VARCHAR2(256) NOT NULL,
  client_id VARCHAR2(256)
);

CREATE SEQUENCE resource_set_seq START WITH 1;

CREATE TABLE resource_set_scope (
  owner_id NUMBER NOT NULL,
scope VARCHAR2(256) NOT NULL
);

CREATE TABLE permission_ticket (
  id NUMBER PRIMARY KEY,
  ticket VARCHAR2(256) NOT NULL,
  permission_id NUMBER(19) NOT NULL,
  expiration TIMESTAMP NULL
);

CREATE SEQUENCE permission_ticket_seq START WITH 1;

CREATE TABLE permission (
  id NUMBER PRIMARY KEY,
  resource_set_id NUMBER(19)
);

CREATE SEQUENCE permission_seq START WITH 1;

CREATE TABLE permission_scope (
  owner_id NUMBER NOT NULL,
scope VARCHAR2(256) NOT NULL
);

CREATE TABLE claim (
  id NUMBER PRIMARY KEY,
  name VARCHAR2(256),
  friendly_name VARCHAR2(1024),
  claim_type VARCHAR2(1024),
  claim_value VARCHAR2(1024)
);

CREATE SEQUENCE claim_seq START WITH 1;

CREATE TABLE claim_to_policy (
  policy_id NUMBER NOT NULL,
  claim_id NUMBER NOT NULL
);

CREATE TABLE claim_to_permission_ticket (
  permission_ticket_id NUMBER NOT NULL,
  claim_id NUMBER NOT NULL
);

CREATE TABLE policy (
  id NUMBER PRIMARY KEY,
  name VARCHAR2(1024),
  resource_set_id NUMBER(19)
);

CREATE SEQUENCE policy_seq START WITH 1;

CREATE TABLE policy_scope (
  owner_id NUMBER NOT NULL,
scope VARCHAR2(256) NOT NULL
);

CREATE TABLE claim_token_format (
  owner_id NUMBER NOT NULL,
  claim_token_format VARCHAR2(1024)
);

CREATE TABLE claim_issuer (
  owner_id NUMBER NOT NULL,
  issuer VARCHAR2(1024)
);

CREATE TABLE saved_registered_client (
  id NUMBER PRIMARY KEY,
  issuer VARCHAR2(1024),
  registered_client VARCHAR2(4000) --this was 8192... let's see if 4000 works
);

CREATE SEQUENCE saved_registered_client_seq START WITH 1;

CREATE INDEX at_tv_idx ON access_token(token_value);
CREATE INDEX ts_oi_idx ON token_scope(owner_id);
CREATE INDEX at_exp_idx ON access_token(expiration);
CREATE INDEX rf_ahi_idx ON refresh_token(auth_holder_id);
--CREATE INDEX cd_ci_idx ON client_details(client_id);

create table users(
      username varchar2(50) not null primary key,
      password varchar2(50) not null,
      enabled NUMBER(1) not null
);

create table authorities (
      username varchar2(50) not null,
      authority varchar2(50) not null,
      constraint fk_authorities_users foreign key(username) references users(username),
      constraint ix_authority unique (username,authority)
);
