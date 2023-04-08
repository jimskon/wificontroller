
CREATE TABLE `owner` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `first` varchar(30) DEFAULT NULL,
  `last` varchar(30) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `address1` varchar(30) DEFAULT NULL,
  `address2` varchar(30) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `zip` varchar(15) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `wificlient` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `mac` varchar(18) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `ipaddress` varchar(20) DEFAULT NULL,
  `clientversion` varchar(10) DEFAULT NULL,
  `osversion` varchar(45) DEFAULT NULL,
  `hwmodel` varchar(45) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `pollrate` int(11) DEFAULT 5,
  `lastseen` datetime NOT NULL,
  `note` varchar(600) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `confighash` varchar(45) DEFAULT NULL,
  `ownerid` int(11) DEFAULT NULL,
  FOREIGN KEY (ownerid) REFERENCES owner(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `zone` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `description` varchar(80) DEFAULT NULL,
  `ssid` varchar(50) DEFAULT NULL,
  `ownerid` int(11) DEFAULT NULL,
  FOREIGN KEY (ownerid) REFERENCES owner(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
  
CREATE TABLE `wlans` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `mac` varchar(18) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `description` varchar(80) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `wlan` varchar(20) DEFAULT NULL,
  `phy` varchar(20) DEFAULT NULL,
  `txpower` varchar(20) DEFAULT NULL,
  `a` varchar(80) DEFAULT NULL,
  `g` varchar(80) DEFAULT NULL,
  `lastseen` datetime DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `autochannel` BOOLEAN DEFAULT TRUE,
  `channel` int(11) DEFAULT 0,
  `clientid` int(11) DEFAULT NULL,
  FOREIGN KEY (clientid) REFERENCES wificlient(id),
  FOREIGN KEY (zoneid) REFERENCES zone(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `user` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `passphrase` varchar(50) DEFAULT NULL,
  `mdk` varchar(60) DEFAULT NULL,
  `ownerid` int(11) DEFAULT NULL,
  FOREIGN KEY (ownerid) REFERENCES owner(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `userzone` (
  `zoneid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  FOREIGN KEY (zoneid) REFERENCES zone(id),
  FOREIGN KEY (userid) REFERENCES user(id),
  CONSTRAINT pk_userzone PRIMARY KEY (zoneid,userid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `wlanzone` (
  `zoneid` int(11) NOT NULL,
  `wlanid` int(11) NOT NULL,
  FOREIGN KEY (zoneid) REFERENCES zone(id),
  FOREIGN KEY (wlanid) REFERENCES wlan(id),
  CONSTRAINT pk_userzone PRIMARY KEY (zoneid,wlanid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

COMMIT;
