(function() {
    function navBar() {
        return {
            templateUrl: 'nav.html',
            controller: 'NavCtrl'
        }
    }
    
    angular
        .module('hitch')
        .directive('navBar', [navBar])
})();