# Vault

Before we dive into the technical details, let's discuss what a Vault is and why it is needed?

In value transfer between entities A and B (under tenancy T) there needs to be entities A and B to have a value.

These entities do not transfer the value, they hold it, and can participate in transfer of that value. Every balance change has its unique identifier within linear history, this history can be replayed from beginning and MUST result in same final and intermediate balance, the ordering of balance changes is stable and every change is atomic in terms of walking on directed graph.

In short vault:
- is finite state machine
- owns concept of balance
- accepts or rejects change of balance requested via [ledger](ledger.md)
- has unique id
- uses primary storage for persistence

## Value transfer capabilities

In order to be able to transfer value between two parties, an entity needs to have capabilities to:
- transfer from itself to itself
- transfer from itself to another entity
- transfer from another entity to itself

Vault is in charge of:
- defining and maintaining entities in tenancy
- defining and maintaining capabilities
- validating requests for changes of balance
- accepting valid requests
- rejecting invalid requests
- replaying history
- finalising non terminal states of self

## Vault Units

Vault units are first level abstraction, they are identified by their unique identifier, these identifiers are assigned by vault during entity creation. Units can be identified by their unique identifier but are first class objects in the sense that they can be used as first class objects in ledger transfer process.

- vault unit has a unique identifier
- vault unit has a history of changes
- vault unit is append-only

## Vault Rest

Vault rest is the application that manages vault units and exposes REST API. Vault rest is stateless.