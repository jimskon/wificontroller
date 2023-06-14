
CREATE TABLE `accounts` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `address1` varchar(30) DEFAULT NULL,
  `address2` varchar(30) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `zip` varchar(15) DEFAULT NULL,
  `accounttype` varchar(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `wificlients` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `mac` varchar(18) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `ipaddress` varchar(20) DEFAULT NULL,
  `version` varchar(10) DEFAULT NULL,
  `os` varchar(45) DEFAULT NULL,
  `model` varchar(45) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `enabled` boolean DEFAULT FALSE,
  `pollrate` int(11) DEFAULT 5,
  `lastseen` datetime NOT NULL,
  `note` varchar(600) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `confighash` varchar(45) DEFAULT NULL,
  `ownerid` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  FOREIGN KEY (ownerid) REFERENCES accounts(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `zones` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `description` varchar(80) DEFAULT NULL,
  `ssid` varchar(50) DEFAULT NULL,
  `open` boolean DEFAULT TRUE,
  `ownerid` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  FOREIGN KEY (ownerid) REFERENCES accounts(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
  
CREATE TABLE `wlans` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `mac` varchar(18) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `zoneid` int(11) DEFAULT NULL,
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
  `selected_a` varchar(255) DEFAULT NULL,
  `selected_g` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  FOREIGN KEY (clientid) REFERENCES wificlients(id),
  FOREIGN KEY (zoneid) REFERENCES zone(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `users` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `passphrase` varchar(50) DEFAULT NULL,
  `ownerid` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  FOREIGN KEY (ownerid) REFERENCES accounts(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `userzones` (
  `zoneid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `mdk` varchar(60) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  FOREIGN KEY (zoneid) REFERENCES zones(id),
  FOREIGN KEY (userid) REFERENCES users(id),
  CONSTRAINT pk_userzone PRIMARY KEY (zoneid,userid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



COMMIT;
