# PocketSmith Transaction-in-One

The general idea behind this little Sinatra app is to let you quickly enter manual transactions, into a nominated PocketSmith transaction account. The app grew out of a need to keep a record of transactions for accounts which have slow transaction update speeds. Merchant is optional - all you need to enter is an amount if that's all you want to enter. Reconciliation with real transactions will be performed manually through the web app.

The app is configuration based, and environment variables are used to set your PocketSmith Developer Key and so on. Preference is for things to be done via these stored variables, instead of complicating the app with fetching and maintaining data caches.

The app is easy to quickly access - no passwords to be remembered, save the web bookmark to your homescreen and you're good to go. Choosing long password-like 30-character URLs when deployed on Heroku would be recommended as a method of secure deployment initially. The idea is that the link is kept private between only people who require access. Ease of access versus security is a balancing act, so **caveat emptor**!

## Required config variables

In development, put these into a `secrets.yml` file in the main app directory.

If you deploy to Heroku, add these under your app's Settings page, under "Config Variables".

- `pocketsmith_developer_key`: your PocketSmith Developer Key, used for authorisation.
- `pocketsmith_transaction_account_id`: the transaction account ID that you want to create transactions for.
- `pocketsmith_default_payee`: the payee name / merchant that will be used when none is entered in the form (e.g. "Enter payee here").

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

## What about adding to multiple accounts?

The best option for the moment would be to deploy another copy of the app, with a different `pocketsmith_transaction_account_id` configured. Then add both URLs as bookmarks or onto your homescreen, and open the relevant bookmark for the account you want to add transactions to.
