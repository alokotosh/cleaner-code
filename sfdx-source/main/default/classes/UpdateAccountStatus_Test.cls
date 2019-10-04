@IsTest
private class UpdateAccountStatus_Test {

    @IsTest
    private static void toInvalidOnInvalidOpportunityAmount() {

        // Exercise
        new Opportunity_t()
                .amount(-1000)
                .persist();


        // Verify
        System.assertEquals('Invalid', [SELECT BillingState FROM Account LIMIT 1].BillingState);
    }


    @IsTest
    private static void toRefreshedOnNewOpportunity() {

        // Setup
        Contact_t jack = new Contact_t().first('Jack').last('Harris');

        Account account = (Account) new Account_t()
                                    .name('Acme Corp')

                                    .add( new Opportunity_t()
                                        .amount(1000)
                                        .closes(2019, 12)
                                        .contact(jack))
        // Exercise
        .persist();


        // Verify
        System.assertEquals('Refreshed for ' +  jack.Id, account.BillingState);
    }
}