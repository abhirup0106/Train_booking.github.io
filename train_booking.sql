-- Create the database
CREATE DATABASE train_booking;
USE train_booking;

-- Create the seats table
CREATE TABLE seats (
    seat_id INT PRIMARY KEY, r INT NOT NULL,
    status VARCHAR(10) DEFAULT 'available'
);

-- Populate the seats table
INSERT INTO seats (seat_id, r, status) VALUES
    (1, 1, 'available'), (2, 1, 'available'), (3, 1, 'available'), (4, 1, 'available'), (5, 1, 'available'), (6, 1, 'available'), (7, 1, 'available'),
    (8, 2, 'available'), (9, 2, 'available'), (10, 2, 'available'), (11, 2, 'available'), (12, 2, 'available'), (13, 2, 'available'), (14, 2, 'available'),
    (15, 3, 'available'), (16, 3, 'available'), (17, 3, 'available'), (18, 3, 'available'), (19, 3, 'available'), (20, 3, 'available'), (21, 3, 'available'),
    (22, 4, 'available'), (23, 4, 'available'), (24, 4, 'available'), (25, 4, 'available'), (26, 4, 'available'), (27, 4, 'available'), (28, 4, 'available'),
    (29, 5, 'available'), (30, 5, 'available'), (31, 5, 'available'), (32, 5, 'available'), (33, 5, 'available'), (34, 5, 'available'), (35, 5, 'available'),
    (36, 6, 'available'), (37, 6, 'available'), (38, 6, 'available'), (39, 6, 'available'), (40, 6, 'available'), (41, 6, 'available'), (42, 6, 'available'),
    (43, 7, 'available'), (44, 7, 'available'), (45, 7, 'available'), (46, 7, 'available'), (47, 7, 'available'), (48, 7, 'available'), (49, 7, 'available'),
    (50, 8, 'available'), (51, 8, 'available'), (52, 8, 'available'), (53, 8, 'available'), (54, 8, 'available'), (55, 8, 'available'), (56, 8, 'available'),
    (57, 9, 'available'), (58, 9, 'available'), (59, 9, 'available'), (60, 9, 'available'), (61, 9, 'available'), (62, 9, 'available'), (63, 9, 'available'),
    (64, 10, 'available'), (65, 10, 'available'), (66, 10, 'available'), (67, 10, 'available'), (68, 10, 'available'), (69, 10, 'available'), (70, 10, 'available'),
    (71, 11, 'available'), (72, 11, 'available'), (73, 11, 'available'), (74, 11, 'available'), (75, 11, 'available'), (76, 11, 'available'), (77, 11, 'available'),
    (78, 12, 'available'), (79, 12, 'available'), (80, 12, 'available');
    
    select * from seats;
