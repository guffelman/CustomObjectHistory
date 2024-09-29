public class CustomObjectHistoryService {
    
    /**
     * Inserts a new record into Custom_Object_History__c.
     * 
     * @param object The name of the object.
     * @param field The field name for the custom field.
     * @param prevValue The previous value of the field.
     * @param newValue The new value of the field.
     * @param acct The account record to associate the history record with, if present.
     */
    public static void insertCustomObjectHistory(String object, String field, String prevValue, String newValue, Id acct) {
        // Create a new instance of Custom_Object_History__c
        Custom_Object_History__c historyRecord = new Custom_Object_History__c();
        // Populate the fields
        historyRecord.Object__c = object;
        historyRecord.Field__c = field;
        historyRecord.Previous_Value = prevValue;
        historyRecord.New_Value = newValue;

        if (acct != null) {
            // If the record has an associated account, populate the Account__c field
            historyRecord.Account__c = acct;
        }

        // Insert the record
        try {
            insert historyRecord;
            System.debug('Record successfully inserted');
        } catch (DmlException e) {
            System.debug('Error inserting record: ' + e.getMessage());
            throw new CustomException('Failed to insert Custom_Object_History__c record: ' + e.getMessage());
        }
    }

    // Custom exception for better error handling
    public class CustomException extends Exception {}
}
