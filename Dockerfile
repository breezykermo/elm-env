FROM haskell:7.10
RUN mkdir /Elm-Package
WORKDIR /Elm-Package
RUN apt-get update && \
    apt-get -y install wget && \
    apt-get -y install git
ADD BuildFromSource.hs /Elm-Package
RUN runhaskell BuildFromSource.hs 0.18
RUN export PATH=$PATH:/Elm-Package/Elm-Platform/0.18/.cabal-sandbox/bin
CMD bash