# Initial Php Package

## Provided make setup
To make the development experience easier, there is a makefile provided. <br>
Run `make help` to see the available commands.

### Docker
The make commands will use the docker composer setup by default, if you want to use your local php and composer installations,
you can add `USE_DOCKER=false` after your make commands to achieve that.

If you don't want to type out `USE_DOCKER=false` everytime, you can also provide a .env file in the root of the repository, and set the variable there.

#### `docker compose` vs `docker-compose`
The make commands will use `docker compose` by default. If your system uses `docker-compose`, this can also be used instead.
You can add `DOCKER_COMPOSE=docker-compose` after your make commands to achieve that, or set that variable in the .env file. 