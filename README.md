# Number26 transactions api

You could find more details about the challange by reading  [CodeChallenge] [ChD] description

# Installation

``rvm use ruby-2.1.5@transactions --create``

``bundle``

``rake db:setup``

``rake test``

``rails -s``

# Testing transactions creation

``curl -v -H "Accept: application/json" -H "Content-type: application/json" -X PUT -d '{ "amount": 6000, "type": "cars" }' http://localhost:3000/transactionservice/transaction/1``

``curl -v -H "Accept: application/json" -H "Content-type: application/json" -X PUT -d '{ "amount": 7000, "type": "cars", "parent_id": 1 }' http://localhost:3000/transactionservice/transaction/2``

# Testing API interface

Getting all transactions for cars:

``GET http://localhost:3000/transactionservice/types/cars``

``[1, 2]``

Getting spendings summary. A sum of all transactions that are transitively linked by their parent_id to transaction_id:

``GET http://localhost:3000/transactionservice/sum/2``

``{ "sum": 13000.0 }``

Showing particular transaction:

``GET http://localhost:3000/transactionservice/transaction/2``

``{"amount":7000.0,"type":"cars","parent_id":1}``

# [EOF]

[ChD]: https://github.com/ksukhorukov/Transactions/blob/master/CodeChallenge.pdf
