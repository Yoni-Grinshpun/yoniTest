public class updateFeature {
    List<Feature_Name__c> Feature=[select id,Name,Project_Name__c from Feature_Name__c];
    List<Feature_Name__c> updateFeature=new List<Feature_Name__c>();
        
    public void doupdate(){
        for(Feature_Name__c obj:Feature)
    	{
            if(obj.Project_Name__c=='Manager')
            {
                obj.Project_Name__c='Description'; 
                updateFeature.add(obj);
            }
        }
    update updateFeature;
    }   
}