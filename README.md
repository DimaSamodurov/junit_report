# Junit Report

JunitReport helps visualising xml results produced by cucumber tests launched with JUnit formatter.

Using Bamboo CI tool and running cucumber with '--format junit' parameter i missed list of tests in the log as junit formater skips logging.
Workaround is to keep produced xml files as job artifacts and review each file.
This was inconvenient for QA as they check test availability and synchronize automated tests with manual test plan.
So i decided to implement simple reporting.

## Installation

Add to Gemfile

    gem git: 'git@github.com:DimaSamodurov/junit_report.git'

## Usage

* Generate report manually:

    rake junit_report:generate[test/samples/*.xml,test/samples/report.html]

* Generate report in Bamboo

    rake junit_report:generate[features/reports/*.xml,features/reports/report.html]

## How to test

    rake test

## Possible enhancements

* custom test results analysis, benchmark, stats, etc.