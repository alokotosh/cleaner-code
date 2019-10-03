public class Accounts extends fflib_SObjectDomain {

	// CONSTRUCTOR

	public Accounts(List<Account> records) {
		super(records);
	}


	// PUBLIC

	public override void onAfterInsert() {
		new AdjustOpportunityCurrencies().execute(records);
	}


	public override void onValidate(Map<Id, SObject> old) {
		new VerifyAccountAddress().execute(records);
	}


	public override void onBeforeUpdate(Map<Id, SObject> old) {
		new AdjustOpportunityCurrencies().execute(records);
		new PromoteVipAccounts().execute(records);
	}


	// INNER

	public class Constructor implements fflib_SObjectDomain.IConstructable {
		public fflib_SObjectDomain construct(List<SObject> sobjects) {
			return new Accounts(sobjects);
		}
	}
}