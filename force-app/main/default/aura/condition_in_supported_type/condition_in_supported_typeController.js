/**
 * Created by idan on 17/01/2018.
 */
({
     loadContacts : function(component, event, helper) {
            var bug = component.get("v.Bug");
            component.set("v.name", bug.Bug_TestedBy_Name__c);
            // Load all contact data
            var action = component.get("c.getContacts");
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (state === "SUCCESS") {
                    component.set("v.contact", response.getReturnValue());
                }
            });
             $A.enqueueAction(action);
        }
})