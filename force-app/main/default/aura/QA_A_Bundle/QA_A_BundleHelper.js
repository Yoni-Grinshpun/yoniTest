({
	onClickCheckBoxhelper : function(cmp) {
        
        
        var checkBoxValue = cmp.find("checkBox").get("v.checked");
        cmp.set("v.CheckBoxValue",checkBoxValue);
        cmp.set("v.QA_A_Form.Status_API__c",checkBoxValue);
        var res = cmp.get("c.SetData");
        
		
	}
})