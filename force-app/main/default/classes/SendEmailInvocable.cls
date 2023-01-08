public with sharing class SendEmailInvocable {

    @InvocableMethod(
        label = 'Send Email'
        description = 'Sends a text and/or html email to recipients without need of Email Alert or Template. If set the Who ID or What ID then Activity is also created.'
    )
    public static void execute( List<Request> requests ) {

        // Note, this is bound by Apex governor limits of no more than 10 emails can be sent per transaction.
        // Therefore, all the requests are batched together and sent within apex transaction limits for bulk-friendliness.
        // https://developer.salesforce.com/docs/atlas.en-us.salesforce_app_limits_cheatsheet.meta/salesforce_app_limits_cheatsheet/salesforce_app_limits_platform_apexgov.htm

        Database.executeBatch( new SendEmailBatchable( requests ), Limits.getLimitEmailInvocations() );

    }

    // -----------------------------------------------------------------

    /**
     * Note that for fields we want to receive multiple values for they are Strings and we expect comma-delimited values rather than a List.
     * This is because when calling invocable methods from Process Builder you are not able to provide a List of values, just a single value.
     * In Flow, however, you can build up a Collection Variable and pass in a List of values.
     * So to make this solution more user-friendly to Process Builder we accept comma-delimited strings of values and in the code we split them
     * into List as appropriate.
     */
    public class Request {

        @InvocableVariable(
            label = 'Who ID'
            description = 'Email recipient and who the email Activity will be related to (User, Contact, or Lead). At least one of Who ID, To, Cc, Bcc Addresses must be set.'
        )
        public ID whoId;

        @InvocableVariable(
            label = 'What ID'
            description = 'What the email Activity will be related to (Account, Case, Opportunity, etc.). Cannot be set if Who Id is a User record.'
        )
        public ID whatId;

        @InvocableVariable(
            label = 'To Addresses'
            description = 'Comma-delimited list of email addresses. At least one of Who ID, To, Cc, Bcc Addresses must be set.'
        )
        public String toAddresses;

        @InvocableVariable(
            label = 'Cc Addresses'
            description = 'Comma-delimited list of email addresses. At least one of Who ID, To, Cc, Bcc Addresses must be set.'
        )
        public String ccAddresses;

        @InvocableVariable(
            label = 'Bcc Addresses'
            description = 'Comma-delimited list of email addresses. At least one of Who ID, To, Cc, Bcc Addresses must be set.'
        )
        public String bccAddresses;

        @InvocableVariable(
            label = 'Org-Wide Email Address ID'
            description = 'ID of the organization-wide email address to use. Cannot be used if "Sender Name" is set.'
        )
        public String orgWideEmailId;

        @InvocableVariable(
            label = 'Sender Name'
            description = 'The name that appears on the From line of the email. Cannot be set if "Org-Wide Email Address ID" is set.'
        )
        public String senderName;

        @InvocableVariable(
            label = 'Reply To'
            description = 'The email address that receives the message when a recipient replies.'
        )
        public String replyTo;

        @InvocableVariable(
            label = 'Subject'
            description = 'The email subject line.'
        )
        public String subject;

        @InvocableVariable(
            label = 'Text Body'
            description = 'The text version of the email. At least one of "Text Body" or "Html Body" must be set.'
        )
        public String textBody;

        @InvocableVariable(
            label = 'Html Body'
            description = 'The html version of the email. At least one of "Text Body" or "Html Body" must be set.'
        )
        public String htmlBody;

        @InvocableVariable(
            label = 'File Attachment IDs'
            description = 'Comma-delimited list of Document IDs and/or ContentVersion IDs (aka Chatter Files) to attach to email. Standard Attachment IDs are not supported.' )
        public String fileIds;

    }

}