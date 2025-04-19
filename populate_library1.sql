-- Copy --------------------------------------------------------------------
INSERT INTO Copy (copy_id, status)
VALUES (1, 'checked_out'),
    (2, 'checked_out'),
    (3, 'checked_out'),
    (4, 'checked_out'),
    (5, 'checked_out'),
    (6, 'checked_out'),
    (7, 'checked_out'),
    (8, 'checked_out'),
    (9, 'checked_out'),
    (10, 'checked_out'),
    (11, 'in_stock'),
    (12, 'in_stock'),
    (301, 'checked_out'),
    (302, 'checked_out'),
    (303, 'checked_out'),
    (304, 'checked_out'),
    (305, 'checked_out'),
    (401, 'checked_out'),
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
-- Library_Transaction ----------------------------------------------------
INSERT INTO Library_Transaction (
        transaction_id,
        checked_out_date,
        due_date,
        return_date
    )
VALUES (1, '2025-04-10', '2025-04-24', NULL),
    (2, '2025-04-02', '2025-04-16', NULL),
    (3, '2025-04-03', '2025-04-17', NULL),
    (4, '2025-03-15', '2025-03-29', '2025-03-28'),
    (5, '2025-03-16', '2025-03-30', '2025-03-29'),
    (6, '2025-03-18', '2025-04-01', '2025-03-31'),
    (7, '2025-03-19', '2025-04-02', NULL),
    (8, '2025-03-20', '2025-04-03', NULL),
    (9, '2025-03-21', '2025-04-04', '2025-04-03'),
    (10, '2025-03-22', '2025-04-05', '2025-04-04'),
    (11, '2025-03-23', '2025-04-06', NULL),
    (12, '2025-03-24', '2025-04-07', NULL),
    (13, '2025-03-25', '2025-04-08', NULL),
    (14, '2025-03-26', '2025-04-09', NULL),
    (15, '2025-03-27', '2025-04-10', NULL),
    (16, '2025-03-28', '2025-04-11', NULL),
    (17, '2025-03-10', '2025-03-24', NULL),
    (18, '2025-03-11', '2025-03-25', NULL),
    (19, '2025-03-12', '2025-03-26', NULL),
    (20, '2024-01-05', '2024-01-19', '2024-01-18'),
    (21, '2024-01-10', '2024-01-24', '2024-01-23'),
    (22, '2024-01-15', '2024-01-29', '2024-01-28'),
    (23, '2024-02-01', '2024-02-15', '2024-02-14'),
    (24, '2024-02-05', '2024-02-19', '2024-02-18'),
    (25, '2024-02-10', '2024-02-24', '2024-02-23'),
    (26, '2024-03-01', '2024-03-15', '2024-03-14'),
    (27, '2024-03-05', '2024-03-19', '2024-03-18'),
    (28, '2024-03-10', '2024-03-24', '2024-03-23'),
    (29, '2024-03-15', '2024-03-29', '2024-04-02'),
    (30, '2024-03-20', '2024-04-03', '2024-04-05');
-- Fine  -------------------------------------------------------------------
INSERT INTO Fine (fine_id, fine_amount, fine_date, fine_status)
VALUES -- Paid fines
    (1, 2.50, '2025-03-06', 'paid'),
    (2, 5.00, '2025-03-20', 'paid'),
    (3, 1.50, '2025-02-28', 'paid'),
    -- Unpaid fines
    (4, 3.75, '2025-04-01', 'unpaid'),
    (5, 6.25, '2025-04-05', 'unpaid'),
    (6, 2.00, '2025-04-10', 'unpaid'),
    -- Historical fines
    (7, 4.50, '2024-01-15', 'paid'),
    (8, 3.00, '2024-01-20', 'paid'),
    (9, 5.50, '2024-02-10', 'paid'),
    -- Different member types
    (10, 2.25, '2024-03-05', 'paid'),
    (11, 1.75, '2024-03-10', 'paid'),
    (12, 3.50, '2024-03-15', 'paid'),
    -- For reporting
    (13, 4.00, '2025-03-01', 'paid'),
    (14, 2.50, '2025-03-05', 'paid'),
    (15, 5.75, '2025-03-10', 'paid');
-- Library_Item  -----------------------------------------------------------
INSERT INTO Library_Item (
        item_id,
        checked_out_status,
        current_inventory,
        overdue_status
    )
VALUES (1, 1, 5, 0),
    (2, 1, 3, 0),
    (3, 1, 2, 0),
    (4, 1, 4, 1),
    (5, 1, 3, 0),
    (6, 1, 1, 0),
    (7, 1, 2, 0),
    (8, 1, 3, 0),
    (9, 1, 2, 1),
    (10, 1, 4, 0),
    (11, 0, 5, 0),
    (12, 0, 3, 0),
    (13, 0, 2, 0),
    (14, 0, 4, 0),
    (15, 0, 5, 0),
    (16, 0, 1, 0),
    (101, 1, 1, 0),
    (102, 1, 1, 0),
    (103, 0, 1, 0),
    (104, 0, 1, 0),
    (105, 1, 1, 0),
    (151, 1, 5, 0),
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
        '2025-03-01'
    ),
    (
        152,
        'Time USA',
        1,
        'News',
        '0040-781X',
        195,
        'Time',
        '2025-02-15'
    ),
    (
        153,
        'The Economist Group',
        1,
        'Business',
        '0013-0613',
        9012,
        'The Economist',
        '2025-03-29'
    ),
    (
        154,
        'Conde Nast',
        1,
        'Fashion',
        '0032-8061',
        825,
        'Vogue',
        '2025-04-10'
    ),
    (
        155,
        'Hearst Communications',
        1,
        'Health',
        '0028-6583',
        102,
        'Good Housekeeping',
        '2025-04-05'
    );
-- Library_Report ----------------------------------------------------------
INSERT INTO Library_Report (
        report_id,
        number_of_checkouts,
        report_date,
        total_amount_owed_per_day,
        total_amount_paid_per_day
    )
VALUES (1, 85, '2024-01-31', 12.50, 10.00),
    (2, 92, '2024-02-28', 15.75, 12.50),
    (3, 105, '2024-03-31', 18.25, 15.00),
    (4, 88, '2025-03-31', 10.50, 8.75),
    (5, 76, '2025-04-15', 9.25, 7.50);
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
        '2025-02-01',
        'available_for_checkout',
        '2025-02-15'
    ),
    (
        2,
        '2025-02-05',
        'available_for_checkout',
        '2025-02-20'
    ),
    (
        3,
        '2025-02-10',
        'available_for_checkout',
        '2025-02-25'
    ),
    -- Current holds
    (4, '2025-03-01', 'on_hold', NULL),
    (5, '2025-03-05', 'on_hold', NULL),
    (6, '2025-03-10', 'on_hold', NULL),
    -- Different items
    (
        7,
        '2025-03-15',
        'available_for_checkout',
        '2025-03-30'
    ),
    (8, '2025-04-01', 'on_hold', NULL),
    (
        9,
        '2025-04-05',
        'available_for_checkout',
        '2025-04-18'
    ),
    (10, '2025-04-10', 'on_hold', NULL);
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
    (6, 2),
    (9, 3);
-- Hold --------------------------------------------------------------------
INSERT INTO Hold (member_id, copy_id)
VALUES (1, 4),
    (11, 7),
    (21, 10);
-- Pay ---------------------------------------------------------------------
INSERT INTO Pay (fine_id, member_id, amount_paid, paid_date)
VALUES (1, 1, 2.50, '2025-03-06'),
    (2, 11, 5.00, '2025-03-20'),
    (3, 21, 1.50, '2025-02-28'),
    (7, 2, 4.50, '2024-01-15'),
    (8, 12, 3.00, '2024-01-20');
-- Incur -------------------------------------------------------------------
INSERT INTO Incur (transaction_id, fine_id)
VALUES (19, 1),
    (20, 2),
    (21, 3),
    (13, 7),
    (14, 8);
-- Process -----------------------------------------------------------------
INSERT INTO Process (transaction_id, staff_id)
VALUES (1, 3),
    (2, 3),
    (3, 6),
    (10, 2),
    (19, 1);
-- Loan --------------------------------------------------------------------
INSERT INTO Loan (copy_id, transaction_id)
VALUES (2, 1),
    (4, 2),
    (7, 3),
    (9, 4),
    (10, 5),
    (1, 6),
    (3, 7),
    (5, 8),
    (6, 9),
    (8, 10),
    (301, 11),
    (302, 12),
    (303, 13),
    (304, 14),
    (305, 15),
    (401, 16),
    (402, 17),
    (404, 18),
    (405, 19),
    (1, 20),
    (2, 21),
    (3, 22),
    (4, 23),
    (5, 24),
    (6, 25),
    (7, 26),
    (8, 27),
    (9, 28),
    (10, 29),
    (301, 30);
-- Make  -------------------------------------------------------------------
INSERT INTO Make (transaction_id, member_id)
VALUES (1, 1),
    (2, 11),
    (3, 21),
    (4, 2),
    (5, 12),
    (6, 3),
    (7, 31),
    (8, 34),
    (9, 11),
    (10, 12),
    (11, 13),
    (12, 32),
    (13, 35),
    (14, 21),
    (15, 22),
    (16, 23),
    (17, 1),
    (18, 2),
    (19, 3),
    (20, 11),
    (21, 11),
    (22, 11),
    (23, 11),
    (24, 22),
    (25, 22),
    (26, 31),
    (27, 32),
    (28, 33),
    (29, 34),
    (30, 35);
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
VALUES (1, 1, '2025-04-01'),
    (11, 11, '2025-04-05'),
    (21, 21, '2025-04-10');
-- Generate ----------------------------------------------------------------
INSERT INTO Generate (report_id, staff_id)
VALUES (1, 1),
    (2, 1),
    (3, 1),
    (4, 1),
    (5, 1);
-- Rating ------------------------------------------------------------------
INSERT INTO Rating (member_id, item_id, stars_given)
VALUES (1, 1, 5),
    (1, 3, 4),
    (11, 2, 3),
    (21, 5, 5),
    (2, 101, 4);
-- Oversee -----------------------------------------------------------------
INSERT INTO Oversee (member_id, staff_id)
VALUES (1, 1),
    (11, 2),
    (21, 3),
    (2, 6),
    (12, 7);
-- Item_Update -------------------------------------------------------------
INSERT INTO Item_Update (copy_id, staff_id)
VALUES (1, 4),
    (2, 5),
    (3, 8);
-- Originate ---------------------------------------------------------------
INSERT INTO Originate (copy_id, item_id)
VALUES -- Book copies
    (1, 1),
    (2, 1),
    (3, 1),
    (4, 1),
    (5, 1),
    (6, 2),
    (7, 2),
    (8, 2),
    (9, 3),
    (10, 3),
    (11, 3),
    (12, 1),
    -- Digital media copies
    (301, 101),
    (302, 102),
    -- Magazine copies
    (401, 151),
    (402, 151),
    (403, 151),
    (404, 151),
    (405, 151);
-- Publish -----------------------------------------------------------------
INSERT INTO Publish (item_id, publisher_id)
VALUES -- Books
    (1, 9),
    (2, 1),
    (3, 1),
    -- Digital media
    (101, 3),
    (102, 1),
    -- Magazines
    (151, 6),
    (152, 3);
-- Author_Write ------------------------------------------------------------
INSERT INTO Author_Write (item_id, author_id)
VALUES -- Books
    (1, 1),
    (2, 2),
    (3, 3),
    -- Digital media
    (101, 23),
    (102, 25),
    -- Magazines (no single author)
    (151, NULL),
    (152, NULL);
-- Categorize --------------------------------------------------------------
INSERT INTO Categorize (item_id, genre_id)
VALUES -- Books
    (1, 1),
    (2, 2),
    (3, 1),
    -- Digital media
    (101, 12),
    (102, 13),
    -- Magazines
    (151, 4),
    (152, 6);
-- Give --------------------------------------------------------------------
INSERT INTO Give (recommendation_id, member_id)
VALUES (1, 1),
    (2, 11),
    (3, 21);