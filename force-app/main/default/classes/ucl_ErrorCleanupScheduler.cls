public with sharing class ucl_ErrorCleanupScheduler implements Schedulable {
    public void execute(SchedulableContext ctx) {
        // Crea una instancia de la clase ucl_errorManager
        ucl_errorManager errorManagerInstance = new ucl_errorManager();

        // Llama al método deleteExpiredErrors
        errorManagerInstance.deleteExpiredErrors();
    }
}
// asi lo llamaria
//ucl_ErrorCleanupScheduler scheduler = new ucl_ErrorCleanupScheduler();
//String cronExpression = '0 0 0 1/2 * ? *';
//System.schedule('ucl_ErrorCleanupSchedulerJob', cronExpression, scheduler);


// Crea una instancia de la clase del trabajo programado
// Configura la expresión cron para ejecutarse cada dos días
// Crea un trabajo programado y programa la ejecución con la expresión cron


