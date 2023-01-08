public class PicklistSourceView {
	Bug__c pickGlobal;
    Bug__c pickLocal;
    Public void sqlq1(){
        pickGlobal = [select Bug_priority_Name__c From Bug__c 
           where Bug_priority_Name__c ='High'];
    }Public void sqlq2(){
        pickLocal = [select Bug_Status_Pick__c From Bug__c 
           where Bug_Status_Pick__c ='open'];
    }
}