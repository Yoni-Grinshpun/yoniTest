public class DynamicViewlightning {
@AuraEnabled
    public static Contact getContacts() {
        List<Contact> contacts = 
                [SELECT Id ,Name, Account.Name, Owner.Name, Owner.Email  FROM Contact limit 3];

        //Add isAccessible() check
        return contacts[0];
    }
}