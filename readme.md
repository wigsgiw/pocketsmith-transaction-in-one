# PocketSmith Transaction-in-One

The general idea behind this little web app is to allow people to quickly enter manual transactions into a nominated transaction account on PocketSmith. Merchant and category are optional - all you need to enter is an amount if that's all you want to enter.

Reconciliation will be performed manually through the web app. This app has grown out of need due to delayed transactions for Kiwibank credit cards, and offers a way for transactions to be noted while Kiwibank groans and creaks and eventually shows credit card transactions on their website.

Intention is for the app to be configuration based, with environment variables setting your PocketSmith Developer Key, what transaction_account_id to add transactions too, and probably other things over time. Preference will be for users of this app to be confident enough to update IDs in environment variables, instead of using API calls to maintain or retrieve data / IDs.

The app will be easy to access without passwords needing to be remembered. Long 30-character URLs deployed on Heroku would be recommended as a method of secure deployment initially. The idea is that the link is shared privately and is kept private between only people who require access. It's a balancing act, caveat emptor!

## Required config variables

In dev, load these into a `secrets.yml` file. On Heroku, add these under your app's Settings page, under "Config Variables".

- `pocketsmith_developer_key`: your PocketSmith Developer Key, used for authorisation.
- `pocketsmith_transaction_account_id`: the transaction account ID that you want to create transactions for.
- `pocketsmith_default_merchant`: the payee name / merchant that will be used when none is entered in the form (e.g. "Enter payee here").