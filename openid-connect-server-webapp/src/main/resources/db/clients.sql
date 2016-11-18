
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

INSERT INTO client_scope (owner_id, scope) VALUES (client_details_seq.currval, 'offline_access');
INSERT INTO client_scope (owner_id, scope) VALUES (client_details_seq.currval, 'patient/*.*');

INSERT INTO client_details (id, client_id, client_secret, client_name, dynamically_registered, refresh_token_validity_sec, access_token_validity_sec, id_token_validity_sec, allow_introspection) VALUES
	(client_details_seq.nextval, 'EMR', 'secret', 'EMR', 0, null, 3600, 600, 0);

INSERT INTO client_grant_type (owner_id, grant_type) VALUES
	(client_details_seq.currval, 'password');

INSERT INTO client_scope (owner_id, scope) VALUES (client_details_seq.currval, 'patient/*.*');
INSERT INTO client_scope (owner_id, scope) VALUES (client_details_seq.currval, 'launch');
INSERT INTO client_scope (owner_id, scope) VALUES (client_details_seq.currval, 'launch/patient');

INSERT INTO client_details (id, client_id, client_secret, client_name, dynamically_registered, refresh_token_validity_sec, access_token_validity_sec, id_token_validity_sec, allow_introspection) VALUES
	(client_details_seq.nextval, 'FHIR', 'secret', 'FHIR Server', 0, null, 3600, 600, 1);

