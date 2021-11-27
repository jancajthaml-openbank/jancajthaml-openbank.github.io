# Bank Connectors

Before we dive into the technical details, let's discuss what a Bank connection is and what purpose does it serve?

Bank Connector allows to transform transactions done in external system (standard bank core, crypto bank core or any other proprietary variant) into value transfer usecase, creating internal mirror with normalized data allowing to make use of those data with anything built on top of this bank core.

In short bank connector is:
- usecase example
- mirror of value transfers being done in other system
- synchronizes and normalizes data
- creates transactions and accounts automatically

## Value transfer capabilities

If someone wants to run analytics or just want to simulate what would happen if some transactions were to be made and the originator of that data is closed source or does not allow for such usecases, data will be imported and transformed to represent their intent into value transfers and value owners.

There are currently two examples of bank connectors fio-bco representing value transfers on checking account at FIO Banka a.s. and bondster-bco representing representing value transfers on primary and secondary market with loans, mortgages and other investments providing visibility into profitability of each segments.

Additional not yet existing usecase could be inflation forecast with currency arbitrage if you can imagine inflation being "value taken" and exchanges rates being "value multiplier if value given" you could create millions of transfers exploring all the possible problem spaces with 95th percentile confidence on currency shorting or general arbitrage.

## Usecase capabilities

This service creates accounts and wires transaction automatically to mirror whatever is happening in external system, it will not allow to mirror data that violate the basic principle of value transfer. Account names or transfer ids may or might not be mirrors of ids and names in external data originator, it depends on usecase, intent and system itself.

Having data normalized and having foundational system fast and consistent allows one to imagine any usecase and write any transformation connector if one can define what is "value" and what is "transfer" in that given usecase. It doesn't need to be money at all, it could be for example organic search and site profitability index if value is defined as page view and refferer is defined as creditor and there is decay in form of hourly debetor eating away each "page" balance and "current balance" for given page would be its organic searchability index while "balance at time x or bewteen times x and y" would answer the question of campain's ROI.

## Persistence

uses primary persistence for access management, these data are encrypted.

## Multitenancy

Each tenant existing will use same tenant of [ledger](../services-core/ledger.md) and [vault](../services-core/vault.md) effectivelly encapsulating mirror tenancy, it does not allow cross-perimeter or cross-tenant transactions in given implementations, but there is nothing forbitting this to be enabled if implemented in such a way, core services allow these usecases.

## APIs

Exposes REST API for token management, how the token is created and how it is used depends on each connector, enables to create or delete tenant from REST API.
