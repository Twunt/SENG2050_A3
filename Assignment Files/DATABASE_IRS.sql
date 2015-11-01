CREATE TABLE irsUser(
userID VARCHAR(16) NOT NULL PRIMARY KEY,
userName VARCHAR(30),
userPassword VARCHAR(16),
role VARCHAR(30)
);

CREATE TABLE issue (
issueID INT NOT NULL PRIMARY KEY,
submitter VARCHAR(16) NOT NULL,
staffID VARCHAR(16),
state VARCHAR(10),
body text,
title VARCHAR(30),
issueType VARCHAR(30),
subType VARCHAR(30),

FOREIGN KEY (submitter) REFERENCES irsUser(userID) ON UPDATE CASCADE,
FOREIGN KEY (staffID) REFERENCES irsUser(userID) ON UPDATE CASCADE
);

CREATE TABLE userComment (
commentID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
userID VARCHAR(16) NOT NULL,
issueID int NOT NULL,
commentBody text,
timePosted TIMESTAMP,

FOREIGN KEY (userID) REFERENCES irsUser(userID) ON UPDATE CASCADE,
FOREIGN KEY (issueID) REFERENCES issue(issueID) ON UPDATE CASCADE
);

CREATE TABLE network(
issueID INT NOT NULL PRIMARY KEY,
location varchar(10),
haveRestarted boolean,
cableConnected boolean,
similarIssues boolean

);

CREATE TABLE hardware(
issueID INT NOT NULL PRIMARY KEY,
hardwareType varchar(20),
macOrPc varchar(3),
operatingSystem varchar(20),
compType varchar(10),
compName varchar(20),
location  varchar(10)
);

CREATE TABLE software(
issueID INT NOT NULL PRIMARY KEY,
location  varchar(10),
compType varchar(10),
compName varchar(20),
macOrPc varchar(3),
softwareName varchar(30),
softwareVersion varchar(30),
operatingSystem varchar(20)
);

CREATE TABLE email(
issueID INT NOT NULL PRIMARY KEY,
emailAddress varchar(50),
operatingSystem varchar(20),
timeOccured timestamp,
browser varchar(30)
);

CREATE TABLE account(
issueID INT NOT NULL PRIMARY KEY,
accountType varchar(10),
userID VARCHAR(16)
);

CREATE TABLE maintenance (
maintenanceID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
message text,
startTime TIMESTAMP,
endTime TIMESTAMP
);

insert into user VALUES('bob','bob smith','skjfs23','student');
insert into user VALUES('jack','bob smith','skjfs23','student');

insert into issue VALUES(,,);


insert into room VALUES('ES1.01', 30, true, false, false, true, true, 'ES Building', 'Computer Lab', '2015-5-18 09:00:00', '2015-5-18 10:00:00');
insert into room VALUES('ES1.01', 30, true, false, false, true, true, 'ES Building', 'Computer Lab', '2015-5-18 12:00:00', '2015-5-18 14:00:00');
insert into room VALUES('ES1.01', 30, true, false, false, true, true, 'ES Building', 'Computer Lab', '2015-5-18 14:00:00', '2015-5-18 16:00:00');