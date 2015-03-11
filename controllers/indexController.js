exports.index = function(req, res){
  var order = req.params.shopOrder;
  res.render('index');
};
