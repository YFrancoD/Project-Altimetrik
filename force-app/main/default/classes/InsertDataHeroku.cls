public with sharing class InsertDataHeroku {
    public InsertDataHeroku() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://altimetrik-bootcamp.herokuapp.com/LegalAccounts');
        request.setMethod('GET');
        HttpResponse response = http.send(request);    
        if (response.getStatusCode() == 200) {
            List<Object> ucl_LegalAdvisors = (List<Object>) JSON.deserializeUntyped(response.getBody());
            List<ucl_LegalAdvisor__c> legalAdvisorsToUpsert = new List<ucl_LegalAdvisor__c>();
            for (Object legalAdvisorObj : ucl_LegalAdvisors) {
                Map<String, Object> legalAdvisorMap = (Map<String, Object>) legalAdvisorObj;
                ucl_LegalAdvisor__c legalAdvisorRecord = new ucl_LegalAdvisor__c();
                String accountNumber = (String) legalAdvisorMap.get('AccountNumber');
                String accountName = (String)  legalAdvisorMap.get('AccountName');
                String accountStatus = (String) legalAdvisorMap.get('AccountStatus');   
                // Ajusta el formato de fecha a "MM/dd/yyyy"
                String asOfDateString = (String) legalAdvisorMap.get('AsOfDate');
                Date asOfDate;   
                try {
                    asOfDate = Date.parse(asOfDateString);
                } catch (Exception e) {
                    System.debug('Error al convertir la fecha: ' + e.getMessage());
                    // Puedes asignar una fecha predeterminada o manejarlo según tus necesidades
                    asOfDate = Date.today();
                }
                legalAdvisorRecord.Account_Number__c = accountNumber;
                legalAdvisorRecord.Account_Name__c = accountName;
                legalAdvisorRecord.Account_Status__c = accountStatus;
                legalAdvisorRecord.As_of_date__c = asOfDate;
                // Ajusta otros campos según sea necesario
                legalAdvisorsToUpsert.add(legalAdvisorRecord);
            }
            upsert legalAdvisorsToUpsert Account_Number__c;
        } else {
            System.debug('Error: ' + response.getStatusCode() + ' - ' + response.getStatus());
            System.debug('Response Body: ' + response.getBody());
        }
    }
}