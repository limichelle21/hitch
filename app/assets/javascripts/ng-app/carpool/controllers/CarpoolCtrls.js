(function() {
    function CarpoolShowCtrl($routeParams, Carpool) {

        this.carpool = Carpool.show({ id: $routeParams.id });
        
        
    angular
        .module('hitch')
        .controller('CarpoolShowCtrl', ['$routeParams', 'Carpool', CarpoolShowCtrl]);
})();


(function() {
    function CarpoolCreateCtrl($routeParams, $state,  Carpool) {
        
        this.carpool = new Carpool();

        
        this.newCarpool = function() {
            this.carpool.create(function() {
              $state.go('show carpool')  
            })
        }
        
        
    angular
        .module('hitch')
        .controller('CarpoolCreateCtrl', ['$routeParams', '$state', 'Carpool', CarpoolCreateCtrl]);
})();
