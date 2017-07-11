(function() {
    function WelcomeCtrl(Ride, $state) {
        this.date = "";
        this.departure = "";
        this.arrival = "";

        this.submit = function() {
          $state.go("rides", {
            date: this.date,
            departure: this.departure,
            arrival: this.arrival
          })
            console.log("rides searching")
        }
      }
        // function to take search params, GET request to Ride#index, end up on search results page (rides.html)
        // with searched params and search results

        // Function to change the state, pass params

    angular
        .module('hitch')
        .controller('WelcomeCtrl', ['Ride', '$state', WelcomeCtrl]);
})();
