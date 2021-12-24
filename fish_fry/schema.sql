DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS event;
DROP TABLE IF EXISTS fish;
DROP TABLE IF EXISTS side;
DROP TABLE IF EXISTS meal;
DROP TABLE IF EXISTS meal_sides;
DROP TABLE IF EXISTS meal_fish;
DROP TABLE IF EXISTS orders_meal;

DROP TABLE IF EXISTS event_orders;

CREATE TABLE orders (
	id INTEGER PRIMARY KEY AUTOINCREMENT
);

CREATE TABLE user (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	username TEXT UNIQUE NOT NULL,
	password TEXT NOT NULL
);

CREATE TABLE event (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT UNIQUE NOT NULL
);

CREATE TABLE event_orders (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	event_id INTEGER NOT NULL,
	order_id INTEGER NOT NULL,
	FOREIGN KEY (event_id) REFERENCES event (id),
	FOREIGN KEY (order_id) REFERENCES orders (id)
);

CREATE TABLE fish (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT UNIQUE NOT NULL
);

CREATE TABLE extra (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT UNIQUE NOT NULL
);

CREATE TABLE side (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT UNIQUE NOT NULL
);

CREATE TABLE meal (
	id INTEGER PRIMARY KEY AUTOINCREMENT
);

CREATE TABLE meal_sides (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	side_id INTEGER NOT NULL,
	FOREIGN KEY (side_id) REFERENCES side (id)
);

CREATE TABLE meal_fish (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	fish_id INTEGER NOT NULL,
	FOREIGN KEY (fish_id) REFERENCES fish (id)
);

CREATE TABLE orders_meal (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	order_id INTEGER NOT NULL,
	meal_id INTEGER NOT NULL,
	FOREIGN KEY (order_id) REFERENCES orders (id),
	FOREIGN KEY (meal_id) REFERENCES meal (id)
);

INSERT INTO fish (name) VALUES ("Cod");
INSERT INTO fish (name) VALUES ("Jack Salmon");
INSERT INTO fish (name) VALUES ("Catfish");
INSERT INTO fish (name) VALUES ("Shrimp");

INSERT INTO side (name) VALUES ("Hush Puppies");
INSERT INTO side (name) VALUES ("Coleslaw");
INSERT INTO side (name) VALUES ("Green Beans");
INSERT INTO side (name) VALUES ("Spaghetti");
INSERT INTO side (name) VALUES ("MacCheese");

INSERT INTO extra (name) VALUES ("Tartar Sauce");
INSERT INTO extra (name) VALUES ("Red Sauce");
INSERT INTO extra (name) VALUES ("Bread");