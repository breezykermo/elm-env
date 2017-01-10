## Elm Env

Elm Env provides an easy way to run an Elm environment from its Haskell source, inside a Docker container. Cabal can be difficult to get installed, especially because certain versions of Elm require different Haskell versions. [Elm-platform](https://github.com/elm-lang/elm-platform) provides a useful way to install different versions of Elm from source. However, if you just want to tinker with the source code for a bit of Friday fun, and don't want it to mess with the current version/installation of Elm on your computer, elm-env is for you!

### Easy Install
Provided you already have [Docker](https://docs.docker.com/engine/installation/) installed, all you need to do is run:
`docker run -it breezykermo/elm-env`
After docker has fetched the image from Docker Hub, your container should start and you will be inside a Linux bash shell in a Docker container, with the Elm environment 0.18 code in the `Elm-Package` directory.

### Using other versions of Elm
To install other versions of Elm, run the `BuildFromSource.hs` script provided:
`runhaskell BuildFromSource.hs <version-no>`
where `<version-no>` is the version you want to install. The script will complain if you try with a version that doesn't exist.

## Using Elm Env for Development
Unless your preferred text editor is [nano](https://en.wikipedia.org/wiki/GNU_nano), you'll want to map the source files in the Docker container to your local as volumes, so that you can view and edit them through a different text editor.

To do this, copy the files from inside a running _elm-env_ container to an outer directory, as *src*:
`docker cp $(CONTAINER_ID):/Elm-Package/Elm-Platform . && mv Elm-Platform src`
replacing `$(CONTAINER_ID)` with your _elm-env_ instance's container ID.

If you have [Docker Compose](https://docs.docker.com/compose/install/), You can then run _elm-env_ with these files as volumes easily through the [Docker-Compose](https://docs.docker.com/compose/) file provided:
`docker-compose run --rm elm-env`

Alternatively, you can run the container with the `src` directory as a volume directly through this command:
`docker start -i -v src:/Elm-Package/Elm-Platform $(CONTAINER_ID)`

#### Installing Elm versions from custom source repos
You can easily build custom Docker images with your own forks of the various Elm codebases, by modifying [BuildFromSource.hs](./BuildFromSource.hs). The [Dockerfile](./Dockerfile) simply runs the [BuildFromSource.hs](./BuildFromSource.hs) script and puts what is generated in an image.
