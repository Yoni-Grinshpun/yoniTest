public class TestHighlightForAutomation_2 {
    public Boolean itemInFor(){
        Boolean a = true;
        List<QA_B_API__c> QA_B_List = new List<QA_B_API__c>();
         for(QA_B_API__c item : QA_B_List)
            {
                if(item.Dollar_API__c == 'esela'){
                   Integer i=100;
                   a = false; 
                }            
            }
        return a;
        } 
    
    public Integer staticrelation(Integer a){
        Integer res = a;
        QA_A_TriggerHelper.fanc();
        return res;
    }
    


}