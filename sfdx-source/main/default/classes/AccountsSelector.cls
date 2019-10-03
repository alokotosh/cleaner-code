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


	public List<Account> byIds(Set<Id> ids) {
		return (List<Account>) Database.query(newQueryFactory()
													.setCondition('Id IN :ids')
													.toSOQL());
	}


	public List<Account> byParentIds(Set<Id> ids) {
		return (List<Account>) Database.query( newQueryFactory()
													.setCondition('lkp_OrgTeam__c in :ids')
													.toSOQL() );
	}
}