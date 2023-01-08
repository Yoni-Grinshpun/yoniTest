public class TestHighlightForAutomation_3 {
	public static Integer HighlightingBackend_2(Integer b) {
        Integer a;
        Opportunity opp = new Opportunity();
        Account Acc = new Account();
        Contact con = new Contact();
        opp.CloseDate=date.today().addMonths(2);
         
         /*
                   As I want you to be
                    As a friend, as a friend
                    As an known enemy
                    Take your time, hurry up
                    The choice is yours, don't be late
                    Take a rest as a friend
                    As an old
                    Memoria, memoria
                    Memoria, memoria
                    Come doused in mud, soaked in bleach
                    As I want you to be
                    As a trend, as a friend
                    As an old
                    Memoria, memoria
                    Memoria, memoria
                    And I swear that I don't have a gun
                    No I don't have a gun
                    No I don't have a gun
                    Memoria, memoria
                    Memoria, memoria
                    (No I don't have a gun)
                    And I swear that I don't have a gun
                    No I don't have a gun
                    No I don't have a gun
                    No I don't have a gun
                    No I don't have a gun
                    
                    */
        opp.Name='test opp';
        opp.StageName='IsWon';
        /*opp.StageName='inside comment'; */
        System.debug('this is AI test for relation inside text:'+opp.Name+'with Contact');
        insert opp;
        String LeadAccount = Acc.Text_For_Convert__c;
        if(opp.PLF_OpporF1__c == '4'){
            a = 1;
        }
        a=b;
        return a;
    }

    public static Integer firstfunc(){
        relationship_chaining rc = new relationship_chaining();

        return 5;
        

    }
}