/**
 * Created by idan on 14/02/2018.
 */

@IsTest
private class AssignLeadsUsingAssignmentRulesTest {
    @IsTest
    static void testBehavior() {
//        ToDO : Need to test vs Marketo usr (as this process is base on Marketo only)
        Test.startTest();
        Lead lead = new Lead(LastName = 'LastName' , Status = 'New' , Company = 'Test');
        Insert lead ; 
        AssignLeadsUsingAssignmentRules.LeadAssign( new List<Id>{lead.Id});
        List<Lead> leads = [SELECT Id ,OwnerId, Owner.Name FROM Lead LIMIT 1];
        System.debug( UserInfo.getUserId() +'!='+ leads[0].OwnerId );
        //System.assertNotEquals(UserInfo.getUserId() ,leads[0].OwnerId );
        Test.stopTest();

    }
}