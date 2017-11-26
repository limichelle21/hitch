(function() {
    function CarpoolShowCtrl($stateParams, Carpool) {
        this.carpool = Carpool.show({ id: $stateParams.id });
    };
    angular
        .module('hitch')
        .controller('CarpoolShowCtrl', ['$stateParams', 'Carpool', CarpoolShowCtrl]);
})();


(function() {
    function CarpoolCreateCtrl($state, Carpool) {
        this.ride = $state.params.ride;
        console.log("ride received", $state.params.ride)
        this.carpool = new Carpool();

        this.newCarpool = function() {
            Carpool.create(function() {
              $state.go('show_carpool')
            })
        }

    };

    angular
        .module('hitch')
        .controller('CarpoolCreateCtrl', ['$state', 'Carpool', CarpoolCreateCtrl]);
})();
