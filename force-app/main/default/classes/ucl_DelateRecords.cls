public with sharing class ucl_DelateRecords {

    @AuraEnabled
    public static void Delate() {
 List<Legal_Advisor__c> accountsToDelete = [SELECT Id FROM Legal_Advisor__c]; 
    if (!accountsToDelete.isEmpty()) {
    try {
        delete accountsToDelete;
        System.debug('Legal Advisors deleted successfully.');
    } catch (Exception e) {
        System.debug('An error occurred while deleting Legal Advisors: ' + e.getMessage());
    }
} else {
    System.debug('No Legal Advisors to delete.');
}


    }
}