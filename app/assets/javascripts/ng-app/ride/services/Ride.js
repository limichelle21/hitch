(function() {
    function Ride($resource) {
      return $resource("/api/rides/:id", { id: "@id" },
        {
          'new':     { method: 'GET' },
          'create':  { method: 'POST' },
          'index':   { method: 'GET', isArray: true },
          'show':    { method: 'GET', isArray: false },
          'edit':    { method: 'GET'},
          'update':  { method: 'PATCH' }
        }
      );     
    }
    
    angular
        .module('hitch')
        .factory('Ride', ['$resource'])
})();
