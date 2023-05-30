CREATE TABLE `role` (
  `id` int PRIMARY KEY,
  `role_name` varchar(255)
);

CREATE TABLE `actors` (
  `id` bigint unsigned PRIMARY KEY AUTO_INCREMENT,
  `username` varchar(255),
  `password` varchar(255),
  `role_id` int,
  `verified` enum('Yes','No'),
  `active` enum('Yes','No'),
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE INDEX `role` ON `actors` (role_id);

CREATE TABLE `customer` (
  `id` bigint unsigned PRIMARY KEY AUTO_INCREMENT,
  `firstname` varchar(255),
  `lastname` varchar(255),
  `email` varchar(255),
  `avatar` varchar(255),
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


CREATE TABLE `register` (
  `id` bigint unsigned PRIMARY KEY AUTO_INCREMENT,
  `admin_id` bigint unsigned,
  `super_admin_id` bigint unsigned,
  `status` varchar(255)
);

ALTER TABLE `role` ADD FOREIGN KEY (`id`) REFERENCES `actors` (`role_id`);


INSERT INTO actors (username, password, role_id, verified, active, created_at, updated_at)
VALUES 
('arga21', 'Sampurna123', 1, true, true, NOW(), NOW()),
('santi90', 'Belajar123', 2, true, true, NOW(), NOW());


INSERT INTO customer (firstname, lastname, email, avatar, created_at, updated_at)
VALUES ('arga','bimantara', 'argabimantara8@gmail.com', 'knight', NOW(), NOW());


INSERT INTO role (id, role_name)
VALUES 
('1', 'admin'),
('2', 'super-admin');


INSERT INTO register (admin_id, super_admin_id, status)
VALUES ('001', '002', 'aktif');