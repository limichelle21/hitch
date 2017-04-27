(function() {
    function WelcomeCtrl() {
        console.log("success!");
        this.ride_date = "";
        this.departure = "";
        this.arrival = "";
        
    };
    
    angular
        .module('hitch')
        .controller('WelcomeCtrl', [WelcomeCtrl]);
})();
