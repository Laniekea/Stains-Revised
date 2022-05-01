CREATE DATABASE IF NOT EXISTS stains;
USE stains;
 
CREATE TABLE IF NOT EXISTS lookupemploymenttypes (
    id int NOT NULL AUTO_INCREMENT,
    typename varchar(255),
    PRIMARY KEY(id)
);
 
CREATE TABLE IF NOT EXISTS lookuppermissions (
    id int NOT NULL AUTO_INCREMENT,
    permissionname varchar(255),
    datecreated date,
    PRIMARY KEY(id)
);
 
CREATE TABLE IF NOT EXISTS userroles (
    id int NOT NULL AUTO_INCREMENT,
    rolename varchar(255),
    PRIMARY KEY(id)
);
 
CREATE TABLE IF NOT EXISTS techstacks (
    id int NOT NULL AUTO_INCREMENT,
    techname varchar(255),
    datecreated date, 
    PRIMARY KEY(id)
);
 
CREATE TABLE IF NOT EXISTS features (
    id int NOT NULL AUTO_INCREMENT,
    featurename varchar(255),
    PRIMARY KEY(id)
);
 
CREATE TABLE IF NOT EXISTS users (
    id int NOT NULL AUTO_INCREMENT,
    firstname varchar(255),
    lastname varchar(255),
    email varchar(255) NOT NULL UNIQUE,
    employmenttypeid int, 
    phonenumber varchar(15), 
    datecreated date, 
    contractstartdate date,
    contractenddate date,
    dailyrate float,
    PRIMARY KEY(id),
    CONSTRAINT fk_employmenttype FOREIGN KEY (employmenttypeid) REFERENCES lookupemploymenttypes(id)
);

CREATE TABLE IF NOT EXISTS userslogin (
    id int NOT NULL AUTO_INCREMENT,
    userid int,
    datelogin datetime,
    PRIMARY KEY (id),
    CONSTRAINT fk_userlogid FOREIGN KEY (userid) REFERENCES users(id)
);
 
CREATE TABLE IF NOT EXISTS userstechstacks ( 
    id int NOT NULL AUTO_INCREMENT,
    userid int,
    techstackid int,
    skilllevel int, 
    PRIMARY KEY(id),
    CONSTRAINT fk_user FOREIGN KEY (userid) REFERENCES users(id),
    CONSTRAINT fk_techstack FOREIGN KEY (techstackid) REFERENCES techstacks(id)
);
 
CREATE TABLE IF NOT EXISTS authorizations (
    id int NOT NULL AUTO_INCREMENT,
    userroleid int,
    featureid int,
    permissionid int, 
    PRIMARY KEY(id),
    CONSTRAINT fk_userrole FOREIGN KEY (userroleid) REFERENCES userroles(id),
    CONSTRAINT fk_feature FOREIGN KEY (featureid) REFERENCES features(id),
    CONSTRAINT fk_permission FOREIGN KEY (permissionid) REFERENCES lookuppermissions(id)
);
 
CREATE TABLE IF NOT EXISTS lookupauditlogobjects ( 
    id int NOT NULL AUTO_INCREMENT,
    name varchar(255),
    datecreated date,
    PRIMARY KEY (id)
);
 
CREATE TABLE IF NOT EXISTS lookupauditlogactions (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(255),
    datecreated date,
    PRIMARY KEY (id)
);
 
CREATE TABLE IF NOT EXISTS auditlogs ( 
    id int NOT NULL AUTO_INCREMENT,
    userid int, 
    datecreated date, 
    auditlogobjectid int,
    auditlogactionid int, 
    valueorigin varchar(255), 
    valuenew varchar(255), 
    PRIMARY KEY (id),
    CONSTRAINT fk_userid FOREIGN KEY (userid) REFERENCES users(id),
    CONSTRAINT fk_auditlogobjectid FOREIGN KEY (auditlogobjectid) REFERENCES lookupauditlogobjects(id),
    CONSTRAINT fk_auditlogactionid FOREIGN KEY (auditlogactionid) REFERENCES lookupauditlogactions(id)
);
 
CREATE TABLE IF NOT EXISTS applications (
    id int NOT NULL AUTO_INCREMENT, 
    appname varchar(255), 
    appurl varchar(255), 
    devopslink varchar(255),
    datecreated date, 
    datemodified date,
    comments varchar(255),
    PRIMARY KEY (id)
);
 
CREATE TABLE IF NOT EXISTS appsusers (
    id int NOT NULL AUTO_INCREMENT,
    appid int,
    userid int,  
    datestarted date,
    dateended date,
    PRIMARY KEY (id),
    CONSTRAINT fk_appid FOREIGN KEY (appid) REFERENCES applications(id),
    CONSTRAINT fk_usersid FOREIGN KEY (userid) REFERENCES users(id)
);
 
CREATE TABLE IF NOT EXISTS appstechstacks (
    id int NOT NULL AUTO_INCREMENT,
    appid int,
    techstackid int,
    PRIMARY KEY (id),
    CONSTRAINT fk_appsid FOREIGN KEY (appid) REFERENCES applications(id),
    CONSTRAINT fk_techstackid FOREIGN KEY (techstackid) REFERENCES techstacks(id)
);
 
CREATE TABLE IF NOT EXISTS lookupnavmenutypes (
    id int NOT NULL AUTO_INCREMENT,
    navmenutypename varchar(255),
    PRIMARY KEY(id)
);
 
CREATE TABLE IF NOT EXISTS navmenuitems (
    id int NOT NULL AUTO_INCREMENT,
    navmenutypesid int,
    menuitemname varchar(255),
    menuitemsid int,
    sortsequences int,
    iconurl varchar(1000),
    datecreated date,
    PRIMARY KEY(id),
    CONSTRAINT fk_navmenutypesid FOREIGN KEY (navmenutypesid) REFERENCES lookupnavmenutypes(id)
);
 
CREATE TABLE IF NOT EXISTS lookuppages (
    id int NOT NULL AUTO_INCREMENT,
    pagename varchar(255),
    url varchar(255),
    datecreated date,
    PRIMARY KEY (id)
);
 
CREATE TABLE IF NOT EXISTS systempagetracking (
    id int NOT NULL AUTO_INCREMENT,
    pageid int,
    datecreated datetime,
    PRIMARY KEY (id),
    CONSTRAINT fk_pageid FOREIGN KEY (pageid) REFERENCES lookuppages(id)
);


-- Datasets for lookupmenutypes
INSERT INTO lookupnavmenutypes (navmenutypename)
  SELECT "Horizontal" FROM DUAL
WHERE NOT EXISTS
  (SELECT navmenutypename FROM lookupnavmenutypes WHERE navmenutypename="Horizontal");
  
INSERT INTO lookupnavmenutypes (navmenutypename)
  SELECT "Vertical" FROM DUAL
WHERE NOT EXISTS
  (SELECT navmenutypename FROM lookupnavmenutypes WHERE navmenutypename="Vertical");
  

-- Datasets for horizontal navigation menus
    INSERT INTO navmenuitems (navmenutypesid, menuitemname, sortsequences, datecreated)
    SELECT "1","Search", "1", "2021-05-10" FROM DUAL
WHERE NOT EXISTS
  (SELECT menuitemname FROM navmenuitems WHERE menuitemname="Search");
  
    INSERT INTO navmenuitems (navmenutypesid, menuitemname, sortsequences, datecreated)
    SELECT "1", "Sign In/Up", "3", "2021-05-10" FROM DUAL
WHERE NOT EXISTS
  (SELECT menuitemname FROM navmenuitems WHERE menuitemname="Sign In/Up");
  
    INSERT INTO navmenuitems (navmenutypesid, menuitemname, sortsequences, datecreated)
    SELECT "1", "Profile", "4", "2021-05-10" FROM DUAL
WHERE NOT EXISTS
  (SELECT menuitemname FROM navmenuitems WHERE menuitemname="Profile");
  
    INSERT INTO navmenuitems (navmenutypesid, menuitemname, sortsequences, datecreated)
    SELECT "1", "Sign In/Up", "3", "2021-05-10" FROM DUAL
WHERE NOT EXISTS
  (SELECT menuitemname FROM navmenuitems WHERE menuitemname="Sign In/Up");
  
    INSERT INTO navmenuitems (navmenutypesid, menuitemname, sortsequences, datecreated)
    SELECT "1", "Log Out", "5", "2021-05-10" FROM DUAL
WHERE NOT EXISTS
  (SELECT menuitemname FROM navmenuitems WHERE menuitemname="Log Out");
  
    INSERT INTO navmenuitems (navmenutypesid, menuitemname, sortsequences, datecreated)
    SELECT "1", "FAQ", "2", "2021-05-10" FROM DUAL
WHERE NOT EXISTS
  (SELECT menuitemname FROM navmenuitems WHERE menuitemname="FAQ");


 -- Dataset for vertical navigation
    INSERT INTO navmenuitems (navmenutypesid, menuitemname, sortsequences, iconurl, datecreated)
    SELECT "2", "Home", "1", "navmenu/home.jpg", "2021-05-11" FROM DUAL
WHERE NOT EXISTS
  (SELECT menuitemname FROM navmenuitems WHERE menuitemname="Home");
  
    INSERT INTO navmenuitems (navmenutypesid, menuitemname, sortsequences, iconurl, datecreated)
    SELECT "2", "List of Users", "2", "navmenu/listapps.jpg", "2021-05-11" FROM DUAL
WHERE NOT EXISTS
  (SELECT menuitemname FROM navmenuitems WHERE menuitemname="List of Users");
  
    INSERT INTO navmenuitems (navmenutypesid, menuitemname, sortsequences, iconurl, datecreated)
    SELECT "2", "List of Application", "3", "navmenu/apps.jpg", "2021-05-11" FROM DUAL
WHERE NOT EXISTS
  (SELECT menuitemname FROM navmenuitems WHERE menuitemname="List of Applications");
  
    INSERT INTO navmenuitems (navmenutypesid, menuitemname, sortsequences, iconurl, datecreated)
    SELECT "2", "Audit Log", "4", "navmenu/auditlog.jpg", "2021-05-11" FROM DUAL
WHERE NOT EXISTS
  (SELECT menuitemname FROM navmenuitems WHERE menuitemname="Audit Log");
  
    INSERT INTO navmenuitems (navmenutypesid, menuitemname, sortsequences, iconurl, datecreated)
    SELECT "2", "Permission", "5", "navmenu/perm.jpg", "2021-05-11" FROM DUAL
WHERE NOT EXISTS
  (SELECT menuitemname FROM navmenuitems WHERE menuitemname="Permission");
  
    INSERT INTO navmenuitems (navmenutypesid, menuitemname, sortsequences, iconurl, datecreated)
    SELECT "2", "User Applications", "6", "navmenu/userapp.jpg", "2021-05-11" FROM DUAL
WHERE NOT EXISTS
  (SELECT menuitemname FROM navmenuitems WHERE menuitemname="User Applications");
  
    INSERT INTO navmenuitems (navmenutypesid, menuitemname, sortsequences, iconurl, datecreated)
    SELECT "2", "Active Applications", "7", "navmenu/activeapp.jpg", "2021-05-11" FROM DUAL
WHERE NOT EXISTS
  (SELECT menuitemname FROM navmenuitems WHERE menuitemname="Active Applications");
  
    INSERT INTO navmenuitems (navmenutypesid, menuitemname, sortsequences, iconurl, datecreated)
    SELECT "2", "Tech Stacks", "8", "navmenu/techstacks.jpg", "2021-05-11" FROM DUAL
WHERE NOT EXISTS
  (SELECT menuitemname FROM navmenuitems WHERE menuitemname="Tech Stacks");
  

-- Datasets for lookupauditlogobjects
INSERT INTO lookupauditlogobjects (name, datecreated) 
  SELECT 'User Role', '2021-05-10' FROM DUAL
WHERE NOT EXISTS 
  (SELECT name FROM lookupauditlogobjects WHERE name='User Role');
  
INSERT INTO lookupauditlogobjects (name, datecreated) 
  SELECT 'Permission', '2021-05-10' FROM DUAL
WHERE NOT EXISTS 
  (SELECT name FROM lookupauditlogobjects WHERE name='Permission');
  

-- Datasets for lookupauditlogactions
INSERT INTO lookupauditlogactions (name, datecreated) 
  SELECT 'Added', '2021-05-10' FROM DUAL
WHERE NOT EXISTS 
  (SELECT name FROM lookupauditlogactions WHERE name='Added');

INSERT INTO lookupauditlogactions (name, datecreated) 
  SELECT 'Changed', '2021-05-10' FROM DUAL
WHERE NOT EXISTS 
  (SELECT name FROM lookupauditlogactions WHERE name='Changed');
  
INSERT INTO lookupauditlogactions (name, datecreated) 
  SELECT 'Removed', '2021-05-10' FROM DUAL
WHERE NOT EXISTS 
  (SELECT name FROM lookupauditlogactions WHERE name='Removed');
  

-- Datasets for lookuppages
INSERT INTO lookuppages (pagename, url, datecreated) 
  SELECT 'Non-authorized user homepage', '/', '2021-05-10' FROM DUAL
WHERE NOT EXISTS 
  (SELECT url FROM lookuppages WHERE url='/');

INSERT INTO lookuppages (pagename, url, datecreated) 
  SELECT 'Sign In/Up', '/signin', '2021-05-10' FROM DUAL
WHERE NOT EXISTS 
  (SELECT url FROM lookuppages WHERE url='/signin');
  
INSERT INTO lookuppages (pagename, url, datecreated) 
  SELECT "Profile", "/profile", '2021-05-10' FROM DUAL
WHERE NOT EXISTS 
  (SELECT url FROM lookuppages WHERE url='/signin');

INSERT INTO lookuppages (pagename, url, datecreated) 
  SELECT "Logout", "/logout", '2021-05-10' FROM DUAL
WHERE NOT EXISTS 
  (SELECT url FROM lookuppages WHERE url='/logout');

INSERT INTO lookuppages (pagename, url, datecreated) 
  SELECT "Dashboard", "/home", '2021-05-10' FROM DUAL
WHERE NOT EXISTS 
  (SELECT url FROM lookuppages WHERE url='/home');
  
INSERT INTO lookuppages (pagename, url, datecreated) 
  SELECT "Admin", "/admin", '2021-05-10' FROM DUAL
WHERE NOT EXISTS 
  (SELECT url FROM lookuppages WHERE url='/admin');


-- Datasets for lookupemploymenttypes
INSERT INTO lookupemploymenttypes (typename) 
  SELECT "Permanent" FROM DUAL
WHERE NOT EXISTS 
  (SELECT typename FROM lookupemploymenttypes WHERE typename="Permanent");
  
INSERT INTO lookupemploymenttypes (typename) 
  SELECT "Contract Direct Hire (CDH)" FROM DUAL
WHERE NOT EXISTS 
  (SELECT typename FROM lookupemploymenttypes WHERE typename="Contract Direct Hire (CDH)");
  
INSERT INTO lookupemploymenttypes (typename) 
  SELECT "Master Service Agreement (MSA)" FROM DUAL
WHERE NOT EXISTS 
  (SELECT typename FROM lookupemploymenttypes WHERE typename="Master Service Agreement (MSA)");
  
INSERT INTO lookupemploymenttypes (typename) 
  SELECT "Professional Service Agreement (PSA)" FROM DUAL
WHERE NOT EXISTS 
  (SELECT typename FROM lookupemploymenttypes WHERE typename="Professional Service Agreement (PSA)");


-- Datasets for lookuppermissions
INSERT INTO lookuppermissions (permissionname, datecreated) 
  SELECT "Read", "2021-05-10" FROM DUAL
WHERE NOT EXISTS 
  (SELECT permissionname FROM lookuppermissions WHERE permissionname="Read");
  
INSERT INTO lookuppermissions (permissionname, datecreated) 
  SELECT "Create", "2021-05-10" FROM DUAL
WHERE NOT EXISTS 
  (SELECT permissionname FROM lookuppermissions WHERE permissionname="Create");
  
INSERT INTO lookuppermissions (permissionname, datecreated) 
  SELECT "Update", "2021-05-10" FROM DUAL
WHERE NOT EXISTS 
  (SELECT permissionname FROM lookuppermissions WHERE permissionname="Update");
  
INSERT INTO lookuppermissions (permissionname, datecreated) 
  SELECT "Delete", "2021-05-10" FROM DUAL
WHERE NOT EXISTS 
  (SELECT permissionname FROM lookuppermissions WHERE permissionname="Delete");
  

  -- Datasets for techstacks
INSERT INTO techstacks (techname,datecreated)
  SELECT "C#","2021-05-12" FROM DUAL
WHERE NOT EXISTS
 (SELECT techname FROM techstacks WHERE techname="c#");

INSERT INTO techstacks (techname,datecreated)
  SELECT "ASP .Net Core","2021-05-12" FROM DUAL
WHERE NOT EXISTS
 (SELECT techname FROM techstacks WHERE techname="ASP .Net Core");

INSERT INTO techstacks (techname,datecreated)
  SELECT "React.js","2021-05-12" FROM DUAL
WHERE NOT EXISTS
 (SELECT techname FROM techstacks WHERE techname="React.js");

INSERT INTO techstacks (techname,datecreated)
  SELECT "Node.js","2021-05-12" FROM DUAL
WHERE NOT EXISTS
 (SELECT techname FROM techstacks WHERE techname="Node.js");

INSERT INTO techstacks (techname,datecreated)
  SELECT "Angular.js","2021-05-12" FROM DUAL
WHERE NOT EXISTS
 (SELECT techname FROM techstacks WHERE techname="Angular.js");

INSERT INTO techstacks (techname,datecreated)
  SELECT "MSSQL","2021-05-12" FROM DUAL
WHERE NOT EXISTS
 (SELECT techname FROM techstacks WHERE techname="MSSQL");

INSERT INTO techstacks (techname,datecreated)
  SELECT "Angular","2021-05-12" FROM DUAL
WHERE NOT EXISTS
 (SELECT techname FROM techstacks WHERE techname="Angular.js");

INSERT INTO techstacks (techname,datecreated)
  SELECT "MySQL","2021-05-12" FROM DUAL
WHERE NOT EXISTS
 (SELECT techname FROM techstacks WHERE techname="MySQL");

INSERT INTO techstacks (techname,datecreated)
  SELECT "Postgresql","2021-05-12" FROM DUAL
WHERE NOT EXISTS
 (SELECT techname FROM techstacks WHERE techname="Postgresql");

INSERT INTO techstacks (techname,datecreated)
 SELECT "HTML","2021-05-12" FROM DUAL
WHERE NOT EXISTS
 (SELECT techname FROM techstacks WHERE techname="HTML");

INSERT INTO techstacks (techname,datecreated)
  SELECT "CSS","2021-05-12" FROM DUAL
WHERE NOT EXISTS
 (SELECT techname FROM techstacks WHERE techname="CSS");

INSERT INTO techstacks (techname,datecreated)
  SELECT "JavaScript","2021-05-12" FROM DUAL
WHERE NOT EXISTS
 (SELECT techname FROM techstacks WHERE techname="JavaScript");

INSERT INTO techstacks (techname,datecreated)
  SELECT "Java","2021-05-12" FROM DUAL
WHERE NOT EXISTS
 (SELECT techname FROM techstacks WHERE techname="Java");

INSERT INTO techstacks (techname,datecreated)
  SELECT "C++","2021-05-12" FROM DUAL
WHERE NOT EXISTS
 (SELECT techname FROM techstacks WHERE techname="C++");

INSERT INTO techstacks (techname,datecreated)
  SELECT "C","2021-05-12" FROM DUAL
WHERE NOT EXISTS
 (SELECT techname FROM techstacks WHERE techname="C");

INSERT INTO techstacks (techname,datecreated)
  SELECT "Python","2021-05-12" FROM DUAL
WHERE NOT EXISTS
 (SELECT techname FROM techstacks WHERE techname="Python");
 
INSERT INTO techstacks (techname,datecreated)
  SELECT "Shell","2021-05-12" FROM DUAL
WHERE NOT EXISTS
 (SELECT techname FROM techstacks WHERE techname="Shell");
 
INSERT INTO techstacks (techname,datecreated)
  SELECT "Product Management","2021-05-12" FROM DUAL
WHERE NOT EXISTS
 (SELECT techname FROM techstacks WHERE techname="Product Management");
 
INSERT INTO techstacks (techname,datecreated)
  SELECT "Waterfall","2021-05-12" FROM DUAL
WHERE NOT EXISTS
 (SELECT techname FROM techstacks WHERE techname="Waterfall");

INSERT INTO techstacks (techname,datecreated)
  SELECT "Agile","2021-05-12" FROM DUAL
WHERE NOT EXISTS
 (SELECT techname FROM techstacks WHERE techname="Agile");

INSERT INTO techstacks (techname,datecreated)
  SELECT "SAFE","2021-05-12" FROM DUAL
WHERE NOT EXISTS
 (SELECT techname FROM techstacks WHERE techname="SAFE");


  -- Datasets for userroles
INSERT INTO userroles (rolename) 
  SELECT  "Admin" FROM DUAL
WHERE NOT EXISTS 
  (SELECT rolename FROM userroles WHERE rolename= "Admin");
  
INSERT INTO userroles (rolename) 
  SELECT  "Software Engineer" FROM DUAL
WHERE NOT EXISTS 
  (SELECT rolename FROM userroles WHERE rolename= "Software Engineer");

INSERT INTO userroles (rolename) 
  SELECT  "Product Manager" FROM DUAL
WHERE NOT EXISTS 
  (SELECT rolename FROM userroles WHERE rolename= "Product Manager");



