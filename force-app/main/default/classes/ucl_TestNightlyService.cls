@isTest
private class ucl_TestNightlyService {

    @isTest
        static void ucl_TestNightlyService() {
            // Inicia 
            Test.startTest();
    
            // Crea una instancia de la clase Schedulable
            ucl_nightlyService nightlyServiceInstance = new ucl_nightlyService();
    
            // Llama al método execute directamente para probar la lógica del trabajo programado
            nightlyServiceInstance.execute(null);
    
            // Termina
            Test.stopTest();
    
        }
}