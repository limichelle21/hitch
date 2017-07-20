(function () {
    function config($stateProvider, $locationProvider, $httpProvider, $authProvider) {
        $authProvider
            .configure({
              apiUrl: '/api/v1'
            });

        $locationProvider
            .html5Mode({
                enabled: true,
                requireBase: false
            });

        $stateProvider
            .state('welcome', {
                url: '/',
                controller: 'WelcomeCtrl as welcome',
                templateUrl: "welcome.html"
            })
            .state('login', {
                url: '/login',
                controller: 'AuthCtrl as auth',
                templateUrl: "login.html"
            })
            .state('rides', {
                url: '/rides',
                controller: 'RideIndexCtrl as ride',
                templateUrl: 'rides.html',
                params: {date: null, departure: null, arrival: null}
            })
            .state('new_ride', {
                url: '/rides/new',
                controller: 'RideCreateCtrl as ride',
                templateUrl: 'new_ride.html'
            })
            .state('edit_ride', {
                url: '/rides/:id/edit',
                controller: 'RideEditCtrl as ride',
                templateUrl: 'edit_ride.html'
            })
            .state('book_ride', {
                url: '/carpools/new',
                controller: 'CarpoolCreateCtrl as carpool',
                templateUrl: 'book_carpool.html',
                params: {ride: null}
            })
            .state('show_carpool', {
                url: '/carpools/:id',
                controller: 'CarpoolShowCtrl as carpool',
                templateUrl: 'show_carpool.html',
                params: {carpool: null}
            })
            .state('messages', {
                url: '/messages',
                controller: 'MessageCtrl as message',
                templateUrl: 'messages.html'
            });


        $httpProvider
            .defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');

    }

    angular
        .module('hitch', ['ui.router', 'templates', 'ngResource', 'ng-token-auth', 'ipCookie', 'ui.bootstrap'])
        .config(config);
})();
