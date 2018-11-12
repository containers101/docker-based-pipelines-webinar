# Welcome

So, you've decided to try Codefresh? Welcome on board!

Using this repository we'll help you get up to speed with basic functionality such as: *compiling*, *testing* and *building Docker images*.

This project uses `Node.js, Mongo` to build an application which will eventually become a distributable Docker image.

## Looking around

In the root of this repository you'll find a file named `codefresh.yml`, this is our [build descriptor](https://docs.codefresh.io/docs/what-is-the-codefresh-yaml) and it describes the different steps that comprise our process.
Let's quickly review the contents of this file:

### Compiling and testing

To compile and test our code we use Codefresh's [Freestyle step](https://docs.codefresh.io/docs/freestyle).

The Freestyle step basically let's you say "Hey, Codefresh! Here's a Docker image. Create a new container and run these commands for me, will ya?"

```
  unit_test:
    type: composition
    working_directory: ${{build_step}}
    composition:
      version: '2'
      services:
        mongo:
          image: mongo
    composition_candidates:
      test:
        image: ${{build_step}}
        links:
          - mongo
        command: bash -c "ls -l /src && /src/test-script.sh"
        environment:
          - MONGO_PORT=27017
```

The `image` field states which image should be used when creating the container (Similar to Travis CI's `language` or circleci`s `machine`).

### Building

To bake our application into a Docker image we use Codefresh's [Build step](https://docs.codefresh.io/docs/steps#section-build).

The Build is a simplified abstraction over the Docker build command.

```
  build_step:
    type: build
    image_name: codefreshio/example_nodejs_mongo
    dockerfile: Dockerfile
    tag: ${{CF_BRANCH}}
```

Use the `image_name` field to declare the name of the resulting image (don't forget to change the image owner name from `codefreshdemo` to your own!).

## Using This Example

To use this example:

* Fork this repository to your own [INSERT_SCM_SYSTEM (git, bitbucket)] account.
* Log in to Codefresh using your [INSERT_SCM_SYSTEM (git, bitbucket)] account.
* Click the `Add Repository` button.
* Select the forked repository.
* Select the `I have a Codefresh.yml file` option.
* Complete the wizard.
* Rejoice!