public with sharing class GetData {
    @AuraEnabled
    public static void SetData(QA_B_API__c QABForm) {     
        try{
            if(QABForm.Active_API__c !=null){
                insert QABForm;
            }
        }catch(Exception ex){           
        }       
    }
}