# Nomad
[![CodeClimate](https://codeclimate.com/github/asm-products/nomad/badges/gpa.svg)](https://codeclimate.com/github/asm-products/nomad)
[![Coverage Status](https://img.shields.io/coveralls/asm-products/nomad.svg)](https://coveralls.io/r/asm-products/nomad)
[![Build Status](https://travis-ci.org/asm-products/nomad.svg?branch=master)](https://travis-ci.org/asm-products/nomad)

This is a product being built by the Assembly community. You can help push this idea forward by visiting [https://assembly.com/nomad](https://assembly.com/nomad).

## Installing

This is the Nomad's web API repository, if you are looking for the mobile apps you should go to the [iOS](https://github.com/asm-products/nomad-ios) or [Android](https://github.com/asm-products/nomad-android) repositories.

This tutorial is based on a MacOS installation, but it should work on Linux and Windows as well. You can go to [Nomad chat](https://assembly.com/chat/nomad) if you need any help to setup your machine.

We recommend using [Docker](https://www.docker.com/) and [Fig](http://www.fig.sh/index.html) to setup your development environment.

### Docker

Docker is a lightweight solution to isolate the application's dependencies while running on the development environment. It means that it doesn't matter if you are a Mac, Linux or Windows user, everybody can easily run Nomad on their own machines and contribute.

In order to install Docker, follow [this tutorial](https://docs.docker.com/installation/) and come back here for the next step.

At some point, Docker installation guide will ask you to run ```docker run hello-world``` inside a Docker terminal. After doing it Docker will say something like:

```
To connect the Docker client to the Docker daemon, please set:
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/nicolasiensen/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
```

Don't skip this step, it'll be important later.

### Fig

Fig allows you to describe the application dependencies, and with a simple ```fig up``` it builds, on top of Docker, your environment on an isolated virtual machine.

Follow [this tutorial](http://www.fig.sh/install.html) to get Fig installed, once it's done you can run ```fig up``` and all the black magic will start. I advise you to grab a cup of coffee now cause it could take a long time, but don't close this page, we are not done yet.

If everything goes right you will end up with a Docker virtual machine running a web and a database processes (WEBrick and PostgreSQL).

Open a new terminal tab and type ```boot2docker ip```. In my case I got ```192.168.59.103```, so if I enter ```http://192.168.59.103:3000/``` in the browser it'll load the Nomad with errors.

The next step is to create the database. You will need to copy the sample database.yml file; in the project root directory, run ```cp config/database.sample.yml config/database.yml```. In the same terminal run ```fig run web rake db:create``` followed by ```fig run web rake db:migrate```.

Now reload your browser and you should be presented with the default Rails index page, it means that you have everything up and running.

## API Documentation

### Methods

#### Search

Returns all places in the given area ordered by distance.

```
/api/v1/places/search/:radius/:lat/:lng.json
```

* ```radius```: integer representing how much meters to cover
* ```lat```: float number for latitude
* ```lng```: float number for longitude

Example: https://asm-nomad-staging.herokuapp.com/api/v1/places/search/1000/-23.0045582/-43.324637.json

## How Assembly Works

Assembly products are like open-source and made with contributions from the community. Assembly handles the boring stuff like hosting, support, financing, legal, etc. Once the product launches we collect the revenue and split the profits amongst the contributors.

Visit [https://assembly.com](https://assembly.com) to learn more.
