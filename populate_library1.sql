-- Copy --------------------------------------------------------------------
INSERT INTO Copy (copy_id, status)
VALUES (1, 'in_stock'),
    (2, 'checked_out'),
    (3, 'checked_out'),
    (4, 'checked_out'),
    (5, 'checked_out'),
    (6, 'in_stock'),
    (7, 'checked_out'),
    (8, 'checked_out'),
    (9, 'checked_out'),
    (10, 'checked_out'),
    (11, 'checked_out'),
    (12, 'in_stock'),
    (13, 'in_stock'),
    (14, 'in_stock'),
    (15, 'in_stock'),
    (16, 'in_stock'),
    (17, 'in_stock'),
    (18, 'in_stock'),
    (19, 'in_stock'),
    (20, 'in_stock'),
    (21, 'in_stock'),
    (22, 'in_stock'),
    (23, 'in_stock'),
    (24, 'in_stock'),
    (25, 'in_stock'),
    (26, 'in_stock'),
    (27, 'in_stock'),
    (28, 'in_stock'),
    (29, 'in_stock'),
    (301, 'checked_out'),
    (302, 'checked_out'),
    (303, 'checked_out'),
    (304, 'checked_out'),
    (305, 'checked_out'),
    (306, 'in_stock'),
    (307, 'in_stock'),
    (308, 'in_stock'),
    (309, 'in_stock'),
    (310, 'in_stock'),
    (311, 'in_stock'),
    (312, 'in_stock'),
    (313, 'in_stock'),
    (314, 'in_stock'),
    (315, 'in_stock'),
    (316, 'in_stock'),
    (317, 'in_stock'),
    (318, 'in_stock'),
    (319, 'in_stock'),
    (320, 'in_stock'),
    (401, 'checked_out'),
    (402, 'checked_out'),
    (403, 'in_stock'),
    (404, 'checked_out'),
    (405, 'in_stock'),
    (406, 'in_stock'),
    (407, 'in_stock'),
    (408, 'in_stock'),
    (409, 'in_stock'),
    (410, 'in_stock'),
    (411, 'in_stock'),
    (412, 'in_stock'),
    (413, 'in_stock'),
    (414, 'in_stock'),
    (415, 'in_stock'),
    (416, 'in_stock'),
    (417, 'in_stock'),
    (418, 'in_stock'),
    (419, 'in_stock'),
    (420, 'in_stock'),
    (421, 'in_stock'),
    (422, 'in_stock'),
    (423, 'in_stock'),
    (424, 'in_stock');
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
    (50, 'Emily St. John Mandel'),
    (51, 'Andy Weir'),
    (52, 'Rebecca Yarros'),
    (53, 'Emily Henry'),
    (54, 'Bonnie Garmus'),
    (55, 'Prince Harry'),
    (56, 'Britney Spears'),
    (57, 'Jennette McCurdy'),
    (58, 'Patrick Radden Keefe'),
    (59, 'David Grann'),
    (60, 'Freida McFadden'),
    (61, 'Matthew Perry'),
    (62, 'Tana French'),
    (63, 'Frieda McFadden'),
    (64, 'Jacqueline Winspear');
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
    (15, 'Poetry'),
    (16, 'Science'),
    (17, 'Technology'),
    (18, 'News'),
    (19, 'Fashion'),
    (20, 'Lifestyle'),
    (21, 'Travel'),
    (22, 'Business'),
    (23, 'Comics'),
    (24, 'Outdoors'),
    (25, 'Health');
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
    -- CHANGE UP THE RETURN DATE SO ITS NOT ALWAYS 13
    (2, '2025-04-02', '2025-04-16', NULL),
    (3, '2025-04-03', '2025-04-17', NULL),
    (4, '2025-03-15', '2025-03-29', '2025-03-25'),
    (5, '2025-03-16', '2025-03-30', '2025-03-22'),
    (6, '2025-03-18', '2025-04-01', '2025-03-29'),
    (7, '2025-03-19', '2025-04-02', NULL),
    (8, '2025-03-20', '2025-04-03', NULL),
    (9, '2025-03-21', '2025-04-04', '2025-04-01'),
    (10, '2025-03-22', '2025-04-05', '2025-04-04'),
    (11, '2025-03-23', '2025-04-06', NULL),
    (12, '2025-03-24', '2025-04-07', NULL),
    (13, '2025-03-25', '2025-04-08', NULL),
    (14, '2025-03-26', '2025-04-09', NULL),
    (15, '2025-03-27', '2025-04-10', NULL),
    (16, '2025-03-28', '2025-04-11', NULL),
    (17, '2025-03-10', '2025-03-24', NULL),
    (18, '2025-03-11', '2025-03-25', NULL),
    (19, '2025-03-12', '2025-03-26', '2025-03-23'),
    (20, '2024-01-05', '2024-01-19', '2024-01-10'),
    (21, '2024-01-10', '2024-01-24', '2024-01-20'),
    (22, '2024-01-15', '2024-01-29', '2024-01-25'),
    (23, '2024-02-01', '2024-02-15', '2024-02-12'),
    (24, '2024-02-05', '2024-02-19', '2024-02-11'),
    (25, '2024-02-10', '2024-02-24', '2024-02-19'),
    (26, '2024-03-01', '2024-03-15', '2024-03-13'),
    (27, '2024-03-05', '2024-03-19', '2024-03-15'),
    (28, '2024-03-10', '2024-03-24', '2024-03-20'),
    (29, '2024-03-15', '2024-03-29', '2024-04-02'),
    (30, '2024-03-20', '2024-04-03', '2024-04-05'),
    (31, '2024-09-21', '2024-10-05', '2024-10-03'),
    (32, '2025-03-01', '2025-03-14', '2025-03-17'),
    (33, '2025-03-02', '2025-03-15', '2025-03-18'),
    (34, '2025-03-03', '2025-03-16', '2025-03-19'),
    (35, '2025-03-04', '2025-03-17', '2025-03-20'),
    (36, '2025-04-23', '2025-05-07', NULL),
    (37, '2025-04-23', '2025-05-07', NULL),
    (38, '2025-04-23', '2025-05-07', NULL),
    (39, '2025-04-23', '2025-05-07', NULL);
-- Fine  -------------------------------------------------------------------
INSERT INTO Fine (fine_id, fine_amount, fine_date, fine_status)
VALUES -- Paid fines
    -- (1, 2.50, '2025-03-06', 'paid'),
    -- (2, 5.00, '2025-04-20', 'paid'),
    -- (3, 1.50, '2025-02-28', 'paid'),
    -- -- Unpaid fines
    -- (4, 3.75, '2025-04-01', 'unpaid'),
    -- (5, 6.25, '2025-04-05', 'unpaid'),
    -- (6, 2.00, '2025-04-10', 'unpaid'),
    -- -- Historical fines
    -- (7, 4.50, '2024-01-15', 'paid'),
    -- (8, 3.00, '2024-01-20', 'paid'),
    -- (9, 5.50, '2024-02-10', 'paid'),
    -- -- Different member types
    -- (10, 2.25, '2024-03-05', 'paid'),
    -- (11, 1.75, '2024-03-10', 'paid'),
    -- (12, 3.50, '2024-03-15', 'paid'),
    -- -- For reporting
    -- (13, 4.00, '2025-03-01', 'paid'),
    -- (14, 2.50, '2025-03-05', 'paid'),
    -- (15, 5.75, '2025-03-10', 'paid');
    (1, 1.00, "2025-04-17", "unpaid"),
    (2, 0.60, "2025-04-17", "unpaid"),
    (3, 5.70, "2025-04-02", "unpaid"),
    (4, 5.40, "2025-04-03", "unpaid"),
    (5, 3.00, "2025-04-06", "unpaid"),
    (6, 2.80, "2025-04-07", "unpaid"),
    (7, 2.60, "2025-04-08", "unpaid"),
    (8, 1.80, "2025-04-09", "unpaid"),
    (9, 1.65, "2025-04-10", "unpaid"),
    (10, 1.50, "2025-04-11", "unpaid"),
    (11, 8.40, "2025-03-24", "unpaid"),
    (12, 8.10, "2025-03-25", "unpaid"),
    (13, 0.40, "2024-04-05", "paid"),
    (14, 1.20, "2024-04-02", "paid"),
    (15, 0.90, "2025-03-14", "paid"),
    (16, 0.60, "2025-03-15", "paid"),
    (17, 0.90, "2025-03-16", "paid"),
    (18, 0.45, "2025-03-17", "paid");
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
    (17, 0, 1, 0),
    (18, 0, 1, 0),
    (19, 0, 1, 0),
    (20, 0, 1, 0),
    (101, 1, 1, 0),
    (102, 1, 1, 0),
    (103, 0, 1, 0),
    (104, 0, 1, 0),
    (105, 1, 1, 0),
    (106, 1, 1, 0),
    (107, 1, 1, 0),
    (108, 1, 1, 0),
    (109, 1, 1, 0),
    (110, 1, 1, 0),
    (111, 1, 1, 0),
    (112, 1, 1, 0),
    (113, 1, 1, 0),
    (114, 1, 1, 0),
    (115, 1, 1, 0),
    (116, 1, 1, 0),
    (117, 1, 1, 0),
    (118, 1, 1, 0),
    (119, 1, 1, 0),
    (120, 1, 1, 0),
    (151, 1, 5, 0),
    (152, 1, 3, 0),
    (153, 0, 2, 0),
    (154, 1, 4, 0),
    (155, 0, 3, 0),
    (156, 1, 1, 0),
    (157, 1, 1, 0),
    (158, 1, 1, 0),
    (159, 1, 1, 0),
    (160, 1, 1, 0),
    (161, 1, 1, 0),
    (162, 1, 1, 0),
    (163, 1, 1, 0),
    (164, 1, 1, 0),
    (165, 1, 1, 0),
    (166, 1, 1, 0),
    (167, 1, 1, 0),
    (168, 1, 1, 0),
    (169, 1, 1, 0),
    (170, 1, 1, 0);
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
    ),
    (
        17,
        'Frieda McFadden',
        1,
        4.2,
        'Thriller',
        '172-8296218',
        'The Teacher',
        2024
    ),
    (
        18,
        'Stephen King',
        1,
        4.2,
        'Horror',
        '978-3453504080',
        'IT',
        1986
    ),
    (
        19,
        'Colleen Hoover',
        1,
        3.0,
        'Thriller',
        '978-1791392796',
        'Verity',
        2018
    ),
    (
        20,
        'Jacqueline Winspear',
        1,
        4.0,
        'Mystery',
        '978-1444855722',
        'The Comfort of Ghosts',
        2024
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
    ),
    (
        106,
        'Andy Weir',
        1,
        'Science Fiction',
        '978-0593356139',
        'Project Hail Mary',
        2023
    ),
    (
        107,
        'Rebecca Yarros',
        1,
        'Romance',
        '978-1649374176',
        'Iron Flame',
        2023
    ),
    (
        108,
        'James Clear',
        1,
        'Self-Help',
        '978-0735211308',
        'Atomic Habits',
        2024
    ),
    (
        109,
        'Emily Henry',
        1,
        'Romance',
        '978-0593440883',
        'Happy Place',
        2023
    ),
    (
        110,
        'Bonnie Garmus',
        1,
        'Fiction',
        '978-0385547376',
        'Lessons in Chemistry',
        2023
    ),
    (
        111,
        'Prince Harry',
        1,
        'Biography',
        '978-1797155096',
        'Spare (Audiobook)',
        2023
    ),
    (
        112,
        'Britney Spears',
        1,
        'Biography',
        '978-1797165194',
        'The Woman in Me',
        2023
    ),
    (
        113,
        'Michelle Obama',
        1,
        'Biography',
        '978-0593864230',
        'The Light We Carry',
        2023
    ),
    (
        114,
        'Jennette McCurdy',
        1,
        'Biography',
        '978-1797136225',
        'I''m Glad My Mom Died',
        2023
    ),
    (
        115,
        'Colleen Hoover',
        1,
        'Fiction',
        '978-1668617339',
        'It Starts with Us',
        2023
    ),
    (
        116,
        'Patrick Radden Keefe',
        1,
        'True Crime',
        '978-0385549080',
        'The Snakehead',
        2023
    ),
    (
        117,
        'David Grann',
        1,
        'Nonfiction',
        '978-0385549455',
        'The Wager (Audiobook)',
        2023
    ),
    (
        118,
        'Freida McFadden',
        1,
        'Thriller',
        '978-1728296211',
        'The Housemaid (eBook)',
        2023
    ),
    (
        119,
        'Matthew Perry',
        1,
        'Biography',
        '978-1797166061',
        'Friends, Lovers, and the Big Thing',
        2023
    ),
    (
        120,
        'Tana French',
        1,
        'Mystery',
        '978-0735284265',
        'The Hunter (eBook)',
        2024
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
        '0040-7817',
        195,
        'Time',
        '2025-02-15'
    ),
    (
        153,
        'People',
        1,
        'News',
        '0093-7673',
        9015,
        'March 10, 2025 Issue',
        '2025-03-10'
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
    ),
    (
        156,
        'The Economist Group',
        1,
        'News',
        '0013-0613',
        9523,
        'The Economist',
        '2024-04-20'
    ),
    (
        157,
        'Time USA',
        1,
        'News',
        '0040-781X',
        203,
        'Time',
        '2024-04-15'
    ),
    (
        158,
        'The New Yorker',
        1,
        'News',
        '0028-792X',
        77,
        'The New Yorker',
        '2024-04-10'
    ),
    (
        159,
        'Scientific American',
        1,
        'Science',
        '0036-8733',
        330,
        'Scientific American',
        '2024-04-01'
    ),
    (
        160,
        'Wired Magazine',
        1,
        'Technology',
        '1059-1028',
        80,
        'Wired',
        '2024-04-05'
    ),
    (
        161,
        'MIT Technology Review',
        1,
        'Technology',
        '1099-274X',
        90,
        'MIT Technology Review',
        '2024-03-15'
    ),
    (
        162,
        'Conde Nast',
        1,
        'Fashion',
        '0032-8062',
        830,
        'Vogue',
        '2024-04-15'
    ),
    (
        163,
        'Hearst Communications',
        1,
        'Lifestyle',
        '0017-209X',
        105,
        'Esquire',
        '2024-04-01'
    ),
    (
        164,
        'National Geographic Society',
        1,
        'Travel',
        '0027-9359',
        247,
        'National Geographic',
        '2024-04-01'
    ),
    (
        165,
        'Bloomberg L.P.',
        1,
        'Business',
        '0007-7135',
        456,
        'Bloomberg Businessweek',
        '2024-04-08'
    ),
    (
        166,
        'Forbes Media',
        1,
        'Business',
        '0015-6914',
        32,
        'Forbes',
        '2024-04-15'
    ),
    (
        167,
        'Harvard Business Review',
        1,
        'Business',
        '0017-8012',
        34,
        'Harvard Business Review',
        '2024-04-10'
    ),
    (
        168,
        'Marvel Entertainment',
        1,
        'Comics',
        '1543-7797',
        15,
        'Marvel Comics',
        '2024-04-25'
    ),
    (
        169,
        'Bonnier Group',
        1,
        'Outdoors',
        '0276-3586',
        85,
        'Popular Science',
        '2024-04-15'
    ),
    (
        170,
        'Rodale Inc.',
        1,
        'Health',
        '0894-1939',
        45,
        'Men''s Health',
        '2024-04-01'
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
VALUES (13, 35, 0.40, '2025-04-05'),
    (14, 34, 1.20, '2024-04-02'),
    (15, 3, 0.90, '2025-03-17'),
    (16, 11, 0.60, '2025-03-18'),
    (17, 31, 0.90, '2025-03-19'),
    (18, 21, 0.45, '2025-03-20');
-- Incur -------------------------------------------------------------------
INSERT INTO Incur (transaction_id, fine_id)
VALUES (2, 1),
    (3, 2),
    (7, 3),
    (8, 4),
    (11, 5),
    (12, 6),
    (13, 7),
    (14, 8),
    (15, 9),
    (16, 10),
    (17, 11),
    (18, 12),
    (30, 13),
    (29, 14),
    (32, 15),
    (33, 16),
    (34, 17),
    (35, 18);
-- (19, 1),
-- (20, 2),
-- (21, 3),
-- (13, 7),
-- (14, 8)
-- (2);
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
    (301, 30),
    (13, 31),
    (8, 32),
    (405, 33),
    (406, 34),
    (304, 35),
    (8, 36),
    (9, 37),
    (10, 38),
    (11, 39);
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
    (30, 35),
    (31, 32),
    (32, 3),
    (33, 11),
    (34, 31),
    (35, 21),
    (36, 1),
    (37, 1),
    (38, 1),
    (39, 1);
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
    (13, 10),
    (14, 4),
    (15, 5),
    (16, 6),
    (17, 7),
    (18, 8),
    (19, 9),
    (20, 11),
    (21, 12),
    (22, 13),
    (23, 14),
    (24, 15),
    (25, 16),
    (26, 17),
    (27, 18),
    (28, 19),
    (29, 20),
    -- Digital media copies
    (301, 101),
    (302, 102),
    (303, 103),
    (304, 104),
    (305, 105),
    (306, 106),
    (307, 107),
    (308, 108),
    (309, 109),
    (310, 110),
    (311, 111),
    (312, 112),
    (313, 113),
    (314, 114),
    (315, 115),
    (316, 116),
    (317, 117),
    (318, 118),
    (319, 119),
    (320, 120),
    -- Magazine copies
    (401, 151),
    (402, 151),
    (403, 151),
    (404, 151),
    (405, 151),
    (406, 152),
    (407, 153),
    (408, 154),
    (409, 155),
    (410, 156),
    (411, 157),
    (412, 158),
    (413, 159),
    (414, 160),
    (415, 161),
    (416, 162),
    (417, 163),
    (418, 164),
    (419, 165),
    (420, 166),
    (421, 167),
    (422, 168),
    (423, 169),
    (424, 170);
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
VALUES (1, 1),
    -- Harry Potter - J.K. Rowling
    (2, 2),
    -- The Shining - Stephen King
    (3, 3),
    -- Game of Thrones - George R.R. Martin
    (4, 4),
    -- Murder on the Orient Express - Agatha Christie
    (5, 5),
    -- Lord of the Rings - J.R.R. Tolkien
    (6, 6),
    -- To Kill a Mockingbird - Harper Lee
    (7, 7),
    -- Da Vinci Code - Dan Brown
    (8, 8),
    -- Handmaid's Tale - Margaret Atwood
    (9, 9),
    -- American Gods - Neil Gaiman
    (10, 10),
    -- Old Man and the Sea - Hemingway
    (11, 1),
    -- Harry Potter 4 - J.K. Rowling
    (12, 1),
    -- Harry Potter 2 - J.K. Rowling
    (13, 1),
    -- Harry Potter 3 - J.K. Rowling
    (14, 1),
    -- Harry Potter 5 - J.K. Rowling
    (15, 1),
    -- Harry Potter 6 - J.K. Rowling
    (16, 1);
-- Men's Health
-- Categorize --------------------------------------------------------------
INSERT INTO Categorize (item_id, genre_id)
VALUES -- Books
    (1, 1),
    -- Harry Potter - Fantasy
    (2, 2),
    -- The Shining - Horror
    (3, 1),
    -- Game of Thrones - Fantasy
    (4, 3),
    -- Murder on Orient Express - Mystery
    (5, 1),
    -- LOTR - Fantasy
    (6, 10),
    -- To Kill a Mockingbird - Classic
    (7, 6),
    -- Da Vinci Code - Thriller
    (8, 4),
    -- Handmaid's Tale - Sci-Fi
    (9, 1),
    -- American Gods - Fantasy
    (10, 10),
    -- Old Man and the Sea - Classic
    (11, 1),
    -- Harry Potter 4 - Fantasy
    (12, 1),
    -- Harry Potter 2 - Fantasy
    (13, 1),
    -- Harry Potter 3 - Fantasy
    (14, 1),
    -- Harry Potter 5 - Fantasy
    (15, 1),
    -- Harry Potter 6 - Fantasy
    (16, 1),
    -- Harry Potter 7 - Fantasy
    -- Original Digital Media
    (101, 12),
    -- Outliers - Nonfiction
    (102, 13),
    -- Atomic Habits - Self-Help
    (103, 13),
    -- Daring Greatly - Self-Help
    (104, 8),
    -- Becoming - Biography
    (105, 12),
    -- Homo Deus - Nonfiction
    -- Original Magazines
    (151, 16),
    -- National Geographic - Science
    (152, 18),
    -- Time - News
    (153, 22),
    -- The Economist - Business
    (154, 19),
    -- Vogue - Fashion
    (155, 25),
    -- Good Housekeeping - Health
    -- New Digital Media
    (106, 4),
    -- Project Hail Mary - Sci-Fi
    (107, 5),
    -- Iron Flame - Romance
    (108, 13),
    -- Atomic Habits Updated - Self-Help
    (109, 5),
    -- Happy Place - Romance
    (110, 11),
    -- Lessons in Chemistry - Lit Fiction
    (111, 8),
    -- Spare - Biography
    (112, 8),
    -- Woman in Me - Biography
    (113, 8),
    -- Light We Carry - Biography
    (114, 8),
    -- I'm Glad My Mom Died - Biography
    (115, 11),
    -- It Starts With Us - Lit Fiction
    (116, 14),
    -- The Snakehead - True Crime
    (117, 12),
    -- The Wager - Nonfiction
    (118, 6),
    -- The Housemaid - Thriller
    (119, 8),
    -- Friends, Lovers... - Biography
    (120, 3),
    -- The Hunter - Mystery
    -- New Magazines
    (156, 18),
    -- The Economist - News
    (157, 18),
    -- Time - News
    (158, 18),
    -- New Yorker - News
    (159, 16),
    -- Scientific American - Science
    (160, 17),
    -- Wired - Technology
    (161, 17),
    -- MIT Tech Review - Technology
    (162, 19),
    -- Vogue - Fashion
    (163, 20),
    -- Esquire - Lifestyle
    (164, 21),
    -- National Geographic - Travel
    (165, 22),
    -- Bloomberg - Business
    (166, 22),
    -- Forbes - Business
    (167, 22),
    -- Harvard Business Review - Business
    (168, 23),
    -- Marvel Comics - Comics
    (169, 16),
    -- Popular Science - Science
    (170, 25);
-- Men's Health - Health
-- Give --------------------------------------------------------------------
INSERT INTO Give (recommendation_id, member_id)
VALUES (1, 1),
    (2, 11),
    (3, 21);
-- Update Fines Daily --------------------------------------------------------------------------------------
UPDATE Fine f
    JOIN Incur i ON f.fine_id = i.fine_id
    JOIN Library_Transaction lt ON i.transaction_id = lt.transaction_id
    JOIN Make m ON lt.transaction_id = m.transaction_id
    JOIN Library_Member lm ON m.member_id = lm.member_id
SET f.fine_amount = DATEDIFF(CURRENT_DATE, lt.due_date) * lm.fee_type
WHERE f.fine_status = 'unpaid'
    AND lt.return_date IS NULL
    AND CURRENT_DATE > lt.due_date;