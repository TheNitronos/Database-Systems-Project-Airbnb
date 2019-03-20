
----------------Entities-------------------

CREATE TABLE Listing (

  ---------attributes---------
  listing_id          INT,
  listing_url         VARCHAR(50),
  listing_name        VARCHAR(50),
  listing_summary     TINYTEXT,
  listing_space       TINYTEXT,
  listing_description TEXT,
  listing_notes       TEXT,
  listing_transit     TEXT,
  listing_access      TEXT,
  listing_interaction TEXT,
  listing_picture_url VARCHAR(50),
  neighbourhood_overview TEXT,

  -----relation attributes----
  --a listing is owned by a host--
  host_id INT NOT NULL,
  --a listing is in a country--
  city_name VARCHAR(50) NOT NULL,
  --a listing is in a neighbourhood--
  neighbourhood_id INT NOT NULL,

  ------------keys------------
  PRIMARY KEY(id),
  FOREIGN KEY(host_id) REFERENCES Host(host_id),
  FOREIGN KEY(city) REFERENCES City(city_name),
  FOREIGN KEY(neighbourhood_id) REFERENCES Neighbourhood(neighbourhood_id)
);

CREATE TABLE Host (

  ---------attributes---------
  host_id    INT,
  host_url   VARCHAR(50),
  host_name  VARCHAR(50),
  host_since DATE,
  host_about TINYTEXT,
  host_response_time TIME,
  host_response_rate FLOAT,
  host_thumbnail_url VARCHAR(50),
  host_picture_url   VARCHAR(50),
  host_verifications TEXT,

  -----relation attributes----
  host_neighbourhood_id INT NOT NULL,

  ------------keys------------
  PRIMARY KEY(host_id),
  FOREIGN KEY(host_neighbourhood_id) REFERENCES Neighbourhood(neighbourhood_id)
);

CREATE TABLE Neighbourhood (

  ---------attributes---------
  neighbourhood_id INT AUTO_INCREMENT,
  neighbourhood_name VARCHAR(50),
  -----relation attributes----

  ------------keys------------
  PRIMARY KEY(id)
);

CREATE TABLE City (

  ---------attributes---------
  city_name    VARCHAR(50),
  country_code INT,
  country      VARCHAR(50),

  -----relation attributes----

  ------------keys------------
  PRIMARY KEY(city_name, country_code)
);

CREATE TABLE House_properties (

  ---------attributes---------
  rules         TEXT,           -- I would put this  one in the Administrative_properties table
  property_type VARCHAR(50),
  room_type     VARCHAR(50),
  accomodates   TINYINT,
  bathrooms     TINYINT,
  bedrooms      TINYINT,
  beds          TINYINT,
  bed_type      VARCHAR(50),
  amenities     TEXT,
  square_feet   SMALLINT,

  -----relation attributes----
  listing_id INT,

  ------------keys------------
  PRIMARY KEY(listing_id),
  FOREIGN KEY(listing_id) REFERENCES Listing(listing_id)
);

CREATE TABLE Economic_properties (

  ---------attributes---------
  price            FLOAT,
  weekly_price     FLOAT,
  monthly_price    FLOAT,
  security_deposit FLOAT,
  cleaning_fee     FLOAT,
  guests_included  TINYINT,
  extra_people     FLOAT,

  -----relation attributes----
  listing_id INT,

  ------------keys------------
  PRIMARY KEY(listing_id),
  FOREIGN KEY(listing_id) REFERENCES Listing(listing_id)
);

CREATE TABLE Administrative_properties (

  ---------attributes---------
  minimum_nights INT,
  maximum_nights INT,
  is_business_travel_ready BIT,
  cancellation_policy      TEXT,
  require_guest_profile_picture    BIT,
  require_guest_phone_verification BIT,

  -----relation attributes----
  listing_id INT,

  ------------keys------------
  PRIMARY KEY(listing_id),
  FOREIGN KEY(listing_id) REFERENCES Listing(listing_id)
);

CREATE TABLE Review (

  ---------attributes---------
  review_id   INT,
  review_date DATE,
  review_comments TEXT,

  -----relation attributes----
  listing_id  INT NOT NULL,
  reviewer_id INT NOT NULL,

  ------------keys------------
  PRIMARY KEY(review_id),
  FOREIGN KEY(reviewer_id) REFERENCES Reviewer(reviewer_id),
  FOREIGN KEY(listing_id) REFERENCES Listing(listing_id)
);

CREATE TABLE Reviewer (

  ---------attributes---------
  reviewer_id INT,
  reviewer_name VARCHAR(50),
  -----relation attributes----

  ------------keys------------
  PRIMARY KEY(reviewer_id),
);

CREATE TABLE review_scores (

  ---------attributes---------
  review_scores_rating        FLOAT,
  review_scores_accuracy      FLOAT,
  review_scores_cleanliness   FLOAT,
  review_scores_checkin       FLOAT,
  review_scores_communication FLOAT,
  review_scores_location      FLOAT,
  review_scores_value         FLOAT,

  -----relation attributes----
  listing_id INT,

  ------------keys------------
  PRIMARY KEY(listing_id),
  FOREIGN KEY(listing_id) REFERENCES Listing(listing_id)
);

CREATE TABLE Calendar (

  ---------attributes---------
  calendar_date      DATE,
  calendar_available BIT,
  calendar_price     FLOAT,

  -----relation attributes----
  listing_id INT,

  ------------keys------------
  PRIMARY KEY(listing_id, date),
  FOREIGN KEY(listing_id) REFERENCES Listing(listing_id)
);

----------------Relations------------------

CREATE TABLE Location (

  ---------attributes---------
  latitude  FLOAT,
  longitude FLOAT,

  -----relation attributes----
  listing_id INT,

  ------------keys------------
  PRIMARY KEY(listing_id),
  FOREIGN KEY(listing_id) REFERENCES Listing(listing_id)
);
