(function() {
    function NavCtrl(Auth) {
        
        this.signedIn = Auth.isAuthenticated;
        this.logout = Auth.logout;
        
        Auth.currentUser().then(function(user) {
            this.user = user;
        });
        
        
        this.$on('devise:new-registration', function (e, user){
            this.user = user;
        });
        
        this.$on('devise:login', function (e, user){
            this.user = user;
        })
        
        this.$on('devise:logout', function (e, user){
            this.user = "";
        });
        
    };
    
    angular
        .module('hitch')
        .controller('NavCtrl', ['Auth', NavCtrl]);
})();
