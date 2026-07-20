-- Database creation
CREATE DATABASE IF NOT EXISTS blood_donation_db;
USE blood_donation_db;

-- Initial data for blood groups
INSERT INTO blood_groups (group_name) VALUES 
('A+'), ('A-'), ('B+'), ('B-'), ('AB+'), ('AB-'), ('O+'), ('O-');

-- Insert a default admin (Password is 'admin123' encrypted with BCrypt)
INSERT INTO users (email, password, role, is_active, created_at) VALUES
('admin@blooddrop.com', '$2a$10$1P983rYh50TqHqYd.3h.R.a9pQ6Fv9980XG3Y9hT7uF8gM7G53f/G', 'ROLE_ADMIN', 1, NOW());
