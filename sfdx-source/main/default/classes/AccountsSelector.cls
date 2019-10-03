public without sharing class AccountsSelector extends fflib_SObjectSelector{

	public List<Schema.SObjectField> getSObjectFieldList() {
		return new List<Schema.SObjectField>{
				Account.Id,
				Account.Name,
				Account.AccountNumber,
				Account.OwnerId,
				Account.CreatedById,
				Account.ParentId
		};
	}


	public Schema.SObjectType getSObjectType() {
		return Account.SObjectType;
	}


	public List<Account> byIds(Set<Id> accountIds) {
		return (List<Account>) Database.query(newQueryFactory().setCondition('Id IN :accountIds').toSOQL());
	}


	public List<Account> byParentIds(Set<Id> parentIds) {
		fflib_QueryFactory factory = newQueryFactory().setCondition('lkp_OrgTeam__c in :parentIds');
		return (List<Account>) Database.query(factory.toSOQL());
	}
}