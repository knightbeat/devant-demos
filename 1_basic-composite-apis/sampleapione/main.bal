import ballerina/http;

listener http:Listener httpDefaultListener = http:getDefaultListener();

service /myorg on httpDefaultListener {
    resource function get customers() returns error|json|http:InternalServerError {
        do {
            json response = check exteralServicehttpClient->post("/c69fe862-99ba-4fe7-a273-ec1be6a71fe6", {"message": "Hi"});

            return response;
        } on fail error err {
            // handle error
            return error("unhandled error", err);
        }
    }

    resource function post customers(http:Request req) returns error|json {
        do {
            json var1 = check exteralServicehttpClient->post("/c69fe862-99ba-4fe7-a273-ec1be6a71fe6", req);
            return var1;
        } on fail error err {
            // handle error
            return error("unhandled error", err);
        }
    }
}
