# Pierre's Treat Box 🍰

#### Friday Project for Week 5 of C# || Many-to-Many relationships with Authentication and Identity 1/8/2020

#### by Taylor Delph

## Description

  Pierre wants you to create a new application to market his sweet and savory treats. This time, he would like you to build an application with user authentication and a many-to-many relationship. Here are the features he wants in the application:

* The application should have user authentication. A user should be able to log in and log out. 
* Only logged in users should have create, update and delete functionality. All users should be able to have read functionality.
* There should be a many-to-many relationship between Treats and Flavors. A treat can have many flavors (such as sweet, savory, spicy, or creamy) and a flavor can have many treats. For instance, the "sweet" flavor could include chocolate croissants, cheesecake, and so on.
* A user should be able to navigate to a splash page that lists all treats and flavors. Users should be able to click on an individual treat or flavor to see all the treats/flavors that belong to it.

<!-- ![Splash Page](./ReadMeAssets/home.gif) -->

## 💻  Software Requirements
* A code editor like [VSCode](https://code.visualstudio.com/download)
* With [.NET Core 2.2](https://dotnet.microsoft.com/download/dotnet-core/thank-you/sdk-2.2.106-macos-x64-installer) installed
* [MySQL](https://dev.mysql.com/downloads/file/?id=484914)

  * Click the 'No thanks, just start my download' link.
  * Follow along with the installer until you reach the Configuration page. Then select the following options:
  * Use Legacy Password Encryption.
  * Set password to **epicodus** and then click **Finish**.
  * Open the terminal and enter the command `echo 'export PATH="/usr/local/mysql//bin:$PATH"'>>~/.bash_profile`
  * Type `source ~/.bash_profile` in the terminal to verify that MySQL was installed.
  * Enter `mysql -uroot -pepicodus` or `mysql -uroot -p{your_password}` in the terminal to verify the installation. You will know it's installed when you gain access to the `mysql>` command line.


* [MySQL Workbench](https://dev.mysql.com/downloads/file/?id=484391)
  * Select the 'No thanks, just start my download' link.
  * Install MySQL Workbench in the Applications folder.
  * Open MySQL Workbench and select the `Local instance 3306` server. You will need to enter the password **epicodus** (or the password you set).


## 🏗️  Setup and Use via cloning
* Open your terminal and ensure you are within the directory you'd like the file to be created in.
* Enter the following command `$ git clone https://github.com/taylulz/Factory.git`
* Once cloned, use the `$ cd Factory.Solution/Factory` command to navigate to the root directory.
* Enter `$ dotnet restore`


#### AppSettings.Json
* Create a file in Factory/Factory folder named `appsettings.json`
* Copy and paste the following snippet to the file (if you used your own password, replace 'epicodus' with the one you've set)

```
{
  "ConnectionStrings": {
      "DefaultConnection": "Server=localhost;Port=3306;database=taylor_delph;uid=root;pwd=epicodus;"
  }
}
```

#### Import Database with Entity Framework Core
* Now enter `$ dotnet ef database update` to create database in MySQL.
* To run the application, enter `$ dotnet run`
* Your command line will open a server (likely `http://localhost:5000/`). Navigate to this URL in your browser to view the project.

#### Register and Login 
* To use this app, follow the directions to register an account
* After registering, login to begin making custom treats and adding flavors

#### Import Database with SQL Schema
* Copy and paste the following Schema Create Statement in MySQL Workbench to create this database with it's respective tables.
```
CREATE DATABASE `taylor_delph_treats` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE taylor_delph_treats;

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
```

## 🛠️ Technologies Used
* _GitBash_
* _Visual Studio Code_
* _C# v 7.3_
* _.NET Core v 2.2_
* _ASP.NET Core MVC_
* _Bootstrap_
* _MySQL Workbench_
* _Entity Framework Core_
* _[SQL Designer](https://ondras.zarovi.cz/sql/demo/)_
* Identity

## 🐞 Known Bugs

| Bug | Status | Solution |
| :------------- | :------------- | :------------- | :------------- |
| Treats/AddFlavor/ route will continue adding duplicate Flavors to Treat. | Resolved | Missing double == when checking for duplicates in database |



## 📫 Contact details

If you run into any problems with the site, please [email me here](mailto:taylulzcode@gmail.com)

## 📗 License

MIT License.