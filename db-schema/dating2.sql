use sql8170829;


DROP TABLE IF EXISTS DatingUsers;
DROP TABLE IF EXISTS DatingClients;
DROP TABLE IF EXISTS DatingNotifications;
DROP TABLE IF EXISTS DatingMessages;
DROP TABLE IF EXISTS `events`;



CREATE TABLE DatingUsers(
Username varchar(50) not null,
PRIMARY KEY (Username),
UserPassword varchar(50) not null, 
UserEmail varchar(50) not null, 
UserContactNumber Integer not null,
UserRole varchar(20) not null)
ENGINE=INNODB DEFAULT CHARSET=utf8;


CREATE TABLE DatingClients(
ClientID Integer not null AUTO_INCREMENT, 
PRIMARY KEY (ClientID), 
ProfileImage longblob,
ClientName varchar(50) not null,
Sex varchar(10), 
Age Integer, 
Height Integer, 
Chest Integer, 
Wrist Integer, 
Hips Integer, 
Nationality varchar(20), 
Education varchar(30), 
Occupation varchar(30), 
Hobbies varchar(500),
Location varchar(50), 
SexualOrientation varchar(30), 
OtherInfo varchar(500),
Username varchar(50),
Foreign key (Username) references DatingUsers(Username) ON DELETE CASCADE ON UPDATE CASCADE)
ENGINE=INNODB DEFAULT CHARSET=utf8;



CREATE TABLE DatingNotifications(
NotificationID Integer not null AUTO_INCREMENT, 
PRIMARY KEY (NotificationID), 
ClientName varchar(50),
ClientID Integer,
ClientUsername varchar(40), 
SenderUsername varchar(40),
SenderEmail varchar(50), 
SenderContactNumber Integer,
Comments varchar(300),
Foreign key (ClientID) references DatingClients(ClientID) ON DELETE CASCADE ON UPDATE CASCADE) 
ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE DatingMessages(
MessageID Integer not null AUTO_INCREMENT,
PRIMARY KEY (MessageID),
Messages varchar(200),
MessagesSenderName varchar(40),
MessagesSentTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
NotificationID Integer, 
Foreign key (NotificationID) references DatingNotifications(NotificationID) ON DELETE CASCADE ON UPDATE CASCADE) 
ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `color` varchar(7) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `Username` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  Foreign key (Username) references DatingUsers(Username) ON DELETE CASCADE ON UPDATE CASCADE)
  ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;
