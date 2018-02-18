# PokePlan

Pokeplan is a tool that will help decentralized organizations reach consensus on estimating the value of bounties & tasks, before they are created. The assumption is that the people participating in these planning sessions each have one vote and that these people are also in some involved in the development of the tasks with roles such as developers, product managers, and QA engineers.

This Pokeplan tool is based on the agile Planning Poker tool. For the purpose of the hackathon, there will only be the ability to budget for one task per “session”, but in the future, multiple tasks can be budgeted for in a single session.

The plan is for this tool to eventually become an app integrated with Aragon.

## Requirements
* npm v9.4.0

## Setup

To install global package dependencies, run.

```
npm install
```

Running tests on all apps can be done running `npm run test` at the root directory. Running tests on an individual apps can be done by running `npm run test` inside the app directory.

By default, tests are run in a in-memory instance of testrpc.
