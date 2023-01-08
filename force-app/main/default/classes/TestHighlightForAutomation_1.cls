public class TestHighlightForAutomation_1 extends extendBug {

	public static Integer getContacts(Integer num) {
        List<Contact> contacts = [SELECT Account.Owner.LastName FROM Contact limit 1];
        Integer ans = num;
        return ans;
    }   
    
    public static String getBug(String a) {
        List<Bug__c> Bugs = [select Bug_TestedBy_Name__c FROM Bug__c];
        String b = a;
        return b;
    }

}