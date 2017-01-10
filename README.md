## Elm Env

Elm-Env dockerizes an Elm environment, built from source inside the container. This is useful to not have to struggle through all of Haskell and Cabal's installation/environment difficulties on your local, and it also allows you to run (and play with) the Elm source code in an isolated process.

The docker image is available on Docker Hub:
`docker run -it breezykermo/elm-env`

## Using Elm Env for Development
Elm Env was developed in order to facilitate modifying the Elm codebases to create your own custom builds of it. To set up a productive development environment, you'll want to map the source files in the Docker container to your local as volumes, so that you can edit them through a text editor (unless, of course, your preferred text editor is [nano](https://en.wikipedia.org/wiki/GNU_nano)).

To do this, copy the files from inside a running _elm-env_ container to this directory, as *src*:
`docker cp $(CONTAINER_ID):/Elm-Package/Elm-Platform . && mv Elm-Platform src`
replacing `$(CONTAINER_ID)` with your _elm-env_ instance's container ID.

You can then run _elm-env_ with these files as volumes easily through the [Docker-Compose](https://docs.docker.com/compose/) file provided:
`docker-compose run --rm elm-env`

Once the container is stopped, it can be restarted through the same docker-compose command above, or directly through docker with:
`docker start -i $(CONTAINER_ID)`

#### Configuring source repos
You can easily build custom Docker images with your own forks of the various Elm codebases, by modifying [BuildFromSource.hs](./BuildFromSource.hs). 
