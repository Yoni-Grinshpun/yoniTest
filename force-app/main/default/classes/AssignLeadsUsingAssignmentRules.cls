/**
 * Created by idan on 14/02/2018.
 */

public class AssignLeadsUsingAssignmentRules {
    @InvocableMethod
    public static void LeadAssign(List<Id> LeadIds){
        Database.DMLOptions dmo = new Database.DMLOptions();

        dmo.AssignmentRuleHeader.useDefaultRule= true;
        Lead Leads=[SELECT Id FROM lead WHERE Id =:LeadIds];
        System.debug(Leads);
        Leads.setOptions(dmo);
        update Leads;
    }
}