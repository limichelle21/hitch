(function() {
    function RideShowCtrl($routeParams, Ride) {
         
        this.ride = Ride.show({ id: $routeParams.id });
      
    angular
        .module('hitch')
        .controller('RideShowCtrl', ['$routeParams', 'Ride', RideShowCtrl]);
})();
