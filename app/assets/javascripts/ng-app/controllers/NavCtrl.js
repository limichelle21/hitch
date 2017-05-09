(function() {
    function NavCtrl($scope, Auth, $rootScope) {
        
        this.signedIn = Auth.isAuthenticated;
        this.logout = Auth.logout;
        
        this.checkUser = function() {
            Auth.currentUser().then(function (user){
            $rootScope.user = user;
            console.log(user);
            })
        };
        
        this.newUser = function() {
            $scope.$on('devise:new-registration', function (e, user){
                $rootScope.user = user;
            });
        };
        
        
        this.newSession = function() {
            $scope.$on('devise:login', function (e, user){
                $rootScope.user = user;
            })
        };
        
        this.destroySession = function() {
            $scope.$on('devise:logout', function (e, user){
                $rootScope.user = undefined;
            });
        };
        
        
    };
    
    angular
        .module('hitch')
        .controller('NavCtrl', ['Auth', '$rootScope', '$scope', NavCtrl]);
})();


// need $scope for $on watcher method
