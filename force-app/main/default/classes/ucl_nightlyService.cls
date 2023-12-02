public class ucl_nightlyService implements Schedulable {
    public void execute(SchedulableContext ctx) {
        try {
            InsertDataHeroku insertData = new InsertDataHeroku();
        } catch(Exception e) {
            System.debug('Error: ' + e.getMessage());
            
                // programar la ejecución.
            // String jobName = 'importLegalAdvisors';
            //String cronExp = '0 0 1 1/1 * ? *'; // Cron expression for 2 AM every day
            //System.schedule(jobName, cronExp, new ucl_LegalAdvisorsScheduledJob());
        }
    }
}
