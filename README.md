# AI4Industry: JaCaMo starter project

This project is a template to start your own [JaCaMo](https://github.com/jacamo-lang/jacamo) project using Gradle.

## Prerequisites

- JDK 8+

## Getting started

Clone your project

## Start to hack

To use version control for your project, you should first remove the currently tracked repository (this repository) and add instead an empty `git` repository you own.

1. Remove the current remote: `git remote remove origin`

2. Create an empty `git` repository (hosted somewhere).

3. Add your new repository as remote: `git remote add origin YOUR_REPOSITORY`

4. Push and track your branches, e.g.: `git push -u origin master`

5. Run `./gradlew`

## Content and structure of the project folder

The project folder contains:

1. A `LinkedDataFuSpider` artifact in `src/env`, artifact offering the possibility to agents to `crawl` the Knowledge Graph from a starting point. All agents focusing on this artifact will get the result of the crawl as beliefs.
Agents can also send individual HTTP GET and PUT requests via the actions `get` (which updates the belief base) and `put` (which takes a list of RDF triples as argument).

4. The agent `ts1.asl` (in `src/agt`) is provided as a starting point for writing your code.

5. A set of Prolog rules (`src/agt/inc/owl-signature.asl`) that can be included in the agents' program to facilitate the handling of RDF triples in Jason.

6. The `bold_jacamo.jcm` which is the file to be used and configured to launch the multi-agent system (It is used by gradle for the execution). Each time you create a new agent, you need to add it in this file as well as definition of initial beliefs.

8. The Linked Data program `get.n3` that crawl the knowledge graph.

## Acknowledgement

Parts of this template were first elaborated for the [ai4industry summer school](https://ci.mines-stetienne.fr/ai4industry/), held in July 2020.
