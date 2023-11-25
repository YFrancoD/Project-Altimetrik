public with sharing class ucl_LegalAdvisor_c {
    public String AccountNumber { get; set; }
    public String AccountName { get; set; }
    public String AccountStatus { get; set; }
    public Date AsOfDate { get; set; }
    public List<ucl_Client_C> Clients { get; set; }

    public ucl_LegalAdvisor_c() {
        Clients = new List<ucl_Client_C>();
    }
    public ucl_LegalAdvisor_c(String accountNumber, String accountName, String accountStatus, Date asOfDate, List<ucl_Client_C> clients) {
        this.AccountNumber = accountNumber;
        this.AccountName = accountName;
        this.AccountStatus = accountStatus;
        this.AsOfDate = asOfDate;
        this.Clients = clients;
    }
}