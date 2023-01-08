@isTest
private class SendEmailBatchable_Test{
    @isTest
    public static void SuccessEmailBatchableTestMethod(){
        Account account = new Account();
		account.Name = 'Test Account';
		insert account;
		
		Contact contact = new Contact();
		contact.LastName = 'Test contact';
		contact.email = 'abc@gmail.com';
		contact.AccountId = account.Id;
		insert contact;
		
		ContentVersion filedata = new ContentVersion();
		filedata.PathOnClient = 'Test';
		filedata.Origin = 'C'; // 'H' for Chatter File, 'C' for Content Document
		filedata.Title = 'Test';
		filedata.VersionData = Blob.valueOf('Test data of file.');
		insert filedata;
		
    	ContentVersion contentVersion_2 = [SELECT Id, Title, ContentDocumentId FROM ContentVersion WHERE Id = :filedata.Id LIMIT 1];
        List<ContentDocument> documents = [SELECT Id, Title, LatestPublishedVersionId FROM ContentDocument];
        
    	test.startTest();
        SendEmailInvocable.Request EmailInvocableObj = new SendEmailInvocable.Request();
        EmailInvocableObj.whatId = account.Id;
        EmailInvocableObj.whoId = contact.Id;
        EmailInvocableObj.toAddresses = 'abc@gmail.com';
        EmailInvocableObj.ccAddresses = 'abc@gmail.com';
        EmailInvocableObj.bccAddresses = 'abc@gmail.com';
        EmailInvocableObj.senderName = 'Organization Name';
        EmailInvocableObj.replyTo = 'xyz@gmail.com';
        EmailInvocableObj.subject = 'Testing Email';
        EmailInvocableObj.textBody = 'This email just for testing';
        EmailInvocableObj.htmlBody = '<p>This email just for testing</p>';
        EmailInvocableObj.fileIds = documents[0].Id;
        
        list<SendEmailInvocable.Request> requestList = new list<SendEmailInvocable.Request>();
        requestList.add(EmailInvocableObj);
        
        SendEmailBatchable obj = new SendEmailBatchable(requestList);
        Id jobId = Database.executeBatch(obj);
        AsyncApexJob ct = [SELECT Id,JobItemsProcessed,Status,NumberOfErrors FROM AsyncApexJob WHERE id = :jobId];
     		// Verify the job has run
			System.assertEquals('Queued', ct.Status);
        test.stopTest();
    }
    
    @isTest
    public static void FailedEmailTestMethod(){
        Account account = new Account();
		account.Name = 'Test Account';
		insert account;
		
		Contact contact = new Contact();
		contact.LastName = 'Test contact';
		contact.email = 'abc@gmail.com';
		contact.AccountId = account.Id;
		insert contact;
		
		ContentVersion filedata = new ContentVersion();
		filedata.PathOnClient = 'Test';
		filedata.Origin = 'C'; // 'H' for Chatter File, 'C' for Content Document
		filedata.Title = 'Test';
		filedata.VersionData = Blob.valueOf('Test data of file.');
		insert filedata;
		
    	ContentVersion contentVersion_2 = [SELECT Id, Title, ContentDocumentId FROM ContentVersion WHERE Id = :filedata.Id LIMIT 1];
        List<ContentDocument> documents = [SELECT Id, Title, LatestPublishedVersionId FROM ContentDocument];
        
    	test.startTest();
        SendEmailInvocable.Request EmailInvocableObj = new SendEmailInvocable.Request();
        EmailInvocableObj.whatId = account.Id;
        EmailInvocableObj.replyTo = 'xyz@gmail.com';
        EmailInvocableObj.textBody = 'This email just for testing';
        EmailInvocableObj.htmlBody = '<p>This email just for testing</p>';
        EmailInvocableObj.fileIds = contentVersion_2.Id;
        
        list<SendEmailInvocable.Request> requestList = new list<SendEmailInvocable.Request>();
        requestList.add(EmailInvocableObj);
        
        SendEmailBatchable obj = new SendEmailBatchable(requestList);
        Id jobId = Database.executeBatch(obj);
        AsyncApexJob ct = [SELECT Id,JobItemsProcessed,Status,NumberOfErrors FROM AsyncApexJob WHERE id = :jobId];
     		// Verify the job has run
			System.assertEquals('Queued', ct.Status);
        test.stopTest();
    }
}