public class TestHighlightForAutomation_4 {    

    public Integer recordtypeClass(Integer a) {
        
        List<e_Invois_API__c> inv = [Select Id FROM e_Invois_API__c Where RecordTypeId = '0120R000000Uzgx' LIMIT 1 ];
        Integer ans = a;
        return ans;
    }
    public Integer getShipSizeM(Integer a){
    
    Spaceship_Name__c ship = new Spaceship_Name__c();
    boolean shipSize = ship.Crew_Size__c == '< 100';
    Integer b=a;    
    return b;
    }
    
}