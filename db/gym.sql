DROP TABLE IF EXISTS bookings CASCADE;
DROP TABLE IF EXISTS session_dates_times CASCADE;
DROP TABLE IF EXISTS sessions CASCADE;
DROP TABLE IF EXISTS member_details CASCADE;
DROP TABLE IF EXISTS members CASCADE;
DROP TABLE IF EXISTS equipment CASCADE;
DROP TABLE IF EXISTS rooms CASCADE;
DROP TABLE IF EXISTS instructors CASCADE;


CREATE TABLE members (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  date_of_birth DATE,
  active BOOLEAN
);

CREATE TABLE instructors (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  profile TEXT,
  email_address VARCHAR(255)
);

CREATE TABLE member_details (
  id SERIAL PRIMARY KEY,
  address TEXT,
  post_code VARCHAR(255),
  telephone_number INT,
  email_address VARCHAR(255),
  member_id INT REFERENCES members(id) ON DELETE CASCADE
);

CREATE TABLE rooms (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE equipment (
  id SERIAL PRIMARY KEY,
  type VARCHAR(255),
  quantity INT,
  room_id INT REFERENCES rooms(id) ON DELETE CASCADE
);

CREATE TABLE sessions (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  description TEXT,
  instructor_id INT REFERENCES instructors(id) ON DELETE CASCADE,
  room_id INT REFERENCES rooms(id) ON DELETE CASCADE,
  active BOOLEAN,
  max_capacity INT
);

CREATE TABLE session_dates_times (
  id2 SERIAL PRIMARY KEY,
  start_time TIME(0),
  end_time TIME(0),
  session_date DATE,
  session_id INT REFERENCES sessions(id) ON DELETE CASCADE
);

CREATE TABLE bookings (
  id SERIAL PRIMARY KEY,
  member_id INT REFERENCES members(id) ON DELETE CASCADE,
  session_id INT REFERENCES sessions(id) ON DELETE CASCADE
);
