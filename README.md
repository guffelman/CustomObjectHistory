Here’s the updated README for the `CustomObjectHistoryService` class without any hyperlinks:

---

# CustomObjectHistoryService

The `CustomObjectHistoryService` class provides functionality to insert records into the `Custom_Object_History__c` custom object in Salesforce. It is used to track changes to custom objects by logging the previous and new values of fields, and associating them with an account when applicable.

## Table of Contents
- Features
- Usage
- Method Overview
  - insertCustomObjectHistory
- Error Handling
- Dependencies

## Features

- Logs changes to a custom object's field by creating a record in `Custom_Object_History__c`.
- Tracks the previous and new values of a field.
- Associates the history record with an Account, if applicable.
- Provides custom exception handling for failed operations.

## Usage

This class is designed to be called from other code when there is a need to log field changes on custom objects.

### Example

```java
String objectName = 'Custom_Object__c';
String fieldName = 'Custom_Field__c';
String previousValue = 'Old Value';
String newValue = 'New Value';
Id accountId = '001XXXXXXXXXXXXXXX';  // Optional

CustomObjectHistoryService.insertCustomObjectHistory(objectName, fieldName, previousValue, newValue, accountId);
```

In this example, a new record in `Custom_Object_History__c` will be created, logging the change for the field `Custom_Field__c` on `Custom_Object__c`. If an account is specified, it will also be associated with the history record.

## Method Overview

### `insertCustomObjectHistory`

Inserts a record into `Custom_Object_History__c` with the following parameters:

#### Parameters:
- `String object`: The name of the custom object (e.g., 'Custom_Object__c').
- `String field`: The name of the field being tracked (e.g., 'Custom_Field__c').
- `String prevValue`: The previous value of the field.
- `String newValue`: The new value of the field.
- `Id acct`: The Account record ID to associate with the history record (optional).

#### Example Usage:
```java
CustomObjectHistoryService.insertCustomObjectHistory(
    'Custom_Object__c',
    'Custom_Field__c',
    'Old Value',
    'New Value',
    '001XXXXXXXXXXXXXXX'
);
```

## Error Handling

The method uses a try-catch block to handle DML exceptions. In case of failure, a custom `CustomException` is thrown, with the original error message logged for debugging purposes.

### Example:
```java
try {
    CustomObjectHistoryService.insertCustomObjectHistory(
        'Custom_Object__c',
        'Custom_Field__c',
        'Old Value',
        'New Value',
        null
    );
} catch (CustomObjectHistoryService.CustomException e) {
    System.debug('Error: ' + e.getMessage());
}
```

## Dependencies

This service assumes the existence of a custom object `Custom_Object_History__c` with fields:
- `Object__c`: Stores the name of the object.
- `Field__c`: Stores the field name.
- `Previous_Value`: Stores the previous field value.
- `New_Value`: Stores the new field value.
- `Account__c`: (Optional) References the associated Account.

