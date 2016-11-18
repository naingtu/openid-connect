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

INSERT INTO system_scope (id, scope, description, icon, restricted, default_scope, structured, structured_param_description) VALUES
  (system_scope_seq.nextval, 'smart', 'Details of SMART authorization', 'user', 0, 0, 0, null);

INSERT INTO system_scope (id, scope, description, icon, restricted, default_scope, structured, structured_param_description) VALUES
  (system_scope_seq.nextval, 'smart/orchestrate_launch', 'Orchestrate a launch with EHR context', 'user', 0, 0, 0, null);

INSERT INTO system_scope (id, scope, description, icon, restricted, default_scope, structured, structured_param_description) VALUES
  (system_scope_seq.nextval, 'launch', 'Launch with an existing context', 'user', 0, 0, 0, null);

INSERT INTO system_scope (id, scope, description, icon, restricted, default_scope, structured, structured_param_description) VALUES
  (system_scope_seq.nextval, 'launch/patient', 'Launch with patient context', 'user', 0, 0, 0, null);

INSERT INTO system_scope (id, scope, description, icon, restricted, default_scope, structured, structured_param_description) VALUES
  (system_scope_seq.nextval, 'launch/encounter', 'Launch with encounter context', 'user', 0, 0, 0, null);

INSERT INTO system_scope (id, scope, description, icon, restricted, default_scope, structured, structured_param_description) VALUES
  (system_scope_seq.nextval, 'launch/resource', 'Launch with resource context', 'user', 0, 0, 0, null);


INSERT INTO system_scope (id, scope, description, icon, restricted, default_scope, structured, structured_param_description) VALUES
  (system_scope_seq.nextval, 'launch/other', 'Launch with other context', 'user', 0, 0, 0, null);

INSERT INTO system_scope (id, scope, description, icon, restricted, default_scope, structured, structured_param_description) VALUES
  (system_scope_seq.nextval, 'search', 'SMART on FHIR search', 'user', 0, 0, 0, null);

INSERT INTO system_scope (id, scope, description, icon, restricted, default_scope, structured, structured_param_description) VALUES
  (system_scope_seq.nextval, 'summary', 'SMART on FHIR summary', 'user', 0, 0, 0, null);
