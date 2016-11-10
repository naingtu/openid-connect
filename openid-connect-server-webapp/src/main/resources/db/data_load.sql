--USERS


INSERT INTO users (username, password, enabled) VALUES ('admin','password',1);

INSERT INTO users (username, password, enabled) VALUES ('user','password',1);

INSERT INTO authorities (username, authority) VALUES  ('admin','ROLE_ADMIN');

INSERT INTO authorities (username, authority) VALUES  ('admin','ROLE_USER');

INSERT INTO authorities (username, authority) VALUES  ('user','ROLE_USER');

INSERT INTO user_info (id, sub, preferred_username, name, email, email_verified) VALUES
    (user_info_seq.nextval, '90342.ASDFJWFA','admin','Demo Admin','admin@example.com', 1);

INSERT INTO user_info (id, sub, preferred_username, name, email, email_verified) VALUES
    (user_info_seq.nextval, '01921.FLANRJQW','user','Demo User','user@example.com', 1);


--SCOPES

INSERT INTO system_scope (id, scope, description, icon, restricted, default_scope, structured, structured_param_description) VALUES
  (system_scope_seq.nextval, 'openid', 'log in using your identity', 'user', 0, 1, 0, null);

INSERT INTO system_scope (id, scope, description, icon, restricted, default_scope, structured, structured_param_description) VALUES
  (system_scope_seq.nextval, 'profile', 'basic profile information', 'list-alt', 0, 1, 0, null);

INSERT INTO system_scope (id, scope, description, icon, restricted, default_scope, structured, structured_param_description) VALUES
  (system_scope_seq.nextval, 'email', 'email address', 'envelope', 0, 1, 0, null);

INSERT INTO system_scope (id, scope, description, icon, restricted, default_scope, structured, structured_param_description) VALUES
  (system_scope_seq.nextval, 'address', 'physical address', 'home', 0, 1, 0, null);

INSERT INTO system_scope (id, scope, description, icon, restricted, default_scope, structured, structured_param_description) VALUES
  (system_scope_seq.nextval, 'phone', 'telephone number', 'bell', 0, 1, 0, null);

INSERT INTO system_scope (id, scope, description, icon, restricted, default_scope, structured, structured_param_description) VALUES
  (system_scope_seq.nextval, 'offline_access', 'offline access', 'time', 0, 0, 0, null);

INSERT INTO system_scope (id, scope, description, icon, restricted, default_scope, structured, structured_param_description) VALUES
  (system_scope_seq.nextval, 'online_access', 'offline access', 'time', 0, 0, 0, null);

INSERT INTO system_scope (id, scope, description, icon, restricted, default_scope, structured, structured_param_description) VALUES
  (system_scope_seq.nextval, 'launch/patient', 'Need patient context at launch time (FHIR Patient resource)', 'user', 0, 0, 0, null);

INSERT INTO system_scope (id, scope, description, icon, restricted, default_scope, structured, structured_param_description) VALUES
  (system_scope_seq.nextval, 'launch/encounter', 'Need encounter context at launch time (FHIR Encounter resource)', 'user', 0, 0, 0, null);

INSERT INTO system_scope (id, scope, description, icon, restricted, default_scope, structured, structured_param_description) VALUES
  (system_scope_seq.nextval, 'launch/location', 'Need location context at launch time (FHIR Location resource)', 'user', 0, 0, 0, null);

INSERT INTO system_scope (id, scope, description, icon, restricted, default_scope, structured, structured_param_description) VALUES
  (system_scope_seq.nextval, 'launch', 'Permission to obtain launch context when app is launched from an EHR', 'user', 0, 0, 0, null);

exec :next_id := system_scope_seq.nextval;

INSERT INTO system_scope (id, scope, description, icon, restricted, default_scope, structured, structured_param_description) VALUES
  (system_scope_seq.nextval, 'user/*.*', 'Permission to read and write all resources that the current user can access', 'user', 0, 0, 0, null);

INSERT INTO system_scope (id, scope, description, icon, restricted, default_scope, structured, structured_param_description) VALUES
  (system_scope_seq.nextval, 'patient/*.*', 'Permission to read/write any resource for the current patient', 'user', 0, 0, 0, null);

INSERT INTO system_scope (id, scope, description, icon, restricted, default_scope, structured, structured_param_description) VALUES
  (system_scope_seq.nextval, 'patient/*.read', 'Read Permission to read any resource for the current patient', 'user', 0, 0, 0, null);

INSERT INTO system_scope (id, scope, description, icon, restricted, default_scope, structured, structured_param_description) VALUES
  (system_scope_seq.nextval, 'patient/*.write', 'Write Permission to read any resource for the current patient', 'user', 0, 0, 0, null);

INSERT INTO system_scope (id, scope, description, icon, restricted, default_scope, structured, structured_param_description) VALUES
  (system_scope_seq.nextval, 'patient/Patient/*.*', 'Read/Write to FHIR Patient Resources', 'user', 0, 0, 0, null);

INSERT INTO system_scope (id, scope, description, icon, restricted, default_scope, structured, structured_param_description) VALUES
  (system_scope_seq.nextval, 'patient/Patient/*.read', 'Read to FHIR Patient Resources', 'user', 0, 0, 0, null);

INSERT INTO system_scope (id, scope, description, icon, restricted, default_scope, structured, structured_param_description) VALUES
  (system_scope_seq.nextval, 'patient/Patient/*.write', 'Write to FHIR Patient Resources', 'user', 0, 0, 0, null);

INSERT INTO system_scope (id, scope, description, icon, restricted, default_scope, structured, structured_param_description) VALUES
  (system_scope_seq.nextval, 'patient/Observation/*.*', 'Read/Write to FHIR Observations Resources', 'user', 0, 0, 0, null);

INSERT INTO system_scope (id, scope, description, icon, restricted, default_scope, structured, structured_param_description) VALUES
  (system_scope_seq.nextval, 'patient/Observation/*.read', 'Read to FHIR Observations Resources', 'user', 0, 0, 0, null);

INSERT INTO system_scope (id, scope, description, icon, restricted, default_scope, structured, structured_param_description) VALUES
  (system_scope_seq.nextval, 'patient/Observation/*.write', 'Write to FHIR Observations Resources', 'user', 0, 0, 0, null);


--Clients



INSERT INTO client_details (id, client_id, client_secret, client_name, dynamically_registered, refresh_token_validity_sec, access_token_validity_sec, id_token_validity_sec, allow_introspection) VALUES
	(client_details_seq.nextval, 'client', 'secret', 'Test Client', 0, null, 3600, 600, 1);

INSERT INTO client_scope (owner_id, scope) VALUES (client_details_seq.currval, 'openid');
INSERT INTO client_scope (owner_id, scope) VALUES (client_details_seq.currval, 'profile');
INSERT INTO client_scope (owner_id, scope) VALUES (client_details_seq.currval, 'email');
INSERT INTO client_scope (owner_id, scope) VALUES (client_details_seq.currval, 'address');
INSERT INTO client_scope (owner_id, scope) VALUES (client_details_seq.currval, 'phone');
INSERT INTO client_scope (owner_id, scope) VALUES (client_details_seq.currval, 'offline_access');

INSERT INTO client_redirect_uri (owner_id, redirect_uri) VALUES
	(client_details_seq.currval, 'http://localhost/');

INSERT INTO client_redirect_uri (owner_id, redirect_uri) VALUES
	(client_details_seq.currval, 'http://localhost:8080/');

INSERT INTO client_grant_type (owner_id, grant_type) VALUES
	(client_details_seq.currval, 'authorization_code');

INSERT INTO client_grant_type (owner_id, grant_type) VALUES
	(client_details_seq.currval, 'urn:ietf:params:oauth:grant_type:redelegate');

INSERT INTO client_grant_type (owner_id, grant_type) VALUES
	(client_details_seq.currval, 'refresh_token');

INSERT INTO client_grant_type (owner_id, grant_type) VALUES
	(client_details_seq.currval, 'authorization_code');

INSERT INTO client_details (id, client_id, client_secret, client_name, dynamically_registered, refresh_token_validity_sec, access_token_validity_sec, id_token_validity_sec, allow_introspection) VALUES
	(client_details_seq.nextval, 'CDS', 'secret', 'CDS', 0, null, 3600, 600, 0);

INSERT INTO client_grant_type (owner_id, grant_type) VALUES
	(client_details_seq.currval, 'urn:ietf:params:oauth:grant_type:redelegate');

INSERT INTO client_grant_type (owner_id, grant_type) VALUES
	(client_details_seq.currval, 'client_credentials');

INSERT INTO client_scope (owner_id, scope) VALUES (client_details_seq.currval, 'patient/*.*');
INSERT INTO client_scope (owner_id, scope) VALUES (client_details_seq.currval, 'offline_access');

INSERT INTO client_details (id, client_id, client_secret, client_name, dynamically_registered, refresh_token_validity_sec, access_token_validity_sec, id_token_validity_sec, allow_introspection) VALUES
	(client_details_seq.nextval, 'EMR', 'secret', 'EMR', 0, null, 3600, 600, 0);

INSERT INTO client_grant_type (owner_id, grant_type) VALUES
	(client_details_seq.currval, 'password');

INSERT INTO client_scope (owner_id, scope) VALUES (client_details_seq.currval, 'patient/*.*');
INSERT INTO client_scope (owner_id, scope) VALUES (client_details_seq.currval, 'offline_access');

INSERT INTO client_details (id, client_id, client_secret, client_name, dynamically_registered, refresh_token_validity_sec, access_token_validity_sec, id_token_validity_sec, allow_introspection) VALUES
	(client_details_seq.nextval, 'FHIR', 'secret', 'FHIR Server', 0, null, 3600, 600, 1);
