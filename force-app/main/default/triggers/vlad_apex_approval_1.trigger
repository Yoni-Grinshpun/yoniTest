trigger vlad_apex_approval_1 on Account (after insert) {
     
     if (BooleanStatic.run){
              submitForApproval2(Trigger.New[0]);

     }
     
     public  static void submitForApproval2(Account acc){
        // Create an approval request for the Account
        Approval.ProcessSubmitRequest req1 = new Approval.ProcessSubmitRequest();
        req1.setComments('Submitting request for approval.'); 
        req1.setObjectId(acc.Id);
       req1.setNextApproverIds(new Id[] {UserInfo.getUserId()});

        
       // Approval.ProcessResult result = Approval.process(req1);
    }

}