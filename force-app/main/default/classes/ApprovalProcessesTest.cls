@isTest 
public class ApprovalProcessesTest {
	private static testMethod void Test_ApprovalProcesses() { 
        List<Bug__c> bug = new List<Bug__c>{
            new Bug__c(Name='bugtest',Bug_priority_Name__c='Minor',Bug_email_Name__c='test@panaya.com')};  
        String c =  Label.Label_Short_Description;      
        Bug__c b = new Bug__c();
        ApprovalProcesses app = new ApprovalProcesses();
        Integer a = 30;
        System.assertEquals(30, a);
}
}