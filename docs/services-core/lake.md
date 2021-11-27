# Lake

Before we dive into the technical details, let's discuss what a Lake is and why it is needed?

In value transfer betteween entities A and B (under tenancy T) there needs to be mechanism for communication.

Because both [ledgers](ledger.md) and [vaults](vault.md) could come to existence or cease to exist in runtime and because we are in a distributed system there needs to be entity that relay's those requests, this relay also needs to be stichable to allow routing.

In short lake:
- transforms broadcast requests to entity queue
- transforms push requests to tenant broadcast
- enables indirect communication, blackboxing locality

## Value transfer capabilities

Lake is purely technical mechanism to allow other entities to communicate. It serves as a proxy for ZMTP messages and allows every entity that wants to communicate to connect instead of needing to bind. Eliminates necessity for service discovery (and possible topology state diverge).

There is always needs to be lake with two deterministic and configurable ports that entities can connect to.

## Usecase capabilities

Any number of [vaults](vault.md) with any number of [ledgers](ledger.md) can participate in value transfer without knowing of each other existence of locality upfront.

## Persistence

There is no persistence.

## Multitenancy

Tenancy is part of ZMTP protocol syntax and messages are partitioned by tenant by prefix.

## APIs

TCP bound ZMTP 3.0 api with NULL security mechanism exposing ZMQ PUSH and ZMQ SUB connections.