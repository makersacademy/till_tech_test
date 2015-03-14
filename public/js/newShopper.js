//create a new shopper
function NewShopper(cBack){
  this.name = []

   var cBack = (cBack || function() {})();

  };

//functions for shopper
  NewShopper.prototype.addName = function(name){
    this.name.push(name);
    return name
  };

  NewShopper.prototype.name = function(){
    return this.name
  };

  // NewShopper.prototype.addList = function(){
  //   newList = new HipsterList();
  // };

  // NewShopper.prototype.showList = function(){
  //   return newList.list;
  // };

module.exports = NewShopper;