@isTest
private class ucl_TestInserDataHeroku {

    @isTest
    public class MockHttpResponseGenerator implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest req) {
            // Simula una respuesta exitosa con 12 Legal_Advisors
            HttpResponse res = new HttpResponse();
            res.setStatusCode(200);
            res.setBody('[{"AccountStatus": "Enabled", "AccountNumber": "1", "AccountName": "Legal Advisor 1", "AsOfDate": "2023-01-01"}, {"AccountStatus": "Enabled", "AccountNumber": "2", "AccountName": "Legal Advisor 2", "AsOfDate": "2023-01-01"}, {"AccountStatus": "Enabled", "AccountNumber": "3", "AccountName": "Legal Advisor 3", "AsOfDate": "2023-01-01"}, {"AccountStatus": "Enabled", "AccountNumber": "4", "AccountName": "Legal Advisor 4", "AsOfDate": "2023-01-01"}, {"AccountStatus": "Enabled", "AccountNumber": "5", "AccountName": "Legal Advisor 5", "AsOfDate": "2023-01-01"}, {"AccountStatus": "Enabled", "AccountNumber": "6", "AccountName": "Legal Advisor 6", "AsOfDate": "2023-01-01"}, {"AccountStatus": "Enabled", "AccountNumber": "7", "AccountName": "Legal Advisor 7", "AsOfDate": "2023-01-01"}, {"AccountStatus": "Enabled", "AccountNumber": "8", "AccountName": "Legal Advisor 8", "AsOfDate": "2023-01-01"}, {"AccountStatus": "Enabled", "AccountNumber": "9", "AccountName": "Legal Advisor 9", "AsOfDate": "2023-01-01"}, {"AccountStatus": "Enabled", "AccountNumber": "10", "AccountName": "Legal Advisor 10", "AsOfDate": "2023-01-01"}, {"AccountStatus": "Enabled", "AccountNumber": "11", "AccountName": "Legal Advisor 11", "AsOfDate": "2023-01-01"}, {"AccountStatus": "Enabled", "AccountNumber": "12", "AccountName": "Legal Advisor 12", "AsOfDate": "2023-01-01"}]');
            return res;
        }
    }

        @isTest
        static void testInsertData() {
            // Establece el mock para el servicio externo
            Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());

            // Inicia el bloque de prueba
            Test.startTest();

            try {
                // Llama al método que deseas probar
                ucl_InsertDataHeroku.insertData();

                // Verifica que se hayan insertado 12 registros de Legal_Advisor__c
                Integer advisorCount = [SELECT COUNT() FROM Legal_Advisor__c WHERE Account_Status__c = 'Enabled'];
                System.assertEquals(12, advisorCount, 'Debe haber 12 registros de Legal_Advisor__c habilitados');
            } catch (Exception e) {
                // Manejo de errores
                System.assert(false, 'Error en la prueba: ' + e.getMessage());
            } finally {
                Test.stopTest();
            }
        }
}