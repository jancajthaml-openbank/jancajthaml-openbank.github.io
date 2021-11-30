# REST

The best way to understand how REST works is by thinking on a RESTful Web Service. The Web Service will expose its functionality through HTTP methods (GET, POST, PUT, DELETE) that can be used by the client to perform requests.

RESTful service is defined by resource that it wants to expose, that resource defines the URL that you will use to access the resource, and the HTTP methods that will be used to perform requests.

## Manage tenancy

### Get Tenant IDs

Request:

```
GET /tenant
```

Response:

```json
200 OK
[
	"tenant-id"
]
```

### Create Tenant

Request:

```
POST /tenant/{tenant-id}
````

Response:

```json
200 OK
```

### Delete Tenant

Request:

```
DELETE /tenant/{tenant-id}
```

Response:

```json
200 OK
```

## Account Usecase

### Get Account IDs

Request:

```
GET /account/{tenant-id}
```

Response:

```json
200 OK
[
	"account-id"
]
```

### Get Account State

Request:

```
GET /account/:tenant-id/:account-id
```

Response:

```json
200 OK
{
	"format": "account-format",
    "currency": "account-currency",
    "balance": "0.0",
    "blocking": "0.0",
    "isBalanceCheck": false
}
```

### Create Account



```json
POST /account/:tenant-id
{
	"name": "account-id",
	"format": "account-format",
	"currency": "account-currency",
	"isBalanceCheck": true
}
```

## Transaction Usecases

### Get Transaction IDs

Request:

```
GET /transaction/:tenant-id
```

Response:

```json
200 OK
[
	"transaction-id"
]
```

### Create Transaction

```json
POST /transaction/:tenant-id
{
    "transfers": [
      {
        "credit": {
          "tenant": "credit-tenant",
          "name": "credit-account"
        },
        "debit": {
          "tenant": "debit-tenant",
          "name": "debit-account"
        },
        "amount": "1",
        "currency": "transfer-currency"
      }
    ]
}
```

Response:

```json
200 OK
transaction-id
```

### Get Transaction State

```json
GET /transaction/:tenant-id/:transaction-id
```

Response:

```json
200 OK
{
    "id": "transaction-id",
    "status": "committed",
    "transfers": [
      {
        "id": "transfer-id",
        "valueDate": "2015-03-04T17:08:22Z",
        "credit": {
          "tenant": "credit-tenant",
          "name": "credit-account"
        },
        "debit": {
          "tenant": "debit-tenant",
          "name": "debit-account"
        },
        "amount": "0.00000000000000000000000000000000000000000000000000000000001",
        "currency": "transfer-currency"
      }
    ]
}
```
