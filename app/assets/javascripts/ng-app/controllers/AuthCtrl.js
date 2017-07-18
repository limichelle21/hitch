(function() {
    function AuthCtrl($state, $scope, $auth, $location) {

        var auth = this;
        // What are the config options and why are they required?
        // Per docs: var config = { headers: { 'X-HTTP-Method-Override': 'POST' }};
        $scope.$on('auth:login-error', function(ev, reason) {
          $scope.error1 = reason.errors[0];
          alert('Login error because ' + reason.errors[0]);
          });

        $scope.$on('auth:registration-email-error', function(ev, reason) {
          $scope.error2 = reason.errors[0];
          alert('Registration error because ' + reason.errors[0]);
        });

        $scope.$on('auth:logout-error', function(ev, reason) {
          $scope.error = reason.errors[0];
          alert('Logout failed because ' + reason.errors[0]);
        })

        auth.submitLogin = function() {
          $auth.submitLogin(auth.loginForm)
            .then(function() {
              $state.go('welcome')
            });
        }

        auth.handleRegBtnClick = function() {
          $auth.submitRegistration(auth.registrationForm)
            .then(function() {
            $scope.error = 'Thanks for registering. Please check your email to confirm your email address';
            });
          };

        auth.handleSignOutBtnClick = function() {
          $auth.signOut()
            .then(function(resp) {
              $state.go('welcome')
            })
        };

      };

    angular
        .module('hitch')
        .controller('AuthCtrl', ['$state', '$scope', '$auth', '$location', AuthCtrl]);
})();
