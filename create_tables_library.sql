/*!999999\- enable the sandbox mode */
-- MariaDB dump 10.19  Distrib 10.6.18-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: mysql.eecs.ku.edu    Database: 447s25_s021j917
-- ------------------------------------------------------
-- Server version	10.6.18-MariaDB-0ubuntu0.22.04.1
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */
;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */
;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */
;
/*!40101 SET NAMES utf8mb4 */
;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */
;
/*!40103 SET TIME_ZONE='+00:00' */
;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */
;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */
;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */
;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */
;
--
-- Table structure for table `Copy`
--

DROP TABLE IF EXISTS Copy;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!40101 SET character_set_client = utf8 */
;
CREATE TABLE Copy (
	copy_id int(11) NOT NULL,
	status varchar(100) DEFAULT NULL,
	PRIMARY KEY (copy_id)
);
/*!40101 SET character_set_client = @saved_cs_client */
;
CREATE TABLE Author (
	author_id INT,
	name VARCHAR(30) NOT NULL,
	PRIMARY KEY (author_id)
);
-- CREATE TABLE Copy (
-- copy_id INT,
-- status VARCHAR(30) CHECK (status IN (‘in_stock’, ‘checked_out’)),
-- PRIMARY KEY (copy_id)
-- );
CREATE TABLE Genre (
	genre_id INT,
	genre_name VARCHAR(30) NOT NULL,
	PRIMARY KEY (genre_id)
);
CREATE TABLE Publisher (
	publisher_id INT,
	name VARCHAR(30) NOT NULL,
	PRIMARY KEY (publisher_id)
);
CREATE TABLE Library_Transaction (
	transaction_id INT,
	checked_out_date DATE NOT NULL,
	due_date DATE NOT NULL DEFAULT ADDDATE(checked_out_date, 14),
	return_date DATE,
	PRIMARY KEY (transaction_id),
	CHECK (
		return_date >= checked_out_date
		OR return_date = NULL
	),
	CHECK (due_date > checked_out_date)
);
CREATE TABLE Fine (
	fine_id INT,
	fine_amount DECIMAL(5, 2),
	fine_date DATE,
	fine_status VARCHAR(30),
	PRIMARY KEY (fine_id),
	CHECK(fine_status IN ("paid", "unpaid"))
);
CREATE TABLE Library_Item (
	item_id INT,
	checked_out_status BOOLEAN NOT NULL DEFAULT 0,
	-- NOT USED
	current_inventory INT,
	overdue_status BOOLEAN NOT NULL DEFAULT 0,
	-- NOT USED
	PRIMARY KEY (item_id)
);
CREATE TABLE Book (
	item_id INT,
	author VARCHAR(30) NOT NULL,
	availability_status BOOLEAN NOT NULL DEFAULT 1,
	-- NOT NEEDED?
	book_rating DECIMAL(3, 2),
	genre VARCHAR(30) NOT NULL,
	ISBN CHAR(16) NOT NULL,
	title VARCHAR(100) NOT NULL,
	publication_year YEAR NOT NULL,
	PRIMARY KEY (item_id),
	FOREIGN KEY (item_id) REFERENCES Library_Item (item_id) ON DELETE CASCADE ON UPDATE CASCADE,
	UNIQUE (ISBN)
);
CREATE TABLE Digital_Media_Item (
	item_id INT,
	author VARCHAR(30) NOT NULL,
	availability_status BOOLEAN NOT NULL DEFAULT 1,
	genre VARCHAR(30) NOT NULL,
	ISBN CHAR(16) NOT NULL,
	title VARCHAR(40) NOT NULL,
	publication_year YEAR NOT NULL,
	PRIMARY KEY(item_id),
	FOREIGN KEY (item_id) REFERENCES Library_Item (item_id) ON DELETE CASCADE ON UPDATE CASCADE,
	UNIQUE (ISBN)
);
CREATE TABLE Magazine (
	item_id INT,
	author VARCHAR(30) NOT NULL,
	availability_status VARCHAR(30) NOT NULL DEFAULT 1,
	genre VARCHAR(30) NOT NULL,
	ISSN CHAR(9) NOT NULL,
	issue_number INT NOT NULL,
	title VARCHAR(30) NOT NULL,
	publication_date DATE NOT NULL,
	PRIMARY KEY (item_id),
	FOREIGN KEY (item_id) REFERENCES Library_Item (item_id) ON DELETE CASCADE ON UPDATE CASCADE,
	UNIQUE (ISSN)
);
CREATE TABLE Library_Report (
	report_id INT,
	number_of_checkouts INT,
	report_date DATE NOT NULL,
	total_amount_owed_per_day DECIMAL(5, 2),
	total_amount_paid_per_day DECIMAL(5, 2),
	PRIMARY KEY (report_id)
);
CREATE TABLE Member_Account (
	account_id INT,
	incurred_fees DECIMAL(5, 2),
	overdue_balance DECIMAL(5, 2),
	total_amount_paid DECIMAL(5, 2),
	PRIMARY KEY (account_id)
);
CREATE TABLE Staff (
	staff_id INT,
	role VARCHAR(30) NOT NULL,
	name VARCHAR(50) NOT NULL,
	PRIMARY KEY (staff_id)
);
CREATE TABLE Library_Member (
	member_id INT,
	book_limit INT,
	fee_type DECIMAL(3, 2),
	type_id INT,
	name VARCHAR(30),
	contact_information VARCHAR(30),
	account_status VARCHAR(30),
	PRIMARY KEY (member_id),
	CHECK (type_id IN (1, 2, 3)),
	CHECK (
		fee_type = CASE
			WHEN type_id = 1 THEN 0.30
			WHEN type_id = 2 THEN 0.20
			WHEN type_id = 3 THEN 0.15
		END
	),
	CHECK (
		book_limit = CASE
			WHEN type_id = 1 THEN 5
			WHEN type_id = 2 THEN 10
			WHEN type_id = 3 THEN 5
		END
	)
);
CREATE TABLE Waitlist (
	waitlist_id INT,
	request_date DATE NOT NULL,
	waitlist_status VARCHAR(30) NOT NULL,
	fulfilled_date DATE,
	PRIMARY KEY (waitlist_id),
	CHECK (
		waitlist_status IN ('on_hold', 'available_for_checkout')
	)
);
CREATE TABLE Regular (
	member_id INT,
	available_limit INT NOT NULL DEFAULT 5,
	PRIMARY KEY (member_id),
	FOREIGN KEY (member_id) references Library_Member (member_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE Student (
	member_id INT,
	available_limit INT NOT NULL DEFAULT 10,
	PRIMARY KEY (member_id),
	FOREIGN KEY (member_id) REFERENCES Library_Member (member_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE Senior_Citizen (
	member_id INT,
	available_limit INT NOT NULL DEFAULT 5,
	PRIMARY KEY (member_id),
	FOREIGN KEY (member_id) REFERENCES Library_Member (member_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE Recommendation (
	recommendation_id INT,
	PRIMARY KEY (recommendation_id)
);
CREATE TABLE Added (
	copy_id INT,
	waitlist_id INT,
	PRIMARY KEY (copy_id),
	FOREIGN KEY (copy_id) REFERENCES Copy (copy_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (waitlist_id) REFERENCES Waitlist (waitlist_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE Hold (
	member_id INT,
	copy_id INT,
	PRIMARY KEY (member_id, copy_id),
	FOREIGN KEY (member_id) REFERENCES Library_Member (member_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (copy_id) REFERENCES Copy (copy_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE Pay (
	fine_id INT,
	member_id INT,
	amount_paid DECIMAL(5, 2) NOT NULL,
	paid_date DATE NOT NULL,
	PRIMARY KEY (fine_id),
	FOREIGN KEY (fine_id) REFERENCES Fine (fine_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (member_id) REFERENCES Library_Member (member_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE Incur (
	transaction_id INT,
	fine_id INT,
	PRIMARY KEY (transaction_id, fine_id),
	FOREIGN KEY (transaction_id) REFERENCES Library_Transaction (transaction_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (fine_id) REFERENCES Fine (fine_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE Process (
	transaction_id INT,
	staff_id INT,
	PRIMARY KEY (transaction_id),
	FOREIGN KEY (transaction_id) REFERENCES Library_Transaction (transaction_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (staff_id) REFERENCES Staff (staff_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE Loan (
	copy_id INT,
	transaction_id INT,
	PRIMARY KEY (copy_id, transaction_id),
	FOREIGN KEY (copy_id) REFERENCES Copy (copy_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (transaction_id) REFERENCES Library_Transaction (transaction_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE Make (
	transaction_id INT,
	member_id INT,
	PRIMARY KEY (transaction_id),
	FOREIGN KEY (transaction_id) REFERENCES Library_Transaction (transaction_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (member_id) REFERENCES Library_Member (member_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE Receive (
	recommendation_id INT,
	account_id INT,
	PRIMARY KEY (recommendation_id, account_id),
	FOREIGN KEY (recommendation_id) references Recommendation (recommendation_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (account_id) REFERENCES Member_Account (account_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE Consists_Of (
	recommendation_id INT,
	item_id INT,
	PRIMARY KEY (recommendation_id, item_id),
	FOREIGN KEY (recommendation_id) REFERENCES Recommendation (recommendation_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (item_id) REFERENCES Library_Item (item_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE Account_View (
	member_id INT,
	account_id INT,
	timestamp DATE NOT NULL,
	PRIMARY KEY (member_id),
	FOREIGN KEY (member_id) REFERENCES Library_Member (member_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (account_id) REFERENCES Member_Account (account_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE Generate (
	report_id INT,
	staff_id INT,
	PRIMARY KEY (report_id),
	FOREIGN KEY (report_id) REFERENCES Library_Report (report_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (staff_id) REFERENCES Staff (staff_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE Rating (
	member_id INT,
	item_id INT,
	stars_given INT NOT NULL,
	PRIMARY KEY (member_id, item_id),
	FOREIGN KEY (member_id) REFERENCES Library_Member (member_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (item_id) REFERENCES Library_Item (item_id) ON DELETE CASCADE ON UPDATE CASCADE,
	CHECK (
		stars_given >= 0
		AND stars_given <= 5
	)
);
CREATE TABLE Oversee (
	member_id INT,
	staff_id INT,
	PRIMARY KEY (member_id),
	FOREIGN KEY (staff_id) REFERENCES Staff (staff_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (member_id) REFERENCES Library_Member (member_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE Item_Update (
	copy_id INT,
	staff_id INT,
	PRIMARY KEY (copy_id),
	FOREIGN KEY (copy_id) REFERENCES Copy (copy_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (staff_id) REFERENCES Staff (staff_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE Originate (
	copy_id INT,
	item_id INT,
	PRIMARY KEY (copy_id),
	FOREIGN KEY (copy_id) REFERENCES Copy (copy_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (item_id) REFERENCES Library_Item (item_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE Publish (
	item_id INT,
	publisher_id INT,
	PRIMARY KEY (item_id),
	FOREIGN KEY (item_id) REFERENCES Library_Item (item_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (publisher_id) REFERENCES Publisher (publisher_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE Author_Write (
	item_id INT,
	author_id INT,
	PRIMARY KEY (item_id),
	FOREIGN KEY (item_id) REFERENCES Library_Item (item_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (author_id) REFERENCES Author (author_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE Categorize (
	item_id INT,
	genre_id INT,
	PRIMARY KEY (item_id),
	FOREIGN KEY (item_id) REFERENCES Library_Item (item_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (genre_id) REFERENCES Genre (genre_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE Give (
	recommendation_id INT,
	member_id INT,
	PRIMARY KEY (recommendation_id),
	FOREIGN KEY (recommendation_id) REFERENCES Recommendation (recommendation_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (member_id) REFERENCES Library_Member (member_id) ON DELETE CASCADE ON UPDATE CASCADE
);
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */
;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */
;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */
;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */
;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */
;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */
;
-- Dump completed on 2025-03-29 17:16:21