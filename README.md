# Project Lazer
[![codecov](https://codecov.io/gh/GrayDragonSoftware/project-lazer-flutter/branch/master/graph/badge.svg)](https://codecov.io/gh/GrayDragonSoftware/project-lazer-flutter)

An android and ios application for controlling the project-lazer tripod.

## Getting Started

For help getting started with Flutter, view our online
[documentation](https://flutter.io/).

## Running Tests
Below are instructions for running tests and creating code coverage.
### Android Studio
TODO: Create documentation
### Creating Code Coverage
Code coverage for Project Lazer is performed through Codecov.

Until coverage is supported in Android Studio we have to manually create our coverage files and upload them.
#### Generating Coverage File
We can generate a coverage file by navigating to the project directory and executing the following flutter command.

`flutter test --coverage`

That will create a folder called `coverage` in the project directory containing a `lcov.info` file.

#### Uploading Coverage File
Codecov has many CI integrations that automatically find this file and upload it. 
However for offline use we use codecov's bash uploader after creating a commit. 
Additional information can be found[here](https://docs.codecov.io/docs/about-the-codecov-bash-uploader).
