# About my utility project _pocket-tpcds_
## Generalities
I needed the very interesting tpc-ds [dataset](https://www.tpc.org/) in order to have a reasonably big BI dataset
for learning advanced PostgerSQL queries. While the set of tables is synthetic it resembles a real business.
It has inventory, sales andreturns among others. I am on MacOS for now and I desperately needed something.
While the [original one](https://www.tpc.org/tpcds/) is not MacOS compatible there is one port by Databricks of V2 
that they use internally for benchmarking [databrics port](https://github.com/databricks/tpcds-kit). Indeed the tables
are a good fit for Hadoop and SparkSQL manipulation in analogous manner to a PostgreSQL.
This project sets up a docker container for PostgreSQL to be populated with tpc-ds tables in a schema through Flyway.
This is the first part of the contribution. The second is some Groovy script to put the generated data to the tables.
While the process is easy with these contributions it was very slow in MacOS because of docker.

and comes with a __caveat__ which is negligible:

The dbgen_version commandline field __has been changed to be nullable__ because of uniformity and because the generation of
the dataset without any arguments maps to a null entry.

The flyway scripts (or even the DB) can be used as a starting point for Apache Spark adventurers too. 
Nothing though is more reliable than the [official documentation](https://www.tpc.org/tpc_documents_current_versions/pdf/tpc-ds_v2.1.0.pdf). 

## Installation
Needless to say that you can use a real postgreSQL and not necessarily the docker one. 
If you opt for docker, you need some sort of docker installation (not tested with podman) and Java 11+.
It is a gradle project and it has been tested with Gradle 7.4.1.

## Usage
Checkout the git repo.
As it is a gradle project everything is done with gradle. We use the 
[docker gradle plugin](https://github.com/palantir/gradle-docker) from Palantir.

The docker image lifecycle is managed as

```sh
gradle dockerRun
gradle dockerStop
gradle dockerRemoveContainer
```

You can use [Flyway gradle plugin](https://flywaydb.org/documentation/usage/gradle/) to manage the lifecycle

```sh
gradle flywayClean
gradle flywayMigrate
```

After you compile the tpcds toolkit (the os dependent part), just run 

```sh
./dsdgen
```

and a lot of (1GB in total) tables in `.dat` pipe separated format is generated. 

If you already have the artefacts, the rest is OS agnostic.

Please move your generated artefacts in
[here](src/main/resources/dataset).

In order to populate, feel free to run the populating script:

```sh
gradle run
```

The process for me was time consuming.

## Acknowledgement
The Configslurper trick is inspoired from here
[ConfigSlurper from properties](https://touk.pl/blog/2015/09/20/easy-configuration-usage-with-configslurper/)