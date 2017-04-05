(function() {
    function MessageCtrl($location, $routeParams, Message, Carpool) {

        
        this.message.content = "";
        
        this.messages = Message.index();
        
        this.message = Message.show({ id: $routeParams.id });
        
        // review what this function does
        this.newMessage = function() {
            $location.path("/messages/new");
        };
        
        
// this.carpool - where to set this? 
        
        this.saveMessage = function() {
            if (this.message.content) {
                Message.create(this.messsage.content, this.carpool.$id)
            }
            this.message.content = "";
        }
    
    angular
        .module('hitch')
        .controller('MessageCtrl', ['$location', '$routeParams', 'Message', 'Carpool', MessageCtrl]);
})();
