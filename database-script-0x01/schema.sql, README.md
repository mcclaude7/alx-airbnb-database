1. Create User table - stores information about users

CREATE TABLE User (
    user_id INT AUTO_INCREMENT PRIMARY KEY, 
    first_name VARCHAR(50) NOT NULL,         
    last_name VARCHAR(50) NOT NULL,          
    email VARCHAR(100) NOT NULL UNIQUE,      
    password VARCHAR(255) NOT NULL,          
    phone_number VARCHAR(20),               
    role VARCHAR(20) NOT NULL DEFAULT 'guest',
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);

2. Create Property table - stores information about rental properties

CREATE TABLE Property (
    property_id INT AUTO_INCREMENT PRIMARY KEY, 
    host_id INT NOT NULL,                     
    name VARCHAR(100) NOT NULL,               
    description TEXT,                         
    location VARCHAR(255) NOT NULL,           
    pricepernight DECIMAL(10, 2) NOT NULL,    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    
    -- Link to the User table (the host)
    FOREIGN KEY (host_id) REFERENCES User(user_id)
);

3. Create Booking table - stores information about reservations

CREATE TABLE Booking (
    booking_id INT AUTO_INCREMENT PRIMARY KEY, 
    property_id INT NOT NULL,                 
    user_id INT NOT NULL,                     
    start_date DATE NOT NULL,                 
    end_date DATE NOT NULL,                   
    total_price DECIMAL(10, 2) NOT NULL,      
    status VARCHAR(20) NOT NULL DEFAULT 'pending', 
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, d
    
    -- Links to other tables
    FOREIGN KEY (property_id) REFERENCES Property(property_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

4. Create Payment table - stores payment information

CREATE TABLE Payment (
    payment_id INT AUTO_INCREMENT PRIMARY KEY, 
    booking_id INT NOT NULL,                  
    amount DECIMAL(10, 2) NOT NULL,           
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    payment_method VARCHAR(20) NOT NULL,      
    
    -- Link to the Booking table
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)
);

5. Create Review table - stores property reviews
CREATE TABLE Review (
    review_id INT AUTO_INCREMENT PRIMARY KEY, 
    property_id INT NOT NULL,                
    user_id INT NOT NULL,                    
    rating INT NOT NULL,                     
    comment TEXT,                            
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- When the review was created
    
    -- Links to other tables
    FOREIGN KEY (property_id) REFERENCES Property(property_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

6. Create Message table - stores messages between users

CREATE TABLE Message (
    message_id INT AUTO_INCREMENT PRIMARY KEY, 
    sender_id INT NOT NULL,                   
    recipient_id INT NOT NULL,                
    message_body TEXT NOT NULL,               
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    
    -- Links to the User table
    FOREIGN KEY (sender_id) REFERENCES User(user_id),
    FOREIGN KEY (recipient_id) REFERENCES User(user_id)
);

-- Add a simple index for frequently searched columns
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_booking_dates ON Booking(start_date, end_date);