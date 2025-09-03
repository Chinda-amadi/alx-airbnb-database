## After reviewing my schema, I identified few potential redundancies and exceptions that could be adjusted or improved on.

### They are written as below:
-------------------------------------------------------------------------------------------------

**Property-Entity:**

**Current Attribute:**

**location: stored as a single VARCHAR.**

**Issue: If multiple properties share the same location (e.g., "Lagos, Nigeria"), this leads to redundancy and makes location-based queries less efficient.**

**Adjustment: I normalized "location attribute' into a separate table.**

### Updated Schema -

#### Location
    - location_id UUID PRIMARY KEY
    - city VARCHAR NOT NULL
    - state VARCHAR NOT NULL
    - country VARCHAR NOT NULL
    
#### Property
    - property_id UUID PRIMARY KEY
    - host_id UUID FOREIGN KEY REFERENCES User(user_id)
    - location_id UUID FOREIGN KEY REFERENCES Location(location_id)
    - name VARCHAR NOT NULL
    - description TEXT NOT NULL
    - pricepernight DECIMAL NOT NULL
    - created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    - updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP

## In summary, I adjusted the Property-Entity by moving the location attribute to its own table.
## Thereby avoiding redundancy, and improving queries at the same time.