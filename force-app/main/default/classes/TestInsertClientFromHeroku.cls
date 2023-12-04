public with sharing class TestInsertClientFromHeroku {
    @isTest
    private class TestInsertClientFromHeroku {
    
        private class MockHttpResponseGenerator implements HttpCalloutMock {
            public HTTPResponse respond(HTTPRequest req) {
                // Simula una respuesta exitosa con 67 Clientes
                HttpResponse res = new HttpResponse();
                res.setStatusCode(200);
                res.setBody('[{"FirstName": "John", "LastName": "Doe", "Email": "john.doe@example.com", "Phone": "123456789", "Address": "123 Main St", "ClientNumber": "1"}, {"FirstName": "Jane", "LastName": "Smith", "Email": "jane.smith@example.com", "Phone": "987654321", "Address": "456 Oak St", "ClientNumber": "2"}, ... (otros 65 clientes)]');
                return res;
            }
        }
    
        @isTest
        static void testInsertData() {
            // Establece el mock para el servicio externo
            Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
    
            // Inicia el bloque de prueba
            Test.startTest();
    
            // Llama al método que deseas probar
            InsertDataHeroku.InsertData();
    
            // Termina el bloque de prueba
            Test.stopTest();
    
            // Verifica que se hayan insertado 67 registros de Client__c
            Integer clientCount = [SELECT COUNT() FROM Client__c];
            System.assertEquals(67, clientCount, 'Debe haber 67 registros de Client__c');
        }
    }
    
}