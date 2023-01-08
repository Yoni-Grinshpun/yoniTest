@isTest 
private class Bug_Label_To_Trigger_testClass { 
    private static testMethod void Test_CustomBugTrigger () { 
        List<Bug__c> bug = new List<Bug__c>{
            new Bug__c(Name='bugtest',Bug_priority_Name__c='Minor',Bug_email_Name__c='test@panaya.com')
        };         
        insert bug; 

    } 
}