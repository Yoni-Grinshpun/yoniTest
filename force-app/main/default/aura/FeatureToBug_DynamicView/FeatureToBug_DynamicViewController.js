({
	loadbug : function(component, event, helper) {
        var action = component.get("c.getbug");
        action.setCallback(this, function(response) {
            var state = response.getState();
           // if (state === "SUCCESS") {
           //     component.set("v.Feature", response.getReturnValue());
          //  }
        });
         $A.enqueueAction(action);
    }
})