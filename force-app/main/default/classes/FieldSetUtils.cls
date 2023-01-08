/*
Credit
http://blogforce9.blogspot.co.il/2012/10/generate-query-from-fieldsets.html
util class that dynamically generates query using fieldset/fieldsets
 */

public class FieldSetUtils {

  Map<String, Schema.SObjectType> globalDescribe;


  public FieldSetUtils() {
    globalDescribe = Schema.getGlobalDescribe();
  }
  /*This method return queries form a single fieldset
  public String generateQueryFromFieldSet(String sObjectName,String fieldSet,Set<String> additionalFields,String whereClause){
    return generateQueryFromFieldSets(sObjectName,new Set<String>{fieldSet},additionalFields,whereClause);
  }
  /*
  *This method generates query according to passed in object and fieldsets(plural) name
  **/
  public String generateQueryFromFieldSets(String sObjectName, Set<String> fieldSets, Set<String> additionalFields, String whereClause) {

    Set<String> fields = new Set<String> {'Id'};
    String query = 'SELECT '; //initial query

    if (additionalFields != null)
      for ( String fs : additionalFields ) {
        //add only unique fields
        if (!fields.contains(fs)) {
          //maintain a set of fields so that only unique fields are added in query
          fields.add(fs);
        }

        //join all fiels set into a query
        //query += String.join(new List<String>(fields),',');
      }
    //describe the provided sObject
    Schema.DescribeSObjectResult res = globalDescribe.get(sObjectName).getDescribe();
    //get the fields set map
    Map<String, Schema.FieldSet> fieldSetMap = res.fieldSets.getMap();
    //iterate through provided fieldsets and generate query
    for (String fieldSetName : fieldSets) {
      Schema.FieldSet fs = fieldSetMap.get(fieldSetName);
      for ( Schema.FieldSetMember fsm : fs.getFields() ) {
        //add only unique fields
        if (!fields.contains(fsm.getFieldPath())) {
          //maintain a set of fields so that only unique fields are added in query
          fields.add(fsm.getFieldPath());
          //query = query+','+fsm.getFieldPath();
        }
      }
    }
    query += String.join(new List<String>(fields), ',');
    query = (whereClause == '' || whereClause == null)
            ? (query + ' FROM ' + sObjectName)
            : (query + ' FROM ' + sObjectName + ' WHERE ' + whereClause);
    return query;
  }

  public Set<String> generateSetStringFromFieldSets (String sObjectName, Set<String> fieldSets) {
    Set<String> fields = new Set<String>();
    Schema.DescribeSObjectResult res = globalDescribe.get(sObjectName).getDescribe();
    //get the fields set map
    Map<String, Schema.FieldSet> fieldSetMap = res.fieldSets.getMap();
    //iterate through provided fieldsets and generate query
    for (String fieldSetName : fieldSets) {
      Schema.FieldSet fs = fieldSetMap.get(fieldSetName);
      for ( Schema.FieldSetMember fsm : fs.getFields() ) {
        //add only unique fields
        if (!fields.contains(fsm.getFieldPath())) {
          //maintain a set of fields so that only unique fields are added in query
          fields.add(fsm.getFieldPath());
          //query = query+','+fsm.getFieldPath();
        }
      }
    }
   return fields ;
  }

  public List<String> generateListStringFromFieldSets (String sObjectName, Set<String> fieldSets) {
    return new List<String> (generateSetStringFromFieldSets (sObjectName, fieldSets)) ;
  }

}