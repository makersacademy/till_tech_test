var path = require('path');

function routes(app, db, io) {
  app.get('/', function(req, res) {
    res.sendFile(path.join(__dirname, '../views', '/index.html'));
  });
}

module.exports = routes;