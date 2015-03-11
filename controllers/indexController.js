var shopperName


exports.index = function(req, res){
  var shopperName = req.params.shopperName;
  res.render('index');
};
