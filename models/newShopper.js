
var newShopper = {
  addName: function(name){
    this.name.push(name);
    return name
  },
  name: function(){
    return this.name
  }
}

module.exports = {
  create: function() {
    return Object.create(newShopper,{
      'name': {
        value: [],
        writable: false,
        enumeable: true
      }
    });
  }
};
