(function() {
    function AuthCtrl($state) {

        // What are the config options and why are they required?
        // Per docs: var config = { headers: { 'X-HTTP-Method-Override': 'POST' }};

            this.login_user = {email: null, password: null};
            this.register_user = {email: null, password: null, password_confirmation: null};

            this.login = function() {
               Auth.login(this.login_user).then(function(user){
                   console.log(user);
                   $state.go('welcome');
               });
            };

            this.register = function() {
               Auth.register(this.register_user).then(function(user){
                   console.log(user);
                   $state.go('welcome');
               });
            };

            this.logout = function() {
                Auth.logout.then(function(oldUser){
                    alert(oldUser.name + " you're signed out now");
                    $state.go('welcome');
                });
            };
        };

    angular
        .module('hitch')
        .controller('AuthCtrl', ['$state', AuthCtrl]);
})();
