hiptillio.factory('GetShopDetails', ['$http', function($http) {
  var file = "../data/shopdetails.json"
  return $http.get(file);
}])