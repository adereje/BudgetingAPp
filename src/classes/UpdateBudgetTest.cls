@isTest
public class UpdateBudgetTest
{  
    @isTest() 
    public static void testApplyTransaction()
    {
        Decimal originalBudget = 500.00;
        integer numOfTransactions = 5;
        TestDataFactory.createTestAccounts(5,'Abiel',10.00);   
        List<Transaction__c> transactions = [SELECT Total__c,Budget__c FROM Transaction__c WHERE Name='Abiel'];

        // List of Budget IDS
        Set<Id> budgetIds = new Set<Id>(); 
        // Loop through transactions and store their budget IDs
        for(Transaction__c t : transactions) {
            budgetIds.add(t.Budget__c);
        }
        
        // List of Budgets and their fields (SOQL Query)
        List <Budget__c> budgets = [SELECT Amount__c FROM Budget__c WHERE Id =: budgetIds];

        for(Transaction__c t : transactions)
        {
            for(Budget__c b : budgets)
        	{
            	if(t.Budget__c == b.Id)
                {
           			//Decimal theDifference = b.Amount__c - t.Total__c;
           			Decimal newBudget = originalBudget - numOfTransactions*t.Total__c;
                    System.assertEquals(newBudget,b.Amount__c);
                }
                else
                {
                    t.addError('Please pick the appropriate budget : ' + b.Name);
                }
            }

            
            
        }
		update budgets;
    }
   

}