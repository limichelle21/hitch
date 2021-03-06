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
        this.carpool = new Carpool();

        this.newCarpool = function() {
            this.carpool.create(function() {
              $state.go('show_carpool')
            })
        }

    };

    angular
        .module('hitch')
        .controller('CarpoolCreateCtrl', ['$state', 'Carpool', CarpoolCreateCtrl]);
})();
