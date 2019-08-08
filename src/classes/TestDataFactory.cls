@isTest(seeAllData = true)
public class TestDataFactory 
{
    public static void createTestAccounts(Integer numAccts,string name, decimal money) {
 Date d;
        List<Transaction__c> listOfTransactionsToInsert = new List<Transaction__c>();
        
        List<Budget__c> listOfBudgetsToInsert = new List<Budget__c>();
        Budget__c b = new Budget__c(Name='Food',Amount__c = 500.00);
        listOfBudgetsToInsert.add(b);
                insert listOfBudgetsToInsert;

        List<Bank_Account__c> listOfAccountsToInsert = new List<Bank_Account__c>();
        Bank_Account__c ba = new Bank_Account__c(Name='New Account',Funds__c = 5000.00);
        listOfAccountsToInsert.add(ba);
        insert listOfAccountsToInsert;
        
        for(Integer i = 0; i < numAccts; i++) {
            Transaction__c t = new Transaction__c(Name=name,Total__c = money,Title__c='Lunch',Budget__c = b.Id,Bank_Account__c = ba.Id,Date_of_Transaction__c = Date.today());
            // Transaction__c t = new Transaction__c(t.Name = name,500,1000,money,'Lunch',d.today());
            
            listOfTransactionsToInsert.add(t);
            // Transaction__c t = new Transaction__c();
        }
        
        insert listOfTransactionsToInsert;
    }
    /*
public static void createTestBudgets(Integer numBudgets,string name, decimal money) {
List<Transaction__c> accts = new List<Transaction__c>();


List<Budget__c> listOfBudgetsToInsert = new List<Budget__c>();

for(Integer i = 0; i < numBudgets; i++) {
Budget__c b = new Budget__c(Name=name,Amount__c = money);
// Transaction__c t = new Transaction__c(t.Name = name,500,1000,money,'Lunch',d.today());

listOfBudgetsToInsert.add(b);
// Transaction__c t = new Transaction__c();
}
insert listOfBudgetsToInsert;
}
*/
}