
Blocmetrics is a web analytics tracking service.

This website offers some key features:
1. A client-side JavaScript snippet that allows a user to track events on their website.
2. A server-side API that captures and saves those events to a database.
3. A Rails application that displays the captured event data for a user.

In order to track you app, please add the following code to your application.js file:

```js
var blocmetrics = {};

blocmetrics.report = function(eventName) {
  var event = { event: { name: eventName, url:"http://localhost:4000/users/1" } };
  var request = new XMLHttpRequest();

  request.open("POST", "http://localhost:3000/api/events", true);

  request.setRequestHeader('Content-Type', 'application/json');

  request.send(JSON.stringify(event));
};
```
