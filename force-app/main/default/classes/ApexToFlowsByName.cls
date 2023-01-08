public with sharing class ApexToFlowsByName extends extendBug {
    public void start() {
      Map<String, Object> myMap = new Map<String, Object>();
      String flowName='BugAutomation';
      myMap.put('SObj_Account', 'data');
      Flow.Interview myFlow = Flow.Interview.createInterview(flowName, myMap);
      myFlow.start();
      
   }

}