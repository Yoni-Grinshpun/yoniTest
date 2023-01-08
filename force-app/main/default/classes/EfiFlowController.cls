public class EfiFlowController {

    public void start() {
      Map<String, Object> myMap = new Map<String, Object>();
     
      myMap.put('SObj_Account', 'kaki');
      Flow.Interview.Sync_a_Quote_to_his_Opportunity myFlow =new Flow.Interview.Sync_a_Quote_to_his_Opportunity(myMap);
      myFlow.start();
     
   }
}