trigger Bug_Label_To_Trigger on Bug__c (before insert) {
    List<Bug__c> bug=[select Bug__c.Bug_TestedBy_Name__c from Bug__c];
    updateFeature myNewClass = new updateFeature();
}