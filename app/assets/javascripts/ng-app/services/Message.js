(function() {
    function Message($resource) {
      return $resource("/api/messages/:id", { id: "@id" },
        {
          'create':  { method: 'POST' },
          'index':   { method: 'GET', isArray: true },
          'show':    { method: 'GET', isArray: false }
        }
      );     
    }
    
    angular
        .module('hitch')
        .factory('Message', ['$resource', Message])
})();