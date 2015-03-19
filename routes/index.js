

function routes(app, db) {
  app.get('/', function(req, res) {
    res.sendFile('path'.join(__dirname, '../views', '/index.html'));
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
  
  app.post('/pay', function(req, res){
    var money = db.getMoney(req.body.money);
    res.status(200).send({money: money});
  });

  app.get('/pay', function(req, res){
    res.send({money: db.getChange()});
  });

  app.get('/new', function(req, res) {
    res.send({total: db.clearDB()});
  });
}

module.exports = routes;