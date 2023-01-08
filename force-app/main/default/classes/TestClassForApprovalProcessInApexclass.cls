@Istest
public class TestClassForApprovalProcessInApexclass{

    
     public  static testMethod void TESTsubmitForApproval()

    {
        	Account acc = new Account(Name = 'Name');
        Insert Acc;
        // Create an approval request for the Account
       VladApproval_first.submitForApproval(acc);
    }
   
    
}