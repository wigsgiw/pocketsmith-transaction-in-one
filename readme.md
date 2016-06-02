# PocketSmith Transaction-in-One

The general idea behind this little Sinatra app is to let you quickly enter manual transactions, into a nominated PocketSmith transaction account. Merchant is optional - all you need to enter is an amount if that's all you want to enter.

Reconciliation will be performed manually through the web app. This app has grown out of need due to delayed transactions for Kiwibank credit cards, and offers a way for transactions to be noted while Kiwibank groans and creaks and eventually shows credit card transactions on their website.

The app is configuration based, and environment variables are used to set your PocketSmith Developer Key and so on. Preference is for things to be done via these stored variables, instead of complicating the app with the logic required around fetching and maintining data caches.

The app will be easy to access - no passwords to be remembered. Choosing long password-like 30-character URLs when deployed on Heroku would be recommended as a method of secure deployment initially. The idea is that the link is kept private between only people who require access. It's a balancing act, so **caveat emptor**!

## Required config variables

In dev, load these into a `secrets.yml` file.

If you deploy to Heroku, add these under your app's Settings page, under "Config Variables".

- `pocketsmith_developer_key`: your PocketSmith Developer Key, used for authorisation.
- `pocketsmith_transaction_account_id`: the transaction account ID that you want to create transactions for.
- `pocketsmith_default_merchant`: the payee name / merchant that will be used when none is entered in the form (e.g. "Enter payee here").

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

## What about adding to multiple accounts?

The best option for the moment would be to deploy another copy of the app, with a different `pocketsmith_transaction_account_id` configured. Then add both URLs as bookmarks or onto your homescreen, and open the relevant bookmark for the account you want to add transactions to.
