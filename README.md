
Blocmetrics is a web analytics tracking service.

This website offers some key features:
1. A client-side JavaScript snippet that allows a user to track events on their website.
2. A server-side API that captures and saves those events to a database.
3. A Rails application that displays the captured event data for a user.


To Run Locally
---------------
1. Clone repository
2. Install [Postgres](http://postgresapp.com/)
3. Create DB and call it ```Blocmetrics_development```
4. Run ```bundle install```
5. Run ```rails s```
6. go to http://localhost:3000/




Tracking Apps
---------------
In order to track your app, please add the following code to your application.js file and implement ```blocmetrics("eventName");``` wherever you need to track:

```js
var blocmetrics = {};

blocmetrics.report = function(eventName) {
  var event = { event: { name: eventName, url:"url of site" } };
  var request = new XMLHttpRequest();

  request.open("POST", "https://blocmetrics-javi.herokuapp.com/api/events", true);

  request.setRequestHeader('Content-Type', 'application/json');

  request.send(JSON.stringify(event));
};
```
