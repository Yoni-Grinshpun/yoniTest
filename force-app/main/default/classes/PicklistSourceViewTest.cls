@isTest 
public class PicklistSourceViewTest {
	private static testMethod void Test_PicklistSourceView() { 
        List<Bug__c> bug = new List<Bug__c>{
            new Bug__c(Name='bugtest',Bug_priority_Name__c='High')
        };         
        insert bug; 

    } 
}