-- Copy --------------------------------------------------------------------
INSERT INTO Copy (copy_id, status)
VALUES -- Copies for books (1-300)
    (1, 'in_stock'),
    (2, 'checked_out'),
    (3, 'in_stock'),
    (4, 'checked_out'),
    (5, 'in_stock'),
    (6, 'in_stock'),
    (7, 'checked_out'),
    (8, 'in_stock'),
    (9, 'checked_out'),
    (10, 'in_stock'),
    -- Copies for digital media (301-400)
    (301, 'in_stock'),
    (302, 'checked_out'),
    (303, 'in_stock'),
    (304, 'in_stock'),
    (305, 'checked_out'),
    -- Copies for magazines (401-500)
    (401, 'in_stock'),
    (402, 'checked_out'),
    (403, 'in_stock'),
    (404, 'checked_out'),
    (405, 'in_stock');
-- Author  ------------------------------------------------------------------
INSERT INTO Author (author_id, name)
VALUES (1, 'J.K. Rowling'),
    (2, 'Stephen King'),
    (3, 'George R.R. Martin'),
    (4, 'Agatha Christie'),
    (5, 'J.R.R. Tolkien'),
    (6, 'Harper Lee'),
    (7, 'Dan Brown'),
    (8, 'Margaret Atwood'),
    (9, 'Neil Gaiman'),
    (10, 'Ernest Hemingway'),
    (11, 'Jane Austen'),
    (12, 'Charles Dickens'),
    (13, 'Mark Twain'),
    (14, 'Leo Tolstoy'),
    (15, 'F. Scott Fitzgerald'),
    (16, 'Virginia Woolf'),
    (17, 'Toni Morrison'),
    (18, 'Gabriel García Márquez'),
    (19, 'Chimamanda Ngozi Adichie'),
    (20, 'Kazuo Ishiguro'),
    (21, 'Yuval Noah Harari'),
    (22, 'Michelle Obama'),
    (23, 'Malcolm Gladwell'),
    (24, 'Brene Brown'),
    (25, 'James Clear'),
    (26, 'Colleen Hoover'),
    (27, 'Taylor Jenkins Reid'),
    (28, 'John Grisham'),
    (29, 'Michael Connelly'),
    (30, 'David Baldacci'),
    (31, 'Nora Roberts'),
    (32, 'Danielle Steel'),
    (33, 'Nicholas Sparks'),
    (34, 'Brandon Sanderson'),
    (35, 'Patrick Rothfuss'),
    (36, 'Robin Hobb'),
    (37, 'Ursula K. Le Guin'),
    (38, 'Octavia Butler'),
    (39, 'Isaac Asimov'),
    (40, 'Arthur C. Clarke'),
    (41, 'Philip K. Dick'),
    (42, 'William Gibson'),
    (43, 'Andy Weir'),
    (44, 'Blake Crouch'),
    (45, 'R.F. Kuang'),
    (46, 'Leigh Bardugo'),
    (47, 'Sarah J. Maas'),
    (48, 'V.E. Schwab'),
    (49, 'Madeline Miller'),
    (50, 'Emily St. John Mandel');
-- Genre  -------------------------------------------------------------------
INSERT INTO Genre (genre_id, genre_name)
VALUES (1, 'Fantasy'),
    (2, 'Horror'),
    (3, 'Mystery'),
    (4, 'Science Fiction'),
    (5, 'Romance'),
    (6, 'Thriller'),
    (7, 'Historical Fiction'),
    (8, 'Biography'),
    (9, 'Young Adult'),
    (10, 'Classic'),
    (11, 'Literary Fiction'),
    (12, 'Nonfiction'),
    (13, 'Self-Help'),
    (14, 'True Crime'),
    (15, 'Poetry');
-- Publisher  ---------------------------------------------------------------
INSERT INTO Publisher (publisher_id, name)
VALUES (1, 'Penguin Random House'),
    (2, 'HarperCollins'),
    (3, 'Simon & Schuster'),
    (4, 'Hachette Livre'),
    (5, 'Macmillan Publishers'),
    (6, 'Scholastic'),
    (7, 'Oxford University Press'),
    (8, 'Cambridge University Press'),
    (9, 'Bloomsbury'),
    (10, 'Tor Books'),
    (11, 'Vintage'),
    (12, 'Knopf Doubleday'),
    (13, 'Little, Brown'),
    (14, 'William Morrow'),
    (15, 'St. Martin Press'),
    (16, 'Putnam'),
    (17, 'Riverhead'),
    (18, 'Picador'),
    (19, 'Grove Press'),
    (20, 'Algonquin Books');
-- Library_Transaction  ----------------------------------------------------
INSERT INTO Library_Transaction (
        transaction_id,
        checked_out_date,
        due_date,
        return_date
    )
VALUES -- Current checkouts
    (1, '2023-05-01', '2023-05-15', NULL),
    (2, '2023-05-02', '2023-05-16', NULL),
    (3, '2023-05-03', '2023-05-17', NULL),
    -- Recently returned
    (4, '2023-04-15', '2023-04-29', '2023-04-28'),
    (5, '2023-04-16', '2023-04-30', '2023-04-29'),
    (6, '2023-04-17', '2023-05-01', '2023-04-30'),
    -- Overdue items
    (7, '2023-04-10', '2023-04-24', NULL),
    (8, '2023-04-11', '2023-04-25', NULL),
    (9, '2023-04-12', '2023-04-26', NULL),
    -- Historical transactions
    (10, '2023-01-05', '2023-01-19', '2023-01-18'),
    (11, '2023-01-10', '2023-01-24', '2023-01-23'),
    (12, '2023-01-15', '2023-01-29', '2023-01-28'),
    -- For statistics
    (13, '2023-02-01', '2023-02-15', '2023-02-14'),
    (14, '2023-02-05', '2023-02-19', '2023-02-18'),
    (15, '2023-02-10', '2023-02-24', '2023-02-23'),
    (16, '2023-03-01', '2023-03-15', '2023-03-14'),
    (17, '2023-03-05', '2023-03-19', '2023-03-18'),
    (18, '2023-03-10', '2023-03-24', '2023-03-23'),
    -- Late returns
    (19, '2023-03-15', '2023-03-29', '2023-04-02'),
    (20, '2023-03-20', '2023-04-03', '2023-04-05'),
    (21, '2023-03-25', '2023-04-08', '2023-04-10'),
    -- Different member types
    (22, '2023-04-01', '2023-04-15', '2023-04-14'),
    (23, '2023-04-02', '2023-04-16', '2023-04-15'),
    (24, '2023-04-03', '2023-04-17', '2023-04-16'),
    -- Different genres
    (25, '2023-04-05', '2023-04-19', '2023-04-18'),
    (26, '2023-04-06', '2023-04-20', '2023-04-19'),
    (27, '2023-04-07', '2023-04-21', '2023-04-20'),
    -- For peak hours analysis
    (28, '2023-05-05 10:00:00', '2023-05-19', NULL),
    (29, '2023-05-05 14:30:00', '2023-05-19', NULL),
    (30, '2023-05-06 16:45:00', '2023-05-20', NULL);
-- Fine  -------------------------------------------------------------------
INSERT INTO Fine (fine_id, fine_amount, fine_date, fine_status)
VALUES -- Paid fines
    (1, 2.50, '2023-04-06', 'paid'),
    (2, 5.00, '2023-04-20', 'paid'),
    (3, 1.50, '2023-03-30', 'paid'),
    -- Unpaid fines
    (4, 3.75, '2023-05-01', 'unpaid'),
    (5, 6.25, '2023-05-05', 'unpaid'),
    (6, 2.00, '2023-05-10', 'unpaid'),
    -- Historical fines
    (7, 4.50, '2023-01-15', 'paid'),
    (8, 3.00, '2023-01-20', 'paid'),
    (9, 5.50, '2023-02-10', 'paid'),
    -- Different member types
    (10, 2.25, '2023-03-05', 'paid'),
    (11, 1.75, '2023-03-10', 'paid'),
    (12, 3.50, '2023-03-15', 'paid'),
    -- For reporting
    (13, 4.00, '2023-04-01', 'paid'),
    (14, 2.50, '2023-04-05', 'paid'),
    (15, 5.75, '2023-04-10', 'paid');
-- Library_Item  -----------------------------------------------------------
INSERT INTO Library_Item (
        item_id,
        checked_out_status,
        current_inventory,
        overdue_status
    )
VALUES -- Books (1-100)
    (1, 0, 5, 0),
    (2, 1, 3, 0),
    (3, 0, 2, 0),
    (4, 1, 4, 1),
    (5, 0, 3, 0),
    (6, 0, 1, 0),
    (7, 1, 2, 0),
    (8, 0, 3, 0),
    (9, 1, 2, 1),
    (10, 0, 4, 0),
    (11, 0, 5, 0),
    (12, 0, 3, 0),
    (13, 0, 2, 0),
    (14, 0, 4, 0),
    (15, 0, 5, 0),
    (16, 0, 1, 0),
    -- Digital Media (101-150)
    (101, 0, 1, 0),
    (102, 1, 1, 0),
    (103, 0, 1, 0),
    (104, 0, 1, 0),
    (105, 1, 1, 0),
    -- Magazines (151-200)
    (151, 0, 5, 0),
    (152, 1, 3, 0),
    (153, 0, 2, 0),
    (154, 1, 4, 0),
    (155, 0, 3, 0);
-- Book --------------------------------------------------------------------
INSERT INTO Book (
        item_id,
        author,
        availability_status,
        book_rating,
        genre,
        ISBN,
        title,
        publication_year
    )
VALUES (
        1,
        'J.K. Rowling',
        1,
        4.8,
        'Fantasy',
        '978-0747532743',
        'Harry Potter and the Philosopher''s Stone',
        1997
    ),
    (
        2,
        'Stephen King',
        1,
        4.5,
        'Horror',
        '978-0307743657',
        'The Shining',
        1977
    ),
    (
        3,
        'George R.R. Martin',
        1,
        4.7,
        'Fantasy',
        '978-0553103540',
        'A Game of Thrones',
        1996
    ),
    (
        4,
        'Agatha Christie',
        1,
        4.2,
        'Mystery',
        '978-0062073501',
        'Murder on the Orient Express',
        1934
    ),
    (
        5,
        'J.R.R. Tolkien',
        1,
        4.9,
        'Fantasy',
        '978-0618640157',
        'The Lord of the Rings',
        1954
    ),
    (
        6,
        'Harper Lee',
        1,
        4.8,
        'Classic',
        '978-0061120084',
        'To Kill a Mockingbird',
        1960
    ),
    (
        7,
        'Dan Brown',
        1,
        3.9,
        'Thriller',
        '978-0307474278',
        'The Da Vinci Code',
        2003
    ),
    (
        8,
        'Margaret Atwood',
        1,
        4.3,
        'Science Fiction',
        '978-0385543781',
        'The Handmaid''s Tale',
        1985
    ),
    (
        9,
        'Neil Gaiman',
        1,
        4.2,
        'Fantasy',
        '978-0062255655',
        'American Gods',
        2001
    ),
    (
        10,
        'Ernest Hemingway',
        1,
        4.0,
        'Classic',
        '978-0684801469',
        'The Old Man and the Sea',
        1952
    ),
    (
        11,
        'J.K. Rowling',
        1,
        4.1,
        'Fantasy',
        '978-1338878950',
        'Harry Potter and the Goblet of Fire',
        2000
    ),
    (
        12,
        'J.K. Rowling',
        1,
        4.2,
        'Fantasy',
        '978-0439064866',
        'Harry Potter and the Chamber of Secrets',
        1998
    ),
    (
        13,
        'J.K. Rowling',
        1,
        4.3,
        'Fantasy',
        '978-0439136358',
        'Harry Potter and the Prisoner of Azkaban',
        1999
    ),
    (
        14,
        'J.K. Rowling',
        1,
        4.4,
        'Fantasy',
        '978-0439358064',
        'Harry Potter and the Order of the Phoenix',
        2003
    ),
    (
        15,
        'J.K. Rowling',
        1,
        4.5,
        'Fantasy',
        '978-0439784542',
        'Harry Potter and the Half-Blood Prince',
        2005
    ),
    (
        16,
        'J.K. Rowling',
        1,
        4.6,
        'Fantasy',
        '978-1338878981',
        'Harry Potter and the Deathly Hallows',
        2007
    );
-- Digital_Media_Item ------------------------------------------------------
INSERT INTO Digital_Media_Item (
        item_id,
        author,
        availability_status,
        genre,
        ISBN,
        title,
        publication_year
    )
VALUES (
        101,
        'Malcolm Gladwell',
        1,
        'Nonfiction',
        '978-0316017930',
        'Outliers',
        2008
    ),
    (
        102,
        'James Clear',
        1,
        'Self-Help',
        '978-0735211292',
        'Atomic Habits',
        2018
    ),
    (
        103,
        'Brene Brown',
        1,
        'Self-Help',
        '978-1592408412',
        'Daring Greatly',
        2012
    ),
    (
        104,
        'Michelle Obama',
        1,
        'Biography',
        '978-0525633751',
        'Becoming (Audiobook)',
        2018
    ),
    (
        105,
        'Yuval Noah Harari',
        1,
        'Nonfiction',
        '978-0062316110',
        'Homo Deus (eBook)',
        2017
    );
-- Magazine ---------------------------------------------------------------
INSERT INTO Magazine (
        item_id,
        author,
        availability_status,
        genre,
        ISSN,
        issue_number,
        title,
        publication_date
    )
VALUES (
        151,
        'National Geographic Society',
        1,
        'Science',
        '0027-9358',
        245,
        'National Geographic',
        '2023-05-01'
    ),
    (
        152,
        'Time USA',
        1,
        'News',
        '0040-781X',
        195,
        'Time',
        '2023-04-15'
    ),
    (
        153,
        'The Economist Group',
        1,
        'Business',
        '0013-0613',
        9012,
        'The Economist',
        '2023-04-29'
    ),
    (
        154,
        'Conde Nast',
        1,
        'Fashion',
        '0032-8061',
        825,
        'Vogue',
        '2023-05-10'
    ),
    (
        155,
        'Hearst Communications',
        1,
        'Health',
        '0028-6583',
        102,
        'Good Housekeeping',
        '2023-05-05'
    );
-- Library_Report ----------------------------------------------------------
INSERT INTO Library_Report (
        report_id,
        number_of_checkouts,
        report_date,
        total_amount_owed_per_day,
        total_amount_paid_per_day
    )
VALUES (1, 85, '2023-01-31', 12.50, 10.00),
    (2, 92, '2023-02-28', 15.75, 12.50),
    (3, 105, '2023-03-31', 18.25, 15.00),
    (4, 88, '2023-04-30', 10.50, 8.75),
    (5, 76, '2023-05-31', 9.25, 7.50);
-- Member_Account ----------------------------------------------------------
INSERT INTO Member_Account (
        account_id,
        incurred_fees,
        overdue_balance,
        total_amount_paid
    )
VALUES -- Regular members
    (1, 5.50, 2.00, 15.00),
    (2, 3.00, 0.00, 8.50),
    (3, 10.00, 10.00, 0.00),
    -- Student members
    (11, 2.50, 0.00, 5.00),
    (12, 0.00, 0.00, 2.50),
    (13, 1.50, 1.50, 3.00),
    -- Senior citizens
    (21, 0.00, 0.00, 0.00),
    (22, 3.50, 0.00, 7.00),
    (23, 5.00, 5.00, 0.00),
    -- Additional accounts
    (31, 2.00, 0.00, 4.00),
    (32, 1.25, 0.00, 2.50),
    (33, 0.00, 0.00, 0.00),
    (34, 3.75, 3.75, 0.00),
    (35, 2.50, 0.00, 5.00),
    (36, 1.00, 0.00, 2.00);
-- Staff -------------------------------------------------------------------
INSERT INTO Staff (staff_id, role, name)
VALUES (1, 'Head Librarian', 'James Wilson'),
    (2, 'Assistant Librarian', 'Mary Thompson'),
    (3, 'Circulation Desk', 'Robert Garcia'),
    (4, 'IT Specialist', 'Jennifer Martinez'),
    (5, 'Cataloging Specialist', 'David Robinson'),
    (6, 'Reference Librarian', 'Lisa Clark'),
    (7, 'Children Librarian', 'Thomas Rodriguez'),
    (8, 'Acquisitions', 'Susan Lewis'),
    (9, 'Archivist', 'Daniel Walker'),
    (10, 'Library Assistant', 'Karen Hall'),
    (11, 'Library Assistant', 'Paul Young'),
    (12, 'Evening Supervisor', 'Nancy Allen'),
    (13, 'Weekend Staff', 'Kevin King'),
    (14, 'Digital Resources', 'Amanda Wright'),
    (15, 'Outreach Coordinator', 'Jason Hill');
-- Library_Member ---------------------------------------------------------
INSERT INTO Library_Member (
        member_id,
        book_limit,
        fee_type,
        type_id,
        name,
        contact_information,
        account_status
    )
VALUES -- Regular members (type_id=1)
    (
        1,
        5,
        0.30,
        1,
        'John Smith',
        'john.smith@email.com',
        'active'
    ),
    (
        2,
        5,
        0.30,
        1,
        'Sarah Johnson',
        'sarah.j@email.com',
        'active'
    ),
    (
        3,
        5,
        0.30,
        1,
        'Michael Brown',
        'michael.b@email.com',
        'inactive'
    ),
    (
        31,
        5,
        0.30,
        1,
        'Jennifer Adams',
        'jennifer.a@email.com',
        'active'
    ),
    (
        34,
        5,
        0.30,
        1,
        'Thomas Young',
        'thomas.y@email.com',
        'active'
    ),
    -- Student members (type_id=2)
    (
        11,
        10,
        0.20,
        2,
        'Emily Davis',
        'emily.d@university.edu',
        'active'
    ),
    (
        12,
        10,
        0.20,
        2,
        'David Wilson',
        'david.w@university.edu',
        'active'
    ),
    (
        13,
        10,
        0.20,
        2,
        'Jessica Lee',
        'jessica.l@college.edu',
        'active'
    ),
    (
        32,
        10,
        0.20,
        2,
        'Daniel Martin',
        'daniel.m@university.edu',
        'active'
    ),
    (
        35,
        10,
        0.20,
        2,
        'Elizabeth Scott',
        'elizabeth.s@college.edu',
        'active'
    ),
    -- Senior citizens (type_id=3)
    (
        21,
        5,
        0.15,
        3,
        'Robert Taylor',
        'robert.t@email.com',
        'active'
    ),
    (
        22,
        5,
        0.15,
        3,
        'Margaret Clark',
        'margaret.c@email.com',
        'active'
    ),
    (
        23,
        5,
        0.15,
        3,
        'Richard White',
        'richard.w@email.com',
        'inactive'
    ),
    (
        33,
        5,
        0.15,
        3,
        'Patricia Hall',
        'patricia.h@email.com',
        'active'
    ),
    (
        36,
        5,
        0.15,
        3,
        'Charles Allen',
        'charles.a@email.com',
        'active'
    );
-- Waitlist ----------------------------------------------------------------
INSERT INTO Waitlist (
        waitlist_id,
        request_date,
        waitlist_status,
        fulfilled_date
    )
VALUES -- Fulfilled requests
    (
        1,
        '2023-03-01',
        'available_for_checkout',
        '2023-03-15'
    ),
    (
        2,
        '2023-03-05',
        'available_for_checkout',
        '2023-03-20'
    ),
    (
        3,
        '2023-03-10',
        'available_for_checkout',
        '2023-03-25'
    ),
    -- Current holds
    (4, '2023-04-01', 'on_hold', NULL),
    (5, '2023-04-05', 'on_hold', NULL),
    (6, '2023-04-10', 'on_hold', NULL),
    -- Different items
    (
        7,
        '2023-04-15',
        'available_for_checkout',
        '2023-04-30'
    ),
    (8, '2023-04-20', 'on_hold', NULL),
    (
        9,
        '2023-04-25',
        'available_for_checkout',
        '2023-05-10'
    ),
    (10, '2023-05-01', 'on_hold', NULL);
-- Regular -----------------------------------------------------------------
INSERT INTO Regular (member_id, available_limit)
VALUES (1, 5),
    (2, 5),
    (3, 5),
    (31, 5),
    (34, 5);
-- Student -----------------------------------------------------------------
INSERT INTO Student (member_id, available_limit)
VALUES (11, 10),
    (12, 10),
    (13, 10),
    (32, 10),
    (35, 10);
-- Senior_Citizen ----------------------------------------------------------
INSERT INTO Senior_Citizen (member_id, available_limit)
VALUES (21, 5),
    (22, 5),
    (23, 5),
    (33, 5),
    (36, 5);
-- Recommendation ----------------------------------------------------------
INSERT INTO Recommendation (recommendation_id)
VALUES (1),
    (2),
    (3),
    (4),
    (5);
-- Added -------------------------------------------------------------------
INSERT INTO Added (copy_id, waitlist_id)
VALUES (1, 1),
    -- Copy 1 added for waitlist 1
    (6, 2),
    -- Copy 6 added for waitlist 2
    (9, 3);
-- Copy 9 added for waitlist 3
-- Hold --------------------------------------------------------------------
INSERT INTO Hold (member_id, copy_id)
VALUES (1, 4),
    -- Member 1 holding copy 4
    (11, 7),
    -- Member 11 holding copy 7
    (21, 10);
-- Member 21 holding copy 10
-- Pay ---------------------------------------------------------------------
INSERT INTO Pay (fine_id, member_id, amount_paid, paid_date)
VALUES (1, 1, 2.50, '2023-04-06'),
    (2, 11, 5.00, '2023-04-20'),
    (3, 21, 1.50, '2023-03-30'),
    (7, 2, 4.50, '2023-01-15'),
    (8, 12, 3.00, '2023-01-20');
-- Incur -------------------------------------------------------------------
INSERT INTO Incur (transaction_id, fine_id)
VALUES (19, 1),
    -- Late return transaction 19 incurred fine 1
    (20, 2),
    -- Late return transaction 20 incurred fine 2
    (21, 3),
    -- Late return transaction 21 incurred fine 3
    (13, 7),
    -- Historical late return
    (14, 8);
-- Historical late return
-- Process -----------------------------------------------------------------
INSERT INTO Process (transaction_id, staff_id)
VALUES (1, 3),
    -- Clerk processed transaction 1
    (2, 3),
    -- Clerk processed transaction 2
    (3, 6),
    -- Reference librarian processed transaction 3
    (10, 2),
    -- Assistant librarian processed transaction 10
    (19, 1);
-- Head librarian processed transaction 19
-- Loan --------------------------------------------------------------------
INSERT INTO Loan (copy_id, transaction_id)
VALUES (2, 1),
    -- Copy 2 loaned in transaction 1
    (4, 2),
    -- Copy 4 loaned in transaction 2
    (7, 3),
    -- Copy 7 loaned in transaction 3
    (9, 4),
    -- Copy 9 loaned in transaction 4
    (10, 5);
-- Copy 10 loaned in transaction 5
-- Make  -------------------------------------------------------------------
INSERT INTO Make (transaction_id, member_id)
VALUES (1, 1),
    -- Member 1 made transaction 1
    (2, 11),
    -- Member 11 made transaction 2
    (3, 21),
    -- Member 21 made transaction 3
    (4, 2),
    -- Member 2 made transaction 4
    (5, 12);
-- Member 12 made transaction 5
-- Receive -----------------------------------------------------------------
INSERT INTO Receive (recommendation_id, account_id)
VALUES (1, 2),
    (2, 12),
    (3, 22);
-- Consists_Of -------------------------------------------------------------
INSERT INTO Consists_Of (recommendation_id, item_id)
VALUES (1, 1),
    (1, 3),
    (1, 5),
    (2, 101),
    (2, 102),
    (3, 6),
    (3, 10);
-- Account_View ------------------------------------------------------------
INSERT INTO Account_View (member_id, account_id, timestamp)
VALUES (1, 1, '2023-05-01'),
    (11, 11, '2023-05-05'),
    (21, 21, '2023-05-10');
-- Generate ----------------------------------------------------------------
INSERT INTO Generate (report_id, staff_id)
VALUES (1, 1),
    -- Head librarian generated January report
    (2, 1),
    -- Head librarian generated February report
    (3, 1),
    -- Head librarian generated March report
    (4, 1),
    -- Head librarian generated April report
    (5, 1);
-- Head librarian generated May report
-- Rating ------------------------------------------------------------------
INSERT INTO Rating (member_id, item_id, stars_given)
VALUES (1, 1, 5),
    -- Member 1 gave 5 stars to Harry Potter
    (1, 3, 4),
    -- Member 1 gave 4 stars to Game of Thrones
    (11, 2, 3),
    -- Member 11 gave 3 stars to The Shining
    (21, 5, 5),
    -- Member 21 gave 5 stars to Lord of the Rings
    (2, 101, 4);
-- Member 2 gave 4 stars to Outliers
-- Oversee -----------------------------------------------------------------
INSERT INTO Oversee (member_id, staff_id)
VALUES (1, 1),
    -- Head librarian oversees member 1
    (11, 2),
    -- Assistant librarian oversees member 11
    (21, 3),
    -- Circulation desk oversees member 21
    (2, 6),
    -- Reference librarian oversees member 2
    (12, 7);
-- Children's librarian oversees member 12
-- Item_Update -------------------------------------------------------------
INSERT INTO Item_Update (copy_id, staff_id)
VALUES (1, 4),
    -- IT Specialist updated copy 1
    (2, 5),
    -- Cataloging specialist updated copy 2
    (3, 8);
-- Acquisitions updated copy 3
-- Originate ---------------------------------------------------------------
INSERT INTO Originate (copy_id, item_id)
VALUES -- Book copies
    (1, 1),
    (2, 1),
    (3, 1),
    (4, 1),
    (5, 1),
    -- 5 copies of Harry Potter
    (6, 2),
    (7, 2),
    (8, 2),
    -- 3 copies of The Shining
    (9, 3),
    (10, 3),
    -- 2 copies of Game of Thrones
    -- Digital media copies
    (301, 101),
    -- 1 copy of Outliers
    (302, 102),
    -- 1 copy of Atomic Habits
    -- Magazine copies
    (401, 151),
    (402, 151),
    (403, 151),
    (404, 151),
    (405, 151);
-- 5 copies of National Geographic
-- Publish -----------------------------------------------------------------
INSERT INTO Publish (item_id, publisher_id)
VALUES -- Books
    (1, 9),
    -- Harry Potter by Bloomsbury
    (2, 1),
    -- The Shining by Penguin
    (3, 1),
    -- Game of Thrones by Penguin
    -- Digital media
    (101, 3),
    -- Outliers by Simon & Schuster
    (102, 1),
    -- Atomic Habits by Penguin
    -- Magazines
    (151, 6),
    -- National Geographic by Scholastic
    (152, 3);
-- Time by Simon & Schuster
-- Author_Write ------------------------------------------------------------
INSERT INTO Author_Write (item_id, author_id)
VALUES -- Books
    (1, 1),
    -- Harry Potter by J.K. Rowling
    (2, 2),
    -- The Shining by Stephen King
    (3, 3),
    -- Game of Thrones by George R.R. Martin
    -- Digital media
    (101, 23),
    -- Outliers by Malcolm Gladwell
    (102, 25),
    -- Atomic Habits by James Clear
    -- Magazines (no single author)
    (151, NULL),
    (152, NULL);
-- Categorize --------------------------------------------------------------
INSERT INTO Categorize (item_id, genre_id)
VALUES -- Books
    (1, 1),
    -- Harry Potter - Fantasy
    (2, 2),
    -- The Shining - Horror
    (3, 1),
    -- Game of Thrones - Fantasy
    -- Digital media
    (101, 12),
    -- Outliers - Nonfiction
    (102, 13),
    -- Atomic Habits - Self-Help
    -- Magazines
    (151, 4),
    -- National Geographic - Science
    (152, 6);
-- Time - News
-- Give --------------------------------------------------------------------
INSERT INTO Give (recommendation_id, member_id)
VALUES (1, 1),
    (2, 11),
    (3, 21);