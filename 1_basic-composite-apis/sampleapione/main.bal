import ballerina/http;

listener http:Listener httpDefaultListener = http:getDefaultListener();

service /myorg on httpDefaultListener {
    resource function get customers() returns error|json|http:InternalServerError {
        do {
            json response = check exteralServicehttpClient->get("/customers");

            return response;
        } on fail error err {
            // handle error
            return error("unhandled error", err);
        }
    }

    resource function get customers/[string id]() returns error|json|http:InternalServerError {
        do {
            string resourcePath = "/customers/" + id;
            json response = check exteralServicehttpClient->get(resourcePath);

            return response;
        } on fail error err {
            // handle error
            return error("unhandled error", err);
        }
    }

    resource function post customers(@http:Payload Customer customerPayload) returns error|json {
        do {
            json response = check exteralServicehttpClient->post("/customers", customerPayload);
            return response;
        } on fail error err {
            // handle error
            return error("unhandled error", err);
        }
    }
}