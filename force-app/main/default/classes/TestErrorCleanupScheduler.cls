@isTest
public class TestErrorCleanupScheduler {
    @isTest
    static void testScheduler() {
        // Crea una instancia de la clase ucl_ErrorCleanupScheduler
        ucl_ErrorCleanupScheduler cleanupScheduler = new ucl_ErrorCleanupScheduler();

        // Crea una instancia de SchedulableContext (puede ser una instancia de prueba simulada)
        Test.startTest();
        SchedulableContext sc = new SchedulableContext();
        cleanupScheduler.execute(sc);
        Test.stopTest();

        // Verifica que el método execute del ErrorCleanupScheduler haya sido llamado correctamente
    }
}
