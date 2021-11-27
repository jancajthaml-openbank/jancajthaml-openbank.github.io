# Core Services

There are 3 core services needed to realise value transfer. 

- [Vault](vault.md) to have balance
- [Ledger](ledger.md) to transfer value
- [Lake](lake.md) to communicate

These services use ZMTP 3.0 protocol co communicate between each other both [vault](vault.md) and [ledger](ledger.md) expose REST APIs to manage their respective tenants and answer their capabilities usecases.

## Capabilities

### Vault

Can answer what is its balance at given time given the question tenant and identifier.
Can participate in transfer of value and is responsible with promissing, rejecting, commiting or rollbacking of that change.
Holds audit trail for all the balance changes that can be replayed.
Can create and destroy its tenants and identifiers via REST API.

### Ledger

Can execute transfer between any number of [vaults](vault.md).
Is itself bound to tenant that doesn't need to be any of tenants that [vaults](vault.md) are part of.
Provides workflow for transfer to be realised in transactional way.
Can create and destroy its tenants via REST API.

### Lake

Relays ZMTP messages and provides each entity with its ingress and egress FIFO mailboxes.
Eliminates needs for service discovery.