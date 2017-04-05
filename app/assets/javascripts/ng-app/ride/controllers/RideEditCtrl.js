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
