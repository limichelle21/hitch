(function() {
    function RideIndexCtrl($routeParams, Ride) {
        
        this.rides = Ride.index();
    
    angular
        .module('hitch')
        .controller('RideIndexCtrl', ['$routeParams', 'Ride', RideIndexCtrl]);
})();

    
(function() {
    function RideShowCtrl($routeParams, Ride) {
         
        this.ride = Ride.show({ id: $routeParams.id });
      
    angular
        .module('hitch')
        .controller('RideShowCtrl', ['$routeParams', 'Ride', RideShowCtrl]);
})();

    
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
    
    
(function() {
    function RideEditCtrl($routeParams, $state, Ride) {     
// Function: GET request to get a ride to update        
        this.findRide = function() {
            this.ride = Ride.show({ id: $routeParams.id });
        } 
        
// Call function to load a ride to be edited in the views        
        this.findRide(); 
        
        
// Update the edited ride, on success go back to display updated ride        
        this.updateRide = function() {
            this.ride.update(function() {
              $state.go('show ride')  
            })
        } 
        
        
    angular
        .module('hitch')
        .controller('RideEditCtrl', ['$routeParams', '$state', 'Ride', RideEditCtrl]);
})();
