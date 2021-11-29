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

## Transactions

Transactions are used to update [vault](vault.md) balances. Ledger is updated by transaction that is recorded in ledger history after the transaction is accepted by all vault included in that transaction. Transactions can be initiated by ledger itself or by another entity.

Transactions are validated by both ledger unit and respective vault units. Every transaction is validated against entity structure (which is defined by vault). If the transaction is valid, negotiation with vaults by each vault promising to accept or give value on their side, if the negotiation is sucessful transaction is committed, otherwise it is rollbacked. If transaction fails in validation or before promising stage is initiated transaction is rejected.

Transactions can be initiated by ledger or by another entity.
- ledger realise a transaction if vaults can balance out the transaction, i.e. balance of affected vaults is sufficient to cover the transaction
- there does not need to be corelation between vault tenancy and ledger tenanct

Every transaction is validated by ledger itself and the ledger updates and maintains its own history.

## Transfer

Transfer is single value transfership between vault A and vault B. Transfers have a unique identifier in context under transaction partition.

All transfers are verified by a number of vault to confirm that the transfer is valid and realisable. Each vault holding part of the balance involved in the transfer. Vaults are identified by their unique identifier.

Transfer is balance changing operation on vault unit. Vault updates its current balances after validation of transfer. If all transfers in transaction are valid, transaction is committed. If any transfer is invalid, whole transaction is rollbacked if there were already some promises, producing auditable event of intent on ledger part, otherwise transaction in rejected.

Transfer is initiated by a ledger rest realised by ledger unit.

# Ledger Units

- is by tenant partitioned unit that contains ledger.
- has its unique identifier.
- has primary storage that is used by ledger to store its state.
- is stateless
- sprays workers to realise the transaction workflow.
- communicate with vaults in order to realise transfer of value.
- participate in transactions, they validate them and if they are valid, they negotiate them with vaults.
- are managed by ledger rest.

# Ledger Rest

Ledger rest is the application that manages ledger units and exposes REST API. Ledger rest is stateless.
