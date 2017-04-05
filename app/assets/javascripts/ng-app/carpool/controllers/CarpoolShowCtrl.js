(function() {
    function CarpoolShowCtrl($routeParams, Carpool) {

        this.carpool = Carpool.show({ id: $routeParams.id });
        
        
    angular
        .module('hitch')
        .controller('CarpoolShowCtrl', ['$routeParams', 'Carpool', CarpoolShowCtrl]);
})();
