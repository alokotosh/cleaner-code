public class Accounts extends fflib_SObjectDomain {

	// CONSTRUCTOR

	public Accounts(List<Account> records) {
		super(records);
	}


	// PUBLIC

	public override void onAfterInsert() {
		// new This().execute();
		// new That().execute();
	}


	public override void onBeforeUpdate(Map<Id, SObject> old) {
		// new This().execute();
		// new That().execute();
	}


	// INNER

	public class Constructor implements fflib_SObjectDomain.IConstructable {
		public fflib_SObjectDomain construct(List<SObject> sObjectList) {
			return new Accounts(sObjectList);
		}
	}
}