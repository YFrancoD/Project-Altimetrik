@isTest
private class TestCleanupScheduler {
    @isTest
    static void TestErrorCleanupScheduler() {
        // Crea una instancia de la clase ucl_ErrorCleanupScheduler
        ucl_ErrorCleanupScheduler cleanupScheduler = new ucl_ErrorCleanupScheduler();

        // Crea una instancia de SchedulableContext (implementación de prueba)
        Test.startTest();
        MySchedulableContext sc = new MySchedulableContext();
        cleanupScheduler.execute(sc);
        Test.stopTest();

        // Verifica que el método execute del ErrorCleanupScheduler haya sido llamado correctamente
        System.assertEquals(1, sc.getExecuteCount(), 'El método execute debe llamarse una vez');
    
    }

    // Implementación de prueba de SchedulableContext
    @isTest
    private class MySchedulableContext implements SchedulableContext {
        private Integer executeCount = 0;

        public void execute() {
            executeCount++;
        }

        public Integer getExecuteCount() {
            return executeCount;
        }

    }

}