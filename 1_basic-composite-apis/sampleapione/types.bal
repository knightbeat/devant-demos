public type Address record {
    string street;
    string city;
    string postcode;
    string country;
};

public type Customer record {
    string id;
    string first_name;
    string last_name;
    string email;
    string phone;
    Address address;
    string created_at;
    decimal last_order_value;
};