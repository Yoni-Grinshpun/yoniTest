public class EfiFlowControllerFlowByName {

    public void start() {
      Map<String, Object> myMap = new Map<String, Object>();
      String flowName='efiFlow';
      myMap.put('SObj_Account', 'kaki');
      Flow.Interview myFlow = Flow.Interview.createInterview(flowName, myMap);
      myFlow.start();
     
   }
}