# Initial Php Package

## Provided make setup
To make the development experience easier, there is a makefile provided. <br>
Run `make help` to see the available commands.

The make commands will use the docker composer setup by default, if you want to use your local php and composer installations,
you can add `USE_DOCKER=false` after your make commands to achieve that.

If you don't want to type out `USE_DOCKER=false` everytime, you can also provide a .env file in the root of the repository, and set the variable there.