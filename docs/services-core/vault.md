# Vault

Before we dive into the technical details, let's discuss what a Vault is and why it is needed?

In value transfer betteween entities A and B (under tenancy T) there needs to be entities A and B to have a value.

These entities do not transfer the value, they hold it, and can participate in transfership of that value. Every balance change has its unique identifier within linear history, this history can be replayed from beggining and MUST result in same final and intermediate balance, the ordering of balance changes is stable and every change is atomic in terms of walking on directed graph.

In short vault:
- is finite state machine
- owns concept of balance
- accepts or rejects change of balance requested via [ledger](ledger.md)
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