(function() {
    function RideIndexCtrl($routeParams, Ride) {
        
        this.rides = Ride.index();
    
    angular
        .module('hitch')
        .controller('RideIndexCtrl', ['$routeParams', 'Ride', RideIndexCtrl]);
})();
