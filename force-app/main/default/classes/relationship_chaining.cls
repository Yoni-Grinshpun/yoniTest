public with sharing class relationship_chaining extends extendBug {
@AuraEnabled
    public static Contact getContacts() {
        List<Contact> contacts = 
                [SELECT Account.Owner.LastName FROM Contact limit 1];

        //Add isAccessible() check
        return contacts[0];
    }
    @AuraEnabled
    public static Bug__c getBug() {
        List<Bug__c> Bugs = 
                [SELECT Bug__c.Bug_TestedBy_Name__c FROM Bug__c limit 1];

        //Add isAccessible() check
        return Bugs[0];
    }
    
    extdClass e = extdClass.Open; 
    extdClass e2 = extdClass.Reopen; 
}