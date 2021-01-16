DROP TABLE IF EXISTS `__EFMigrationsHistory`;
CREATE TABLE `__EFMigrationsHistory` (
  `MigrationId` varchar(95) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `Treats`;
CREATE TABLE `Treats` (
  `TreatId` int(11) NOT NULL AUTO_INCREMENT,
  `TreatName` longtext,
  `TreatIngredients` longtext,
  `UserId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`TreatId`),
  KEY `IX_Treats_UserId` (`UserId`),
  CONSTRAINT `FK_Treats_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `Flavors`;
CREATE TABLE `Flavors` (
  `FlavorId` int(11) NOT NULL AUTO_INCREMENT,
  `FlavorName` longtext,
  `UserId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`FlavorId`),
  KEY `IX_Flavors_UserId` (`UserId`),
  CONSTRAINT `FK_Flavors_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `TreatFlavor`;
CREATE TABLE `TreatFlavor` (
  `TreatFlavorId` int(11) NOT NULL AUTO_INCREMENT,
  `TreatId` int(11) NOT NULL,
  `FlavorId` int(11) NOT NULL,
  PRIMARY KEY (`TreatFlavorId`),
  KEY `IX_TreatFlavor_FlavorId` (`FlavorId`),
  KEY `IX_TreatFlavor_TreatId` (`TreatId`),
  CONSTRAINT `FK_TreatFlavor_Flavors_FlavorId` FOREIGN KEY (`FlavorId`) REFERENCES `flavors` (`FlavorId`) ON DELETE CASCADE,
  CONSTRAINT `FK_TreatFlavor_Treats_TreatId` FOREIGN KEY (`TreatId`) REFERENCES `treats` (`TreatId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

