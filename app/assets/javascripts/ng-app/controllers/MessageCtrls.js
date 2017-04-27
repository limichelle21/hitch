(function() {
    function MessageCtrl($location, $stateParams, Message, Carpool) {
        
        this.content = "";
        
        this.messages = Message.index();
        
        this.message = Message.show({ id: $stateParams.id });
        
// this.carpool - where to set this? 
        
        this.saveMessage = function() {
            if (this.content) {
                Message.create(this.content, this.carpool.$id)
            }
            this.content = "";
        };
        
    };
    
    angular
        .module('hitch')
        .controller('MessageCtrl', ['$location', '$stateParams', 'Message', 'Carpool', MessageCtrl]);
})();
