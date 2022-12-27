# README

This application monitors and ensure that server application logic runs any time that certain data in the database changes, even if the change was directly made to the database.

It also runs the same job as part of the Invoice model total field value update.

We are using the Stored procedure and `activerecord-postgres_pub_sub` gem to listen to any changes to the invoice table and trigger a notification whenever there is an update.

Rails code after initialization listens to a channel of Postgress for any updates. Whenever it receives any update it triggers the background job to make the Sync.

Steps to set the Stored procedure.
1. Open the postgress console
2. Execute the stored procedure here.
3. Now Try updating the total column Update invoices set total = 17 where id = 1;
4. In the development.log you can see the logs

Stored procedure's path: public/stored_procedure.txt

* ...
# datamonitor
