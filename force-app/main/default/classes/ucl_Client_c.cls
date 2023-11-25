public with sharing class ucl_Client_c {
    public String AccountNumber {get; set ;}
    public String ClientNumber { get; set; }
    public String FirstName { get; set; }
    public String LastName { get; set; }
    public String Email { get; set; }
    public String Phone { get; set; }
    public String Address { get; set; }

    public ucl_Client_c() {

    }
    
    public ucl_Client_c(String accountNumber, String clientNumber, String firstName, String lastName, String email, String phone, String address) {
        this.AccountNumber = accountNumber;
        this.ClientNumber = clientNumber;
        this.FirstName = firstName;
        this.LastName = lastName;
        this.Email = email;
        this.Phone = phone;
        this.Address = address;
    }

}