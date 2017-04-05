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
