public class ApexToFlowsByConstructor {
     public void start() {
      Map<String, Object> myMap = new Map<String, Object>(); 
      myMap.put('SObj_Account', 'data');
      Flow.Interview.BugAutomation myFlow =new Flow.Interview.BugAutomation(myMap);
      myFlow.start();
      
   }

}