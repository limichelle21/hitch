(function () {
    function config($stateProvider, $locationProvider, $httpProvider) {
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
            .state('rides', {
                url: '/rides',
                controller: 'RideIndexCtrl as ride',
                templateUrl: 'rides.html'
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
                templateUrl: 'book_ride.html'
            })
            .state('show_carpool', {
                url: '/carpools/:id',
                controller: 'CarpoolShowCtrl as carpool',
                templateUrl: 'show_carpool.html'
            })
            .state('messages', {
                url: '/messages',
                controller: 'MessageCtrl as message',
                templateUrl: 'message.html'
            });
        
    
        //= Do I need states for user sign in/log in views from Devise?
        
        $httpProvider
            .defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
            
    }   
    
    angular
        .module('hitch', ['ui.router', 'templates', 'ngResource'])
        .config(config);
})();



