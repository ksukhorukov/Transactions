# Number26 transactions api

You could find more details about the challange by reading  [CodeChallenge] [ChD] description

# Installation

``rvm use uby-2.1.5@transactions --create``

``bundle``

``rails -s``

# Testing transactions creation

``curl -v -H "Accept: application/json" -H "Content-type: application/json" -X PUT -d '{ "amount": 6000, "type": "cars" }' http://localhost:3000/transactionservice/transaction/1``

``curl -v -H "Accept: application/json" -H "Content-type: application/json" -X PUT -d '{ "amount": 7000, "type": "cars", "parent_id": 1 }' http://localhost:3000/transactionservice/transaction/2``

# Testing API interface

Getting all transactions for cars:

``GET http://localhost:3000/transactionservice/types/cars``

``[1, 2]``

Getting spendings summary of particular type:

``GET http://localhost:3000/transactionservice/sum/11``

``{ "sum": 19000.0 }``

Showing particular transaction:

``GET http://localhost:3000/transactionservice/transaction/11``

``{"amount":7000.0,"type":"cars","parent_id":2}``

# [EOF]

[ChD]: https://github.com/ksukhorukov/Transactions/blob/master/CodeChallenge.pdf
