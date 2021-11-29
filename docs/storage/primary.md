# Primary Storage

Primary persistence is realised via nix inodes based filesystem.

Inodes metadata space is used instead of contets to reduce number of operations needed to be done in FS by half while not needed filedescriptor to be opened for reading or writing, the mere existance of file descriptor gives us most of the information that we need, reducing the blocking period.

All primary storage operations are blocking and locking using respective file descriptor flags.

Storage is not mirrored into memory, files are partitioned in such a way that each state transition of [vault](../services-core/vault.md) and worfklow operation of [ledger](../services-core/ledger.md) maps to fully qualified filename.

There are some data stored in files in either plainext or encrypted for but the content actual is TEXT based not BINARY.

## Encryption

When using encryption, all contents of files are encrypted using a master key that is a random 2048 bytes generated at installation time using a urandom source.

Inode data are never encrypted.

## Vault storage shape

### General storage shape

- Tenant A `/t_A`
- Account B of Tenant A `/t_A/account/B`
- Snapshot version 3 of Account B of Tenant A `/t_A/account/B/snaphost/0000000003`
- Events of Account B of Tenant A starting from Snapshot version 3 `/t_A/account/B/events/0000000003`

### Events and Snapshots

Each account persists its events under `/t_{tenant}/account/{account}/events/{version}` namespace upto maximum number of event per snapshot configured.

When this number is reached, consolidation of balances at terminal state with list or request IDs in non-terminal states is written into next version of snapshot incrementing current version by one. All followup event are then peristed into tat new namespace.

When vault unit starts it hydrates its intermediate state from latest snapshot and followup event data.

All events are write exclusive, event files do not have a content.

Snapshot content follows given schema

```
???
```

### State transition

There are three events that vault is aware of

- `0` promise as a starting state
- `1` commit as a successful terminal state 
- `2` rollback as a unsuccessful terminal state 

If Account A of Tenant T with Snapshot version 1 promises to give or reveive value V based on the request R the following event is persisted

`/t_T/account/A/events/0000000001/0_V_R`

If Account A of Tenant T with Snapshot version 1 commits transfer of value V based on the request R the following event is persisted

`/t_T/account/A/events/0000000001/1_V_R`

If Account A of Tenant T with Snapshot version 1 rollbacks transfer of value V based on the request R the following event is persisted

`/t_T/account/A/events/0000000001/2_V_R`

## Ledger storage shape

> TBD