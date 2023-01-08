@isTest 
public class UpdateFeature_Test {
	private static testMethod void Test_UpdateFeature() { 
        List<Feature_Name__c> feature = new List<Feature_Name__c>{
            new Feature_Name__c(Name='testFeature',Project_Name__c='Manager')
        };         
        insert feature; 

    } 
}