@isTest
private class ucl_TestCleanupScheduler {
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
    private class MySchedulableContext implements Schedulable, SchedulableContext {
        private Integer executeCount = 0;

        public void execute(SchedulableContext context) {
            executeCount++;
        }

        public Integer getExecuteCount() {
            return executeCount;
        }

        // Implementa el método necesario para la interfaz Schedulable
        public Id System.schedule(String jobName, String cronExp, Object schedulable) {
            // Devuelve null ya que no estamos interesados en programar trabajos reales durante las pruebas
            return null;
        }
    }
}
