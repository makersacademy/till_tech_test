var path = require('path');

function routes(app, db) {
  app.get('/', function(req, res) {
    res.sendFile(path.join(__dirname, '../views', '/index.html'));
  });

  app.post('/items', function(req, res) {
    var item = db.add(req.body.item, req.body.quantity);
    res.status(200).send({item: item});
  });

  app.get('/items', function(req, res) {
     res.send({price: db.getAllPrice(), item: db.getAllItems(),
     quantity: db.getAllQuantity()});
  });

  app.delete('/items', function(req, res){
    db.deleteItem(req.body.item);
    res.sendStatus(200);
  });

   app.get('/total', function(req, res){
    res.send({total: db.getTotal(), tax: db.getTax(), after: db.afterTax()});
  });

}

module.exports = routes;