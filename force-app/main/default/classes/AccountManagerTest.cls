@IsTest
private class AccountManagerTest {
    @isTest static void testGetContactsByAccountId() {
        Id recordId = createTestRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
        //request.requestUri = 'https://cunning-otter-c6hdxd-dev-ed.lightning.force.com/services/apexrest/Accounts/'+ recordId +'/Contacts/';
        request.requestUri = 'https://cunning-otter-c6hdxd-dev-ed.lightning.force.com/services/apexrest/Accounts/Contacts/';
            
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account thisAccount = AccountManager.getAccount();
        //System.debug('thisAccount:' + thisAccount);
        // Verify results
        System.assert(thisAccount != null);
        System.assertEquals('Test account record', thisAccount.Name);
        //System.assertEquals('Test contact record', thisAccount.Contacts.Name);
    }
    // Helper method
    static Id createTestRecord() {
        // Create test record
        Account accountTest = new Account(Name ='Test account record');            
        insert accountTest;
        Contact contactTest = new Contact(AccountId=accountTest.id, FirstName='John', LastName='Doe');
        insert contactTest;
        return accountTest.Id;
    }          
}