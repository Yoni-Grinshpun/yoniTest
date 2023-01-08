/*
Test for the FieldSetUtils class
Base on a hard codded Feildset as follow:
	Object : 		Account
	Feildset name :	Account_test_field_set 
	contain :  		Account.name
*/
@isTest
private class FieldSetUtils_Test {

	@isTest static void test_generateQueryFromFieldSets() {
		
		FieldSetUtils util = new FieldSetUtils(); 
		 String str =  
                util.generateQueryFromFieldSets('Account',
                                                new Set<String>{'Account_test_field_set'},
                                                new Set<String>(),
                                                'Name != null '); 
                system.debug('[util.generateQueryFromFieldSets -->]'+ str) ; 
                system.assertEquals('SELECT Id,Name FROM Account WHERE Name != null ' , str);

	}

	@isTest static void test_generateQueryFromFieldSets_NoWhere() {
		
		FieldSetUtils util = new FieldSetUtils(); 
		 String str =  
                util.generateQueryFromFieldSets('Account',
                                                new Set<String>{'Account_test_field_set'},
                                                new Set<String>(),
                                                null ); 
                system.debug('[util.generateQueryFromFieldSets_NoWhere -->]'+ str) ; 
                system.assertEquals('SELECT Id,Name FROM Account' , str);

	}

	@isTest static void test_generateQueryFromFieldSets_additionalFields() {
		
		FieldSetUtils util = new FieldSetUtils(); 
		 String str =  
                util.generateQueryFromFieldSets('Account',
                                                new Set<String>{'Account_test_field_set'},
                                                new Set<String>{'additionalFields'},
                                                null ); 
                system.debug('[util.generateQueryFromFieldSets_NoWhere -->]'+ str) ; 
                system.assertEquals('SELECT Id,additionalFields,Name FROM Account' , str);

	}

	@isTest static void test_generateListStringFromFieldSets() {
		
		FieldSetUtils util = new FieldSetUtils(); 
		 List<String> strList =  
                util.generateListStringFromFieldSets('Account',
                                                new Set<String>{'Account_test_field_set'});
                system.debug('[util.generateListStringFromFieldSets -->]'+ strList) ; 
                system.assertEquals(1 , strList.size());
                system.assertEquals('Name' , strList[0]);
                

	}
}