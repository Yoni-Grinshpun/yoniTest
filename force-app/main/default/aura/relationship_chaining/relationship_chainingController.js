({
   
    loadContacts : function(component, event, helper) {
        // Load all contact data
        var action = component.get("c.getContacts");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.contact", response.getReturnValue());
            }
        });
         $A.enqueueAction(action);
   },
     loadBugObj : function(component, event, helper) {
        var action = component.get("c.getBug");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.bugObj", response.getReturnValue());
            }
        });
         $A.enqueueAction(action);
    }
    
    
    
})