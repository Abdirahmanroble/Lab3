CREATE TABLE classroom (
 room_id BIGSERIAL NOT NULL PRIMARY KEY,
 street_name VARCHAR(100),
 zip_code VARCHAR(100),
 city_name VARCHAR(100)
);


CREATE TABLE instrument (
 instrument_id BIGSERIAL NOT NULL PRIMARY KEY,
 instrument_type VARCHAR(100) NOT NULL,
 is_available VARCHAR(100) NOT NULL
);


CREATE TABLE person (
 id BIGSERIAL NOT NULL PRIMARY KEY,
 person_number VARCHAR(12) NOT NULL,
 first_name VARCHAR(100) NOT NULL,
 last_name VARCHAR(100) NOT NULL,
 email VARCHAR(100),
 street_name VARCHAR(100) NOT NULL,
 zip_code VARCHAR(100) NOT NULL,
 city_name VARCHAR(100) NOT NULL,
 sex VARCHAR(100) NOT NULL,
 UNIQUE(person_number)
);

CREATE TABLE phone (
 phone_no VARCHAR(100) NOT NULL,
 person_id BIGINT NOT NULL REFERENCES person(id) ON DELETE CASCADE,
 PRIMARY KEY (phone_no, person_id)
);

CREATE TABLE price_category (
 id BIGSERIAL NOT NULL PRIMARY KEY,
 lesson_price BIGINT NOT NULL,
 discount BIGINT,
 instructors_salary BIGINT NOT NULL
);


CREATE TABLE contact_person (
 person_id BIGINT REFERENCES person(id) ON DELETE CASCADE,
 student_person_id BIGINT REFERENCES student(person_id) ON DELETE CASCADE,
 PRIMARY KEY(person_id)
);

CREATE TABLE instructor (
 employment_id BIGSERIAL NOT NULL,
 person_id BIGINT REFERENCES person (id),
 is_available VARCHAR(100) NOT NULL,
 PRIMARY KEY(person_id)
);



CREATE TABLE student ( 
 student_id BIGSERIAL NOT NULL,
 person_id BIGINT NOT NULL REFERENCES person (id),
 PRIMARY KEY(person_id)
);



CREATE TABLE type_of_instruments (
 type VARCHAR(100) NOT NULL,
 person_id BIGINT REFERENCES instructor(person_id) ON DELETE CASCADE,
 PRIMARY KEY (type, person_id)
);

CREATE TABLE lesson (
 id BIGSERIAL NOT NULL PRIMARY KEY,
 start_time TIMESTAMP(6),
 price_category_id BIGINT NOT NULL REFERENCES price_category(id) ,
 instructor_person_id BIGINT NOT NULL REFERENCES instructor (person_id),
 room_id BIGINT NOT NULL REFERENCES classroom(room_id),
 skill_level VARCHAR(100)
);

CREATE TABLE private_lesson (
 lesson_id BIGINT REFERENCES lesson(id) ON DELETE CASCADE,
 instrument_type VARCHAR(100) NOT NULL
);


CREATE TABLE group_lesson (
 lesson_id BIGINT REFERENCES lesson(id) ON DELETE CASCADE,
 instrument_type VARCHAR(100) NOT NULL,
 min_of_students VARCHAR(100) NOT NULL
);

CREATE TABLE ensembles (
 lesson_id BIGINT REFERENCES lesson(id) ON DELETE CASCADE,
 genre VARCHAR(100) NOT NULL,
 min_of_students VARCHAR(100) NOT NULL,
 max_of_students VARCHAR(100) NOT NULL
);


CREATE TABLE rent_instrument (
 rent_id BIGSERIAL NOT NULL PRIMARY KEY,
 price BIGINT NOT NULL,
 student_id BIGINT NOT NULL REFERENCES student(person_id),
 instrument_id INT NOT NULL REFERENCES instrument(instrument_id),
 start_time TIMESTAMP(6),
 end_time TIMESTAMP(6)
);

CREATE TABLE sibling (
 person_id BIGINT NOT NULL REFERENCES person(id),
 student_id BIGINT NOT NULL REFERENCES student(person_id),
 PRIMARY KEY (person_id, student_id)
);

CREATE TABLE student_ge_lesson(
 lesson_id BIGINT NOT NULL references lesson(id),
 student_id BIGINT NOT NULL references student(person_id),
 PRIMARY KEY(lesson_id, student_id)
);
