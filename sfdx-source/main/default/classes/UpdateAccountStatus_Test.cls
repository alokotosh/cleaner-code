@IsTest
private class UpdateAccountStatus_Test {

    @IsTest
    private static void toRefreshedOnValidOpportunity() {

        // Setup
        Contact_t ceo = new Contact_t().first('Jack').last('Harris');

        Opportunity opp = (Opportunity) new Opportunity_t()
                                                .amount(1000)
                                                .closes(2019, 12)
                                                .contact(ceo)
                                                .persist();
        // Exercise
        new UpdateAccountStatus().execute( new List<Opportunity>{ opp } );


        // Verify
        System.assertEquals('Refreshed', [SELECT BillingState FROM Account LIMIT 1].BillingState);
    }


    @IsTest
    private static void toInvalidOnInvalidOpportunityAmount() {

        // Setup
        Opportunity opp = (Opportunity) new Opportunity_t()
                                                .amount(-1000)
                                                .persist();

        // Exercise
        new UpdateAccountStatus().execute( new List<Opportunity>{ opp } );


        // Verify
        System.assertEquals('Invalid', [SELECT BillingState FROM Account LIMIT 1].BillingState);
    }
}