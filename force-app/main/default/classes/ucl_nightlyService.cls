public class ucl_nightlyService implements Schedulable {
    public void execute(SchedulableContext ctx) {
        try {
            InsertDataHeroku insertData = new InsertDataHeroku();
        } catch(Exception e) {
            System.debug('Error: ' + e.getMessage());
            
        }
    }
}
