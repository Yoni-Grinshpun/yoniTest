public class ApprovalProcesses {
	   public Integer submitForApproval(Bug__c bug)
    {
        Integer a = 1;
        Approval.ProcessSubmitRequest bug1 = new Approval.ProcessSubmitRequest();
        bug1.setComments('Submitting request for approval.'); 
        bug1.setObjectId(bug.Bug_email_Name__c);
        Approval.ProcessResult result = Approval.process(bug1);
        return a;
    }
}