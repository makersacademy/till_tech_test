var HipsterList = require(process.cwd() + '/models/hipsterList');

var newShopper = {
  addName: function(name){
    this.name.push(name);
    return name
  },
  name: function(){
    return this.name
  },
  addList: function(){
    newList = HipsterList.create();
  },
  showList: function(){
    return newList.list;
  }
}

module.exports = {
  create: function() {
    return Object.create(newShopper,{
      'name': {
        value: [],
        writable: false,
        enumeable: true
      },
    });
  }
};
