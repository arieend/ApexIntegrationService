@RestResource(urlMapping='/Accounts/Contacts/')
global with sharing class AccountManager {
    @HttpGet
    global static Account getAccount() {
        //RestRequest request = RestContext.request;
        // grab the caseId from the end of the URL
        //String accountId = request.requestURI.substringBetween('Accounts/', '/Contacts');
            
        Account result =  [SELECT ID, Name, (SELECT ID,Name FROM Contacts) FROM Account LIMIT 1];        
        return result;
    }
}