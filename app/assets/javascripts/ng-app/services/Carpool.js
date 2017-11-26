(function() {
    function Carpool($resource) {
      return $resource("/api/v1/carpools/:id", { id: "@id" },
        {
          'create':  { method: 'POST', params:{ride_id: '@ride.id'}},
          'show':    { method: 'GET' }
        }
      );
    }

    angular
        .module('hitch')
        .factory('Carpool', ['$resource', Carpool])
})();
