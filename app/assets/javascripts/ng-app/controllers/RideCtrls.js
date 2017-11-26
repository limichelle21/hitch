(function() {
    function RideIndexCtrl(Ride, $state) {

// to receive params from $state -- $state.params.obj
        var ride = this;
        ride.loading = true;
        Ride.search({date: $state.params.date, departure: $state.params.departure, arrival: $state.params.arrival},
            function(response) {
              console.log(this);
              ride.rides = response;
              ride.loading = false;
              console.log("rides response!");
            })
    // function for ng-click to book carpool state
        ride.newCarpool = function(ride) {
            console.log("ride to be passed", ride)
            $state.go('book_ride', {ride: ride})
        }
        return ride;
      };

    angular
        .module('hitch')
        .controller('RideIndexCtrl', ['Ride', '$state', RideIndexCtrl]);
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
            Ride.create(function() {
              $state.go('show_ride')
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
