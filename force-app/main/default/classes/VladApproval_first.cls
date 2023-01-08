public class VladApproval_first {
    public  static void submitForApproval(Account acc)

    {
        // Create an approval request for the Account
        Approval.ProcessSubmitRequest req1 = new Approval.ProcessSubmitRequest();
        req1.setComments('Submitting request for approval.'); 
        req1.setObjectId(acc.Id);
       req1.setNextApproverIds(new Id[] {UserInfo.getUserId()});

        
        Approval.ProcessResult result = Approval.process(req1);
    }
}