(function() {
    function CarpoolShowCtrl($stateParams, Carpool) {

        this.carpool = Carpool.show({ id: $stateParams.id });
        
    };
        
    angular
        .module('hitch')
        .controller('CarpoolShowCtrl', ['$stateParams', 'Carpool', CarpoolShowCtrl]);
})();


(function() {
    function CarpoolCreateCtrl($stateParams, $state, Carpool) {
       
        this.ride = $stateParams.ride;
    
        this.carpool = new Carpool();

        
        this.newCarpool = function() {
            this.carpool.create(function() {
              $state.go('show_carpool')  
            })
        }
        
    };
        
    angular
        .module('hitch')
        .controller('CarpoolCreateCtrl', ['$stateParams', '$state', 'Carpool', CarpoolCreateCtrl]);
})();
