public class UpdateBudget 
{

    public static void applyTransaction(List <Transaction__c> transactions)
    {
        // List of Budget IDS
        Set<Id> budgetIds = new Set<Id>(); 
        
        // Loop through transactions and store their budget IDs
        for(Transaction__c t : transactions) {
            budgetIds.add(t.Budget__c);
        }
        
        // List of Budgets and their fields (SOQL Query)
        List <Budget__c> budgets = [SELECT Amount__c FROM Budget__c WHERE Id =: budgetIds];
       
        // Loop through transactions
        	// Loop through budgets
        		// If current transaction's budget equals the current budget
        			//  do stuff	  	
        
        for(Transaction__c t : transactions)
        {
            for(Budget__c b : budgets)
        	{

            	if(t.Budget__c == b.Id)
                {
                    System.debug('In if');
            		b.Amount__c = b.Amount__c - t.Total__c;
                    System.debug('New budget: ' + b.Amount__c);
                }
                else
                {
                    t.addError('Please pick the appropriate budget : ' + b.Name);
                }
            }

            
            
        }
		update budgets;
    }
    public static void modifyTransaction(List <Transaction__c> oldTransactions,List <Transaction__c> newTransactions)
    {
        // List of Budget IDS
        Set<Id> oldBudgetIds = new Set<Id>(); 
                Set<Id> newBudgetIds = new Set<Id>(); 

        // Loop through transactions and store their budget IDs
        for(Transaction__c t : oldTransactions) {
            oldBudgetIds.add(t.Budget__c);
        }
        for(Transaction__c nt : newTransactions) {
            newBudgetIds.add(nt.Budget__c);
        }
        // List of Budgets and their fields (SOQL Query)
        List <Budget__c> oldBudgets = [SELECT Amount__c FROM Budget__c WHERE Id =: oldBudgetIds];
                List <Budget__c> newBudgets = [SELECT Amount__c FROM Budget__c WHERE Id =: newBudgetIds];

       
        // Loop through transactions
        	// Loop through budgets
        		// If current transaction's budget equals the current budget
        			//  do stuff	  	
        
        for(Transaction__c t : oldTransactions)
        {
            for(Transaction__c nt : newTransactions)
            {
                if(nt.Total__c != t.Total__c)
                {
            for(Budget__c b : newBudgets)
        	{
            System.debug('In for');
            // t = [SELECT Budget__r.Amount__c FROM Transaction__c WHERE Budget__r.Name =: t.Budget__r.Name];

            //query for the amount of the budget
            System.debug('transaction: ' + t);
            //System.debug('t.Budget__r.Amount__c: ' + t.Budget__r.Amount__c);
            System.debug('t.Total__c: ' + t.Total__c);
                            System.debug('b.Amount__c: ' + b.Amount__c);

            //t.Budget__r.Amount__c = t.Budget__r.Amount__c - t.Total__c;
            	
                    Decimal theDifference = nt.Total__c - t.Total__c;
                if(theDifference > 0)
                {
            		b.Amount__c = b.Amount__c + theDifference;
                }
                else
                {
                    b.Amount__c = b.Amount__c - theDifference;
                }
                    System.debug('New budget: ' + b.Amount__c);
                }
              
            

            }
            }            
        }
		update newBudgets;
    }
     public static void modifyAccounts(List <Transaction__c> oldTransactions,List <Transaction__c> newTransactions)
    {
        // List of Budget IDS
                Set<Id> newAccountIds = new Set<Id>(); 
        
        for(Transaction__c nt : newTransactions) {
            newAccountIds.add(nt.Bank_Account__c);
        }
        // List of Budgets and their fields (SOQL Query)
                List <Bank_Account__c> newAccounts = [SELECT Funds__c FROM Bank_Account__c WHERE Id =: newAccountIds];

       
        // Loop through transactions
        	// Loop through budgets
        		// If current transaction's budget equals the current budget
        			//  do stuff	  	
        
        for(Transaction__c t : oldTransactions)
        {
            for(Transaction__c nt : newTransactions)
            {
                if(nt.Total__c != t.Total__c)
                {
            for(Bank_Account__c b : newAccounts)
        	{
            System.debug('In for');
            // t = [SELECT Budget__r.Amount__c FROM Transaction__c WHERE Budget__r.Name =: t.Budget__r.Name];

            //query for the amount of the budget
            System.debug('transaction: ' + t);
            //System.debug('t.Budget__r.Amount__c: ' + t.Budget__r.Amount__c);
            System.debug('t.Total__c: ' + t.Total__c);

            //t.Budget__r.Amount__c = t.Budget__r.Amount__c - t.Total__c;
            	
                    Decimal theDifference = nt.Total__c - t.Total__c;
            		
                if(theDifference > 0)
                {
            		b.Funds__c = b.Funds__c + theDifference;
                }
                else
                {
                   b.Funds__c = b.Funds__c - theDifference;
                }
                    System.debug('New budget: ' + b.Funds__c);
                }
              
            }

            }
            
        }
		update newAccounts;
    }
    public static void applyTransactiontoAccount(List <Transaction__c> transactions)
    {
        // List of Budget IDS
        Set<Id> accountIds = new Set<Id>(); 
        
        // Loop through transactions and store their budget IDs
        for(Transaction__c t : transactions) {
            accountIds.add(t.Bank_Account__c);
        }
        
        // List of Budgets and their fields (SOQL Query)
        List <Bank_Account__c> accounts = [SELECT Funds__c FROM Bank_Account__c WHERE Id =: accountIds];
       
        // Loop through transactions
        	// Loop through budgets
        		// If current transaction's budget equals the current budget
        			//  do stuff	  	
        
        for(Transaction__c t : transactions)
        {
            for(Bank_Account__c b : accounts)
        	{
         

            //t.Budget__r.Amount__c = t.Budget__r.Amount__c - t.Total__c;
            	if(t.Bank_Account__c == b.Id)
                {
            		b.Funds__c = b.Funds__c - t.Total__c;
                }
                else
                {
                    t.addError('Please pick the appropriate budget : ' + b.Name);
                }
            }

            
            
        }
		update accounts;
    }
    public static void deleteTransaction(List <Transaction__c> transactions)
    {
        // List of Budget IDS
        Set<Id> accountIds = new Set<Id>(); 
        
        // Loop through transactions and store their budget IDs
        for(Transaction__c t : transactions) {
            accountIds.add(t.Bank_Account__c);
        }
        
        // List of Budgets and their fields (SOQL Query)
        List <Bank_Account__c> accounts = [SELECT Funds__c FROM Bank_Account__c WHERE Id =: accountIds];
       
        // Loop through transactions
        	// Loop through budgets
        		// If current transaction's budget equals the current budget
        			//  do stuff	  	
        
        for(Transaction__c t : transactions)
        {
            for(Bank_Account__c b : accounts)
        	{
         

            //t.Budget__r.Amount__c = t.Budget__r.Amount__c - t.Total__c;
            	if(t.Bank_Account__c == b.Id)
                {
            		b.Funds__c = b.Funds__c + t.Total__c;
                }
               
            }

            
            
        }
        Set<Id> budgetIds = new Set<Id>(); 
        
        // Loop through transactions and store their budget IDs
        for(Transaction__c t : transactions) {
            budgetIds.add(t.Budget__c);
        }
        
        // List of Budgets and their fields (SOQL Query)
        List <Budget__c> budgets = [SELECT Amount__c FROM Budget__c WHERE Id =: budgetIds];
       
        // Loop through transactions
        	// Loop through budgets
        		// If current transaction's budget equals the current budget
        			//  do stuff	  	
        
        for(Transaction__c t : transactions)
        {
            for(Budget__c b : budgets)
        	{
            
            	if(t.Budget__c == b.Id)
                {
            		b.Amount__c = b.Amount__c + t.Total__c;
                }
               
            }

            
            
        }
		update budgets;
        update accounts;
    }
    public static void validateTransaction(List <Transaction__c> transactions)
    {
        Set<Id> budgetIds = new Set<Id>(); 
        
        // Loop through transactions and store their budget IDs
        for(Transaction__c t : transactions) {
            budgetIds.add(t.Budget__c);
        }
        
        // List of Budgets and their fields (SOQL Query)
         List <Budget__c> budgets = [SELECT Amount__c FROM Budget__c];
        for(Transaction__c t : transactions)
        {
            for(Budget__c b : budgets)
            {
                if(t.Bank_Account__c == b.Id)
                {
            if(t.total__c>b.Amount__c)
            {
                t.addError('Please enter an amount less than or equal to the budget');
            }
            else if(t.total__c<0.0)
            {
                t.addError('Please enter an amount over 0');
            }
                }
            }
        }
        Set<Id> accountIds = new Set<Id>(); 
        
        // Loop through transactions and store their budget IDs
        for(Transaction__c t : transactions) {
            accountIds.add(t.Bank_Account__c);
        }
        
        // List of Budgets and their fields (SOQL Query)
        List <Bank_Account__c> accounts = [SELECT Funds__c FROM Bank_Account__c];
       
        // Loop through transactions
        	// Loop through budgets
        		// If current transaction's budget equals the current budget
        			//  do stuff	  	
        
        for(Transaction__c t : transactions)
        {
            for(Bank_Account__c b : accounts)
        	{
         

            //t.Budget__r.Amount__c = t.Budget__r.Amount__c - t.Total__c;
            	if(t.Bank_Account__c == b.Id)
                {
            		if(t.total__c>b.Funds__c)
            {
                t.addError('Please enter an amount less than or equal to the account total');
            }
            else if(t.total__c<0.0)
            {
                t.addError('Please enter an amount over 0');
            }
                }
               
            }

            
            
        }
    }
}