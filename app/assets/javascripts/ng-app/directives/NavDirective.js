(function() {
    function navBar() {
        return {
            templateUrl: 'nav.html',
            controller: 'AuthCtrl as auth'
        }
    }

    angular
        .module('hitch')
        .directive('navBar', [navBar])
})();
