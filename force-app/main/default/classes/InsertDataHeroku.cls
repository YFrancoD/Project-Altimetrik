public with sharing class InsertDataHeroku {

    @AuraEnabled
    public static void InsertData() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://altimetrik-bootcamp.herokuapp.com/LegalAccounts');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        if (response.getStatusCode() == 200) {
            List<Object> ucl_LegalAdvisors = (List<Object>) JSON.deserializeUntyped(response.getBody());
            List<Legal_Advisor__c> legalAdvisorsToUpsert = new List<Legal_Advisor__c>();
            List<Client__c> clientsToUpsert = new List<Client__c>();
        
            for (Object legalAdvisorObj : ucl_LegalAdvisors) {
                Map<String, Object> legalAdvisorMap = (Map<String, Object>) legalAdvisorObj;
                String accountStatus = (String) legalAdvisorMap.get('AccountStatus');
                if (accountStatus != null && accountStatus.equals('Enabled')) {
                    Legal_Advisor__c legalAdvisorRecord = new Legal_Advisor__c();
                    String accountNumber = (String) legalAdvisorMap.get('AccountNumber');
                    String accountName = (String) legalAdvisorMap.get('AccountName');
                    // Ajusta el formato de fecha a "MM/dd/yyyy"
                    String asOfDateString = (String) legalAdvisorMap.get('AsOfDate');
                    Date asOfDate;
                    try {
                        asOfDate = Date.parse(asOfDateString);
                    } catch (Exception e) {
                        System.debug('Error al convertir la fecha: ' + e.getMessage());
                        asOfDate = Date.today();
                    }
        
                    legalAdvisorRecord.Account_Number__c = accountNumber;
                    legalAdvisorRecord.Account_Name__c = accountName;
                    legalAdvisorRecord.Account_Status__c = accountStatus;
                    legalAdvisorRecord.As_of_date__c = asOfDate;
                    legalAdvisorsToUpsert.add(legalAdvisorRecord);
                //sacar del for
                    upsert legalAdvisorsToUpsert Account_Number__c;

                    // Manejo de la lista de clientes
                    List<Object> clientList = (List<Object>) legalAdvisorMap.get('Clients');
                    for (Object clientObj : clientList) {
                        Map<String, Object> clientMap = (Map<String, Object>) clientObj;

                        Client__c clientRecord = new Client__c();
                        clientRecord.First_Name__c = (String) clientMap.get('FirstName');
                        clientRecord.Last_Name__c = (String) clientMap.get('LastName');
                        clientRecord.Email__c = (String) clientMap.get('Email');
                        clientRecord.Phone__c = (String) clientMap.get('Phone');
                        clientRecord.Address__c = (String) clientMap.get('Address');
                        clientRecord.Client_Number__c = (String) clientMap.get('ClientNumber');

                        // Verifica que el Id del Legal Advisor no sea nulo antes de asignar
                        if (legalAdvisorRecord.Id != null) {
                            clientRecord.Legal_Advisor__c = legalAdvisorRecord.Id;
                            clientsToUpsert.add(clientRecord);
                        } else {
                            System.debug('El Id del Legal Advisor es nulo. No se puede asignar a Client__c.');
                        }
                        
            upsert clientsToUpsert Client_Number__c;
                    }
                }
            }
        
        } else {
            System.debug('Error: ' + response.getStatusCode() + ' - ' + response.getStatus());
            System.debug('Response Body: ' + response.getBody());
        }
    }
}
