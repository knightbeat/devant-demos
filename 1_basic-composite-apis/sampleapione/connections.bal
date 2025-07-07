import ballerina/http;

final http:Client exteralServicehttpClient = check new (customersAPIEndpoint);
