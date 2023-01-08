public with sharing class cmtClass {
    public Integer cmtMathode(Integer q) {
        Integer a;
        List<Cmetadata_API__mdt> cmt = [select Val1_API__c from Cmetadata_API__mdt 
                                        ORDER BY DeveloperName DESC LIMIT 1];
        List<with_lookup__mdt> cmtLookup = [SELECT Id, MasterLabel, DeveloperName, Language, NamespacePrefix, Label, 
                                            QualifiedApiName, relation_to_object__c 
                                            FROM with_lookup__mdt where MasterLabel = 'lookup relation'];
        /*
        List<Cmetadata_API__mdt> cmt = [select Val2_API__c from Cmetadata_API__mdt 
                                        ORDER BY DeveloperName DESC LIMIT 1];
        */   
         List<dlrs__LookupRollupSummary2__mdt> manage = [select dlrs__ChildObject__c from dlrs__LookupRollupSummary2__mdt 
                                        ORDER BY DeveloperName DESC LIMIT 1];
        a=q;
        return a;
    }
}