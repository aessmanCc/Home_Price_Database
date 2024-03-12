/* Login & User Credentials */

USE Homes_DB;
GO
/* Create Login for mixed sign in */
CREATE LOGIN User_Admin WITH PASSWORD =  'Password1234',
	CHECK_EXPIRATION = OFF,
	CHECK_POLICY = OFF,
	DEFAULT_DATABASE = Homes_DB
GO
/* Create User with default schema dbo */
CREATE USER User_Admin FOR LOGIN User_Admin
	WITH DEFAULT_SCHEMA = dbo
GO
/* Assign Permision to use/alter table */
GRANT SELECT, UPDATE, INSERT, DELETE, REFERENCES, ALTER ON OBJECT:: dbo.Rooms TO User_Admin;
GO
/* Assign Permission to use/alter view */
GRANT SELECT, UPDATE, INSERT, DELETE, REFERENCES, ALTER ON OBJECT:: dbo.oneBedroom TO User_Admin;