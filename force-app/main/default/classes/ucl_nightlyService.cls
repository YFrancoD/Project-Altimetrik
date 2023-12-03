public class ucl_nightlyService implements Schedulable {
    public void execute(SchedulableContext ctx) {
        try {
             InsertDataHeroku.insertData();
            
        } catch(Exception e) {
            System.debug('Error en el trabajo programado: ' + e.getMessage());
        }
    }
            // este es el codigo que ejecute para que todos los dias a la 1 am llame al servicio
   // String jobName = 'importLegalAdvisors';
   // String cronExp = '0 0 1 1/1 * ? *'; // Cron expression for 1 AM every day
    //System.schedule(jobName, cronExp, new InsertDataHerokuScheduler());

}
