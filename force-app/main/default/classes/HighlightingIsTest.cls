@isTest
public class HighlightingIsTest {
    static testMethod void Utest()
    {
        HighlightingOfIndirect.fanc();
        QA_A_TriggerHelper.fanc();
        QA_A_API__c QAobj = new QA_A_API__c();
        QAobj.name = 'Unit test';
        if(QAobj.Dollar_API__c == 'esela')
        {
            QAobj.Global_Picklist_API__c = 'Critical';
        }
        insert QAobj;
        
        Test.startTest();
        QAobj.name = 'Unit test1';
        update QAobj;
        Test.stopTest();
        
        List<QA_A_API__c> QAaList = [select name from QA_A_API__c where name = 'Unit test1'];
        system.assertEquals(1,QAaList.size());
    }

}