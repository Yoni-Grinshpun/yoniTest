@isTest
public class TestMasterClass {
    
    static testMethod void method1(){
        Integer checkMethode = TestHighlightForAutomation_1.getContacts(50);
        System.assertEquals(50,checkMethode);
    }
    static testMethod void myTest2() {
        String checkMethode = TestHighlightForAutomation_1.getBug('');
        System.assertEquals('',checkMethode);
	}
    static testMethod void myTest3() {
        TestHighlightForAutomation_2 highlight = new TestHighlightForAutomation_2();
        Boolean checkMethode = highlight.itemInFor();
        System.assert(checkMethode, 'the value not true');
	}
    static testMethod void myTest4() {
        TestHighlightForAutomation_2 highlight = new TestHighlightForAutomation_2();
        Integer checkMethode = highlight.staticrelation(20);
        System.assertEquals(20, checkMethode, 'check the return number');
	}

    static testMethod void myTest6() { 
        Integer checkMethode = TestHighlightForAutomation_3.HighlightingBackend_2(30);
       System.assertEquals(30, checkMethode);
	}
    static testMethod void myTest7() { 
        Integer checkMethode = TestHighlightForAutomation_3.firstfunc();
       	System.assertEquals(checkMethode, 5);
	}

    static testMethod void myTest9() { 

//---------------------------------------------------------------------------------
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
	}
    static testMethod void myTest10() { 
        TestHighlightForAutomation_4 recordtypeClass = new TestHighlightForAutomation_4();
        Integer checkMethode = recordtypeClass.recordtypeClass(30);
       	System.assertEquals(30, checkMethode);
	}
    static testMethod void myTest11() { 
        TestHighlightForAutomation_4 getShipSizeM = new TestHighlightForAutomation_4();
        Integer checkMethode = getShipSizeM.getShipSizeM(30);
       	System.assertEquals(30, checkMethode);
	}
    static testMethod void myTest12() { 
        cmtClass cmt = new cmtClass();
        Integer checkMethode = cmt.cmtMathode(12);
       	System.assertEquals(12, checkMethode);
	}
    static testMethod void myTest13() { 
       cmtRecordClass rec = new cmtRecordClass();
        Integer a = rec.fanc();
        System.assertEquals(2, a);
	}

    
    
}