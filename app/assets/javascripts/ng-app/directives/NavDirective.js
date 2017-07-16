(function() {
    function navBar() {
        return {
            templateUrl: 'nav.html',
            controller: 'AuthCtrl'
        }
    }

    angular
        .module('hitch')
        .directive('navBar', [navBar])
})();
