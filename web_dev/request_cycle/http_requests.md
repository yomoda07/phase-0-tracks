#HTTP Requests

## What are some common HTTP status codes?
- 200 OK
- 404: Not Found
  this code means the requested resource is not found.
- 403: Forbidden
  this means you're not authorized to access the resource.
- 500: Internal Server Error
  this is server-side error
- 503 Service Unavailable
  this code is displayed when server crashed, server is under maintenance, server overloaded, and so on.

## What is the difference between a GET request and a POST request? When might each be used?
- GET request passes the data using query parameter in the URL, so the data can be stored in browser and cached. GET request should never be used to deal with sensitive data such as personal information or confidential information.
- POST request passes the data in the HTTP message body. it's not gonna be saved in browser history and cached, so it's more safer than GET request.

## Optional bonus question: What is a cookie (the technical kind, not the delicious kind)? How does it relate to HTTP requests?
- Cookie is small file stored in a user's computer. Cookie is used as a means to identify the user or track user activity. Cookie is sent with HTTP response.
