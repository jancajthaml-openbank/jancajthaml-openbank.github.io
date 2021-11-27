# Data Warehouse

Before we dive into the technical details, let's discuss what a Data Warehouse service is and what purpose does it serve?

Core services do not allow analytics or searching functionalities. Data Warehouse is a example of how to transform raw primary data into indexed secondary data that could be searched.

In short data warehouse:
- usecase example
- single node graphql service
- search and analytical service

## Value transfer capabilities

This service has no inherent value in context of core problem but is a proof that you can build your usual usecases based on core foundation.

## Usecase capabilities

Allows to answer question posted to data like "what was the balance and 4th of July for given account" or "give me all transactions from which given account was credited" any any others that schema allows.

## Persistence

Data Warehouse uses PostgreSQL secondary persistence mirroring primary persistence into something searchable with eventual consistency.

## Multitenancy

Data warehouse sees all tenants, tenancy is just one of available filters.

## APIs

exposes GraphQL API with following schema

### Scalars

`BigDecimal` represents signed fractional values with arbitrary precision.

`DateTime` represents date and time in yyyy-mm-ddThh:mm:ss format

`NaturalNumber` represents integer including zero

`Status` represents transaction status one of queued, committed or rollbacked

### Types

Virtual Account
```graphql
type account {
  tenant: tenant
  name: String!
  format: String!
  currency: String!
  balance: BigDecimal!
}
```


A Tenant
```graphql
type tenant {
  name: String!
}
```

Single transfer from Virtual Account A to Virtual Account B
```graphql
type transfer {
  tenant: tenant
  transaction: String!
  transfer: String!
  status: Status!
  credit: account
  debit: account
  currency: String!
  amount: BigDecimal!
  valueDate: DateTime!
}
```

### Queries

```graphql
tenant(
	tenant: String!
): tenant

tenants(
	limit: NaturalNumber!,
	offset: NaturalNumber!
): [tenant!]!

account(
	tenant: String!,
	name: String!
): account
 
accounts(
	tenant: String!,
	currency: String,
	format: String,
	limit: NaturalNumber!,
	offset: NaturalNumber!
): [account!]!

transfers(
	tenant: String!,
	currency: String,
	status: Status,
	amount_lt: BigDecimal,
	amount_lte: BigDecimal,
	amount_gt: BigDecimal,
	amount_gte: BigDecimal,
	valueDate_lt: DateTime,
	valueDate_lte: DateTime,
	valueDate_gt: DateTime,
	valueDate_gte: DateTime,
	limit: NaturalNumber!,
	offset: NaturalNumber!
): [transfer!]!
```

there are no mutations implemented, to mutate data one must use REST APIs of [vault](../services-core/vault.md) or [ledger](../services-core/ledger.md).
