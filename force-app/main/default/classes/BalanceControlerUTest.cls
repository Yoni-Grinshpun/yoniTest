@isTest
public class BalanceControlerUTest {
    static testmethod void balanceUtest(){
        e_Balance_API__c balance = new e_Balance_API__c();
        balance.Digital_API__c = 1;
        insert balance;
        test.startTest();
        balance.Digital_API__c++;
        update balance;
        test.stopTest();
    }
}