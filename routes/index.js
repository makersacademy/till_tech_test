var path = require('path');

function routes(app, db) {
  app.get('/', function(req, res) {
    res.sendFile(path.join(__dirname, '../views', '/index.html'));
  });

  app.post('/', function(req, res) {
    var item = db.add(req.body.item, req.body.price);
    res.status(200).send({item: item});
  });

}

module.exports = routes;