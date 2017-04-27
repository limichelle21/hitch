(function() {
    function RideIndexCtrl(Ride) {
        this.rides = Ride.index();
        console.log("success!")
    };
    
    angular
        .module('hitch')
        .controller('RideIndexCtrl', ['Ride', RideIndexCtrl]);
})();

    
(function() {
    function RideShowCtrl($stateParams, Ride) {
        this.ride = Ride.show({ id: $stateParams.id });
    };
        
    angular
        .module('hitch')
        .controller('RideShowCtrl', ['$stateParams', 'Ride', RideShowCtrl]);
})();

    
(function() {
    function RideCreateCtrl($stateParams, $state, Ride) {    
        this.ride = new Ride();
        this.newRide = function() {
            this.ride.create(function() {
              $state.go('show ride')  
            })
        };
    };

    angular
        .module('hitch')
        .controller('RideCreateCtrl', ['$stateParams', '$state', 'Ride', RideCreateCtrl]);
})();
    
    
(function() {
    function RideEditCtrl($stateParams, $state, Ride) {     
// Function: GET request to get a ride to update        
        this.findRide = function() {
            this.ride = Ride.show({ id: $stateParams.id });
        }; 
// Call function to load a ride to be edited in the views        
        this.findRide(); 
        
// Update the edited ride, on success go back to display updated ride        
        this.updateRide = function() {
            this.ride.update(function() {
              $state.go('show ride')  
            })
        }; 
    };
    
    angular
        .module('hitch')
        .controller('RideEditCtrl', ['$stateParams', '$state', 'Ride', RideEditCtrl]);
})();
