trigger TransactionTrigger on Transaction__c (before insert,after insert, after delete, after update ) 
{
    if(Trigger.isAfter)
    {
        if(Trigger.isInsert)
        {
            UpdateBudget.applyTransaction(Trigger.new);
            UpdateBudget.applyTransactiontoAccount(Trigger.new);
        }
        if(Trigger.isDelete)
        {
            UpdateBudget.deleteTransaction(Trigger.old);
        }
        if(Trigger.isUpdate)
        {
            UpdateBudget.modifyTransaction(Trigger.old,Trigger.new);
                        UpdateBudget.modifyAccounts(Trigger.old,Trigger.new);

        }

    }
if(Trigger.isBefore)
    {
        if(Trigger.isInsert)
        {
            UpdateBudget.validateTransaction(Trigger.new);
        }
    }

}