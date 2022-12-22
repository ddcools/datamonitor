# README
This application monitors and ensure that server application code runs any time that certain data in the database changes.
Even if the change was directly made to the database.

For this it runs a job to ensure that the invoice batch is updated.

In this, we are using a stored procedure and activerecord-postgres_pub_sub gem to listen to any changes to the invoice table and trigger a notification whenever there is an update.

Our application listens to a channel for any update and whenever it receives any update it triggers the background job.

Stores procedure's path: public/stored_procedure.txt

* ...
# datamonitor
