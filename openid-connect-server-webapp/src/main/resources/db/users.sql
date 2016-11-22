
INSERT INTO users (username, password, enabled) VALUES ('admin','password',1);

INSERT INTO users (username, password, enabled) VALUES ('user','password',1);

INSERT INTO authorities (username, authority) VALUES  ('admin','ROLE_ADMIN');

INSERT INTO authorities (username, authority) VALUES  ('admin','ROLE_USER');

INSERT INTO authorities (username, authority) VALUES  ('user','ROLE_USER');

INSERT INTO user_info (id, sub, preferred_username, name, email, email_verified) VALUES
    (user_info_seq.nextval, '90342.ASDFJWFA','admin','Demo Admin','admin@example.com', 1);

INSERT INTO user_info (id, sub, preferred_username, name, email, email_verified) VALUES
    (user_info_seq.nextval, '01921.FLANRJQW','user','Demo User','user@example.com', 1);
