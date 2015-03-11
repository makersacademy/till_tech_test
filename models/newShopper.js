
var newShopper = {
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
