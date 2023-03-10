({

    loadContacts : function(component, event, helper) {
        // Load all contact data
        var action = component.get("c.getContacts");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.contacts", response.getReturnValue());
            }
        });
         $A.enqueueAction(action);
    }
})