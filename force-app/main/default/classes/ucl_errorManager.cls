public with sharing class ucl_errorManager {

    public static void saveErrorToCustomObject(String errorType, String errorMessage) {
        Error__c errorRecord = new Error__c();
        errorRecord.Message__c = errorMessage;
        errorRecord.Type__c = errorType;
        errorRecord.Date__c = System.today(); // Fecha actual
        errorRecord.Expiration_Date__c = System.today().addDays(30);
    
        // Crea una lista para almacenar los errores
        List<Error__c> errorList = new List<Error__c>();
        errorList.add(errorRecord);
    
        // Guarda la lista de errores en Salesforce
        try {
            insert errorList;
        } catch (Exception e) {
        }
    }

    public static void sendEmail(String errorMessage, String email) {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[]{email}; 
        mail.setToAddresses(toAddresses);
        mail.setSubject('There are issues with the import from Heroku.');
        String body = 'The import could not be completed. Error: ' + errorMessage;

        mail.setPlainTextBody(body);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
    
    

    // Método para eliminar registros de Error__c después de 30 días
    public static void deleteExpiredErrors() {
        Date thirtyDaysAgo = System.today().addDays(-30);
        List<Error__c> errorsToDelete = [SELECT Id FROM Error__c WHERE Expiration_Date__c <= :thirtyDaysAgo];
        delete errorsToDelete;
    }

}