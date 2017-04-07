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
                templateUrl: "/templates/welcome.html"
            })
            .state('rides', {
                url: '/rides',
                controller: 'RideIndexCtrl as ride',
                templateUrl: '/templates/rides.html'
            })
            .state('new_ride', {
                url: '/rides/new',
                controller: 'RideCreateCtrl as ride',
                templateUrl: '/templates/editride.html'
            })
            .state('show_ride', {
                url: '/rides/:id',
                controller: 'RideShowCtrl as ride',
                templateUrl: '/templates/showride.html'
            })
            .state('edit_ride', {
                url: '/rides/:id/edit',
                controller: 'RideEditCtrl as ride',
                templateUrl: '/templates/editride.html'
            })
            .state('book_ride', {
                url: '/carpools/new',
                controller: 'CarpoolCreateCtrl as carpool',
                templateUrl: '/templates/bookride.html'
            })
            .state('show_carpool', {
                url: '/carpools/:id',
                controller: 'CarpoolShowCtrl as carpool',
                templateUrl: '/templates/showcarpool.html'
            })
            .state('messages', {
                url: '/messages',
                controller: 'MessageCtrl as message',
                templateUrl: '/templates/message.html'
            });
        
        //= Do I need different states if all my messages are on a single page?
        //= Do I need states for user sign in/log in views from Devise?
        
        $httpProvider
            .defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
            
    }   
    
    angular
        .module('hitch', ['ui.router', 'templates', 'ngResource'])
        .config(config);
})();

