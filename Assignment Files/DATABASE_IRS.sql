-- DROP DATABASE IRS;
CREATE DATABASE IRS;

use IRS;

CREATE TABLE irsUser(
userID VARCHAR(16) NOT NULL PRIMARY KEY,
userName VARCHAR(30),
userPassword VARCHAR(16),
role VARCHAR(30)
);

CREATE TABLE issue (
issueID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
submitterID VARCHAR(16) NOT NULL,
staffID VARCHAR(16),
state VARCHAR(10),
body text,
title VARCHAR(30),
issueType VARCHAR(30),
subType VARCHAR(30),
location varchar(10),
haveRestarted boolean,
cableConnected boolean,
similarIssues boolean,
hardwareType varchar(20),
macOrPc varchar(3),
operatingSystem varchar(20),
compType varchar(10),
compName varchar(20),
softwareName varchar(30),
softwareVersion varchar(30),
emailAddress varchar(50),
timeOccured timestamp,
browser varchar(30),
accountType varchar(10),

FOREIGN KEY (submitterID) REFERENCES irsUser(userID) ON UPDATE CASCADE,
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

CREATE TABLE maintenance (
maintenanceID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
message text,
startTime TIMESTAMP,
endTime TIMESTAMP
);

insert into irsUser VALUES("LGulliver","Lewis Gulliver","ThisPassword","user");
insert into irsUser VALUES("BPrattern","Beau Prattern","Generic123","user");
insert into irsUser VALUES("RBille","Ross Bille","AdminPassword","staff");
insert into irsUser VALUES("AFaulds","Andrew Faulds","Thrillho","staff");
insert into irsUser VALUES("NBrown","Nick Brown","nicksPassword","user");
insert into irsUser VALUES("CDodd","Connor Dodd","connman","user");

insert into userComment VALUES("Rbille",1,"Try turning it off and back on again","2015-10-26 11:00:00");
insert into userComment VALUES(,,,);

--Network Entries 
insert into issue VALUES("LGulliver","RBille","inProgress","My computer can't find any available networks","No Network Found","network","cantConnect","common room",false,true,false,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
insert into issue VALUES("BPrattern",NULL,"new","wep pages load very slowly","slow internet","network","speed","common room",true,true,false,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
insert into issue VALUES("NBrown","AFaulds","kBase","whilst loading web pages, my internet cuts out","dropouts loading web pages","network","dropouts","NS117",true,true,true,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
insert into issue VALUES("CDodd","AFaulds","inProgress","on many web pages, random popups come up and disrupt my work","getting popups","network","other","CR043",true,true,false,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

--Software Entries
insert into issue VALUES("NBrown","RBille","inProgress","It takes a long time to open any programs on my computer","Computer is running slowly","software","slowLoad","common room",NULL,NULL,NULL,NULL,"mac","MOS9.3.1","desktop","CR19","all","misc",NULL,NULL,NULL,NULL);
insert into issue VALUES("BPrattern",NULL,"new","I can't open microsoft word","word won't open","software","wontLoad","common room",NULL,NULL,NULL,NULL,"pc","Windows 10","desktop","CR07","MS Word","2015",NULL,NULL,NULL,NULL);
insert into issue VALUES("LGulliver","RBille","completed","Opening League of Legends opens DOTA2 as well. I DON'T WANT THIS","Running one program Opens another","software","other","LS043",NULL,NULL,NULL,NULL,"pc","Windows 7","laptop","Lewis PC","League of Legends","V4.21",NULL,NULL,NULL,NULL);

--Hardware Entries
insert into issue VALUES("CDodd",NULL,"new","My computer won't start","dead computer","hardware","wontTurnOn","common room",NULL,NULL,NULL,"","","","","",NULL,NULL,NULL,NULL,NULL,NULL);
insert into issue VALUES("CDodd","AFaulds","completed","my computer crashes whenever I run video games","computer crashes","hardware","blueScreens","common room",NULL,NULL,NULL,"","","","","",NULL,NULL,NULL,NULL,NULL,NULL);
insert into issue VALUES("NBrown","AFaulds","kBase","my computer won't read CDs. I put the cd in the drive and it just doesnt recognise it","computer wont recognise CDs","hardware","diskDrive","NS107",NULL,NULL,NULL,"","","","","",NULL,NULL,NULL,NULL,NULL,NULL);
insert into issue VALUES("BPrattern",NULL,"new","my headphones and microphone don't work. I plug them in but sound still plays through my monitor","headphones/microphone dont work","hardware","peripherals","NS247",NULL,NULL,NULL,"","","","","",NULL,NULL,NULL,NULL,NULL,NULL);
insert into issue VALUES("LGulliver","RBille","resolved","my computer won't recognise my second hard drive. It's inserted into the port in the computer, but won't come up in My Computer","unrecognised hard drive","hardware","other","LS118",NULL,NULL,NULL,"","","","","",NULL,NULL,NULL,NULL,NULL,NULL);

--Email Entries 
insert into issue VALUES("LGulliver","RBille","inProgress","an error pops up whenever i try to send an email","error on email send","email","cantSend",NULL,NULL,NULL,NULL,NULL,NULL,"",NULL,NULL,NULL,NULL,"","","",NULL);
insert into issue VALUES("BPrattern",NULL,"new","my colleagues send me emails but I don't receive them. Nothing comes up in my inbox","not receiving emails","email","cantReceive",NULL,NULL,NULL,NULL,NULL,NULL,"",NULL,NULL,NULL,NULL,"","","",NULL);
insert into issue VALUES("NBrown","RBille","kBase","I'm getting a lot of emails asking for my student username and password login","getting phishing emails","email","spamOrPhishing",NULL,NULL,NULL,NULL,NULL,NULL,"",NULL,NULL,NULL,NULL,"","","",NULL);
insert into issue VALUES("NBrown","AFaulds","completed","Whenever I sign out of my email address, then try to sign back in, it always says my password is wrong when it is not","incorrect password when correct password entered","email","other",NULL,NULL,NULL,NULL,NULL,NULL,"",NULL,NULL,NULL,NULL,"","","",NULL);

--Account Entries 
insert into issue VALUES("CDodd","RBille","completed","whenever I try to log in, it says my password is incorrect when Im entering the same password I always use for this login","says password is incorrect when not","account","wrongDetails",NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,"user");
insert into issue VALUES("BPrattern","AFaulds","inProgress","I've forgotten my password and need to reset it","forgotten password","account","passwordReset",NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,"user");
insert into issue VALUES("LGulliver",NULL,"new","account says I am a user, when I should be an admin","wrong user status","account","other",NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,"user");


insert into room VALUES("ES1.01", 30, true, false, false, true, true, "ES Building", "Computer Lab", "2015-5-18 09:00:00", "2015-5-18 10:00:00");
insert into room VALUES("ES1.01", 30, true, false, false, true, true, "ES Building", "Computer Lab", "2015-5-18 12:00:00", "2015-5-18 14:00:00");
insert into room VALUES("ES1.01", 30, true, false, false, true, true, "ES Building", "Computer Lab", "2015-5-18 14:00:00", "2015-5-18 16:00:00");
