public class QA_A_TriggerHelper 
{
	public static void createQA_B_record (List<QA_A_API__c> QA_A_List,Map<id,QA_A_API__c> oldMapQA_A)
    {
        List<QA_B_API__c> QA_B_List = new List<QA_B_API__c>();
            for(QA_A_API__c ObjQA_A: QA_A_List)
            {
                if(ObjQA_A.Status_API__c =='Active_API' && oldMapQA_A.get(ObjQA_A.id).Status_API__c =='Inactive_API')
                {
                    QA_B_API__c ObjQA_B = new QA_B_API__c();
                    ObjQA_B.Description_API__c = 'from QA_A_TriggerHelper Class';
                    ObjQA_B.QA_A_Lookup_API__c = ObjQA_A.id;
                    QA_B_List.add(ObjQA_B);
                }
            }
            insert QA_B_List;
    }
    public static void fanc (){
        QA_A_API__c qa = new QA_A_API__c();
        if (qa.Dollar_API__c =='esela'){
            
        }
    }
}