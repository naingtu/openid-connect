--
-- Turn off autocommit and start a transaction so that we can use the temp tables
--

SET AUTOCOMMIT FALSE;

START TRANSACTION;

--
-- Insert scope information into the temporary tables.
-- 

INSERT INTO system_scope_TEMP (scope, description, icon, restricted, default_scope, structured, structured_param_description) VALUES
  ('openid', 'log in using your identity', 'user', false, true, false, null),
  ('profile', 'basic profile information', 'list-alt', false, true, false, null),
  ('email', 'email address', 'envelope', false, true, false, null),
  ('address', 'physical address', 'home', false, true, false, null),
  ('phone', 'telephone number', 'bell', false, true, false, null),
  ('offline_access', 'offline access', 'time', false, false, false, null),
  ('online_access', 'offline access', 'time', false, false, false, null),
  ('launch/patient', 'Need patient context at launch time (FHIR Patient resource)', 'user', false, false, false, null),
  ('launch/encounter', 'Need encounter context at launch time (FHIR Encounter resource)', 'user', false, false, false, null),
  ('launch/location', 'Need location context at launch time (FHIR Location resource)', 'user', false, false, false, null),
  ('launch', 'Permission to obtain launch context when app is launched from an EHR', 'user', false, false, false, null),
  ('user/*.*', 'Permission to read and write all resources that the current user can access', 'user', false, false, false, null),
  ('patient/*.*', 'Permission to read/write any resource for the current patient', 'user', false, false, false, null),
  ('patient/*.read', 'Read Permission to read any resource for the current patient', 'user', false, false, false, null),
  ('patient/*.write', 'Write Permission to read any resource for the current patient', 'user', false, false, false, null),
  ('patient/Patient/*.*', 'Read/Write to FHIR Patient Resources', 'user', false, false, false, null),
  ('patient/Patient/*.read', 'Read to FHIR Patient Resources', 'user', false, false, false, null),
  ('patient/Patient/*.write', 'Write to FHIR Patient Resources', 'user', false, false, false, null),
  ('patient/Observation/*.*', 'Read/Write to FHIR Observations Resources', 'user', false, false, false, null),
  ('patient/Observation/*.read', 'Read to FHIR Observations Resources', 'user', false, false, false, null),
  ('patient/Observation/*.write', 'Write to FHIR Observations Resources', 'user', false, false, false, null);
  
--
-- Merge the temporary scopes safely into the database. This is a two-step process to keep scopes from being created on every startup with a persistent store.
--

MERGE INTO system_scope
	USING (SELECT scope, description, icon, restricted, default_scope, structured, structured_param_description FROM system_scope_TEMP) AS vals(scope, description, icon, restricted, default_scope, structured, structured_param_description)
	ON vals.scope = system_scope.scope
	WHEN NOT MATCHED THEN
	  INSERT (scope, description, icon, restricted, default_scope, structured, structured_param_description) VALUES(vals.scope, vals.description, vals.icon, vals.restricted, vals.default_scope, vals.structured, vals.structured_param_description);

COMMIT;

SET AUTOCOMMIT TRUE;
