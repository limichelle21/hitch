(function() {
    function RideCreateCtrl($routeParams, $state, Ride) {    
        
        this.ride = new Ride();
        
        this.newRide = function() {
            this.ride.create(function() {
              $state.go('show ride')  
            })
        }

    angular
        .module('hitch')
        .controller('RideCreateCtrl', ['$routeParams', '$state', 'Ride', RideCreateCtrl]);
})();
