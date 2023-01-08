global  class BalanceController{

  @InvocableMethod(label='controll the balance' description='run from Process Builder')
  public static void AddCount()
    {
       	e_Balance_API__c balance =[SELECT Digital_API__c FROM e_Balance_API__c];
 		balance.Digital_API__c++;
        update balance;
    }
    
   
}