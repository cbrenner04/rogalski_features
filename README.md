# Rogalski Features

This test suite is to test
[Communication Bridge](https://github.com/cbitstech/rogalski).

You will need the above repo, cloned and up-to-date locally. Within that
directory, switch to the gemset used in this suite:

```
rvm use 2.3.0@selenium48
```

Within the `rogalski_features` directory, start the app:

```
rake load_app_local
```

In another terminal window,  within this directory, run suite:

```
rspec
```
