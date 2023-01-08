public with sharing class SendEmailBatchable implements Database.Batchable<SendEmailInvocable.Request> {

    private List<SendEmailInvocable.Request> requests { get; set; }

    public SendEmailBatchable( List<SendEmailInvocable.Request> requests ) {
        this.requests = requests;
    }

    public List<SendEmailInvocable.Request> start( Database.BatchableContext context ) {

        System.debug( 'SendEmailBatchable.start : ' + context );
 
        return this.requests;
    }

    public void execute( Database.BatchableContext context, List<SendEmailInvocable.Request> requests ) {

        System.debug( 'SendEmailBatchable.execute: ' + context );

        Boolean allOrNone = false;

        List<Messaging.SingleEmailMessage> messages = new List<Messaging.SingleEmailMessage>();

        for ( SendEmailInvocable.Request req : requests ) {
            messages.add( convertToMessage( req ) );
        }

        List<Messaging.SendEmailResult> results = Messaging.sendEmail( messages, allOrNone );

        for ( Messaging.SendEmailResult result : results ) {
        	//system.debug('--result.isSuccess()-->>'+result.isSuccess());
            if ( !result.isSuccess() ) {
                for ( Messaging.SendEmailError err : result.getErrors() ) {
                    System.debug( LoggingLevel.ERROR, err );
                }
            }
        }

    }

    public void finish( Database.BatchableContext context ) {

        System.debug( 'SendEmailBatchable.finish: ' + context );

    }

    // -----------------------------------------------------------------

    private static final String CONTACT_KEY_PREFIX = Contact.sObjectType.getDescribe().getKeyPrefix();
    private static final String LEAD_KEY_PREFIX = Lead.sObjectType.getDescribe().getKeyPrefix();
    private static final String CONTENT_DOCUMENT_KEY_PREFIX = ContentDocument.sObjectType.getDescribe().getKeyPrefix();
	
    private static Messaging.SingleEmailMessage convertToMessage( SendEmailInvocable.Request req ) {

        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();

        if ( String.isNotBlank( req.whoId ) ) {

            String whoKeyPrefix = req.whoId.getSObjectType().getDescribe().getKeyPrefix();

            message.setTargetObjectId( req.whoId );
            message.setSaveAsActivity( ( whoKeyPrefix == CONTACT_KEY_PREFIX || whoKeyPrefix == LEAD_KEY_PREFIX ) );

        }

        if ( String.isNotBlank( req.whatId ) ) {

            message.setWhatId( req.whatId );
            if ( String.isBlank( message.getTargetObjectId() ) ) {
                message.setSaveAsActivity( true );
            }

        }

        if ( String.isNotBlank( req.toAddresses ) ) {
            message.setToAddresses( req.toAddresses.deleteWhitespace().split( ',' ) );
        }

        if ( String.isNotBlank( req.ccAddresses ) ) {
            message.setCcAddresses( req.ccAddresses.deleteWhitespace().split( ',' ) );
        }

        if ( String.isNotBlank( req.bccAddresses ) ) {
            message.setBccAddresses( req.bccAddresses.deleteWhitespace().split( ',' ) );
        }

        if ( String.isNotBlank( req.orgWideEmailId ) ) {
            message.setOrgWideEmailAddressId( req.orgWideEmailId );
        }

        if ( String.isNotBlank( req.senderName ) ) {
            message.setSenderDisplayName( req.senderName );
        }

        if ( String.isNotBlank( req.replyTo ) ) {
            message.setReplyTo( req.replyTo );
        }

        if ( String.isNotBlank( req.subject ) ) {
            message.setSubject( req.subject );
        }

        if ( String.isNotBlank( req.textBody ) ) {
            message.setPlainTextBody( req.textBody );
        }

        if ( String.isNotBlank( req.htmlBody ) ) {
            message.setHtmlBody( req.htmlBody );
        }

        if ( String.isNotBlank( req.fileIds ) ) {

            // common mistake is to provide ContentDocument ID instead of ContentVersion ID
            // if someone copies the Chatter File ID from the URL.
            // to help folks out, we'll convert to correct id.
			system.debug('---message--->>>'+message);
            List<String> fileIds = req.fileIds.deleteWhitespace().split( ',' );
            system.debug('----fileIds-->>>'+fileIds);
            List<String> contentDocumentIds = new List<String>();   // to lookup latest published version id
            List<String> entityAttachmentIds = new List<String>();  // to add to the email message
			system.debug('---CONTENT_DOCUMENT_KEY_PREFIX-->>>'+CONTENT_DOCUMENT_KEY_PREFIX);
            for ( String fileId : fileIds ) {

                String fileKeyPrefix = fileId.left( 3 );

                if ( fileKeyPrefix == CONTENT_DOCUMENT_KEY_PREFIX ) {
                    contentDocumentIds.add( fileId );
                } else {
                    entityAttachmentIds.add( fileId );
                }

            }

            if ( contentDocumentIds.size() > 0 ) {
                for ( ContentDocument cd : [ SELECT id, latestPublishedVersionId FROM ContentDocument WHERE id IN :contentDocumentIds ] ) {
                    entityAttachmentIds.add( cd.latestPublishedVersionId );
                }
            }

            if ( entityAttachmentIds.size() > 0 ) {
                message.setEntityAttachments( entityAttachmentIds );
            }

        }

        return message;
    }

}