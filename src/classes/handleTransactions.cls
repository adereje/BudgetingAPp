public class handleTransactions 
{
    public void  returnLists(List <Transaction__c> exchanges)
    {
		  for(Transaction__c t : exchanges)
        {         
             //t = [SELECT Budget__r.Amount__c FROM Transaction__c WHERE Budget__r.Name =: t.Budget__r.Name];

            //query for the amount of the budget
            //System.debug('transaction: ' + t);
            //System.debug('t.Budget__r.Amount__c: ' + t.Budget__r.Amount__c);
            //System.debug('t.Total__c: ' + t.Total__c);
            t.Budget__r.Amount__c = t.Budget__r.Amount__c - t.Total__c;
            
        }        
    }

}