# Storage

There is no single storage or database solution to solve all usecases when talking about monetary data.

This project separate approach to data persistence with two tiers of storage.

[Primary storage](primary.md) being suitable for 2 of core services uses file system specifically inodes meta-data space of file system.

[Secondary storage](secondary.md) on other hand is part of data-warehouse usecase using postgre database and is suitable for corellation non atomic search usecases.
