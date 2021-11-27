# Ledger

Before we dive into the technical details, let's discuss what a Ledger is and why it is needed?

In value transfer betteween entities A and B (under tenancy T) there needs to be mechanism that orchestrates the transfer.

This mechanism does not hold the value, it validates it, orchestrates it and finalises it. Every value transfer has its unique identifier within linear history, this history can be replayed from beggining and SHOULD result in same transfers if all the participants of those transfers are in the same states as they were in that time.

In short ledger:
- validates transfer
- negotiates transfer with [vaults](vault.md)
- owns concept of transfer of value
- has unique id
- uses primary storage for persistence

## Value transfer capabilities

> TBD

## Usecase capabilities

> TBD

## Persistence

> TBD

## Multitenancy

> TBD

## APIs

> TBD