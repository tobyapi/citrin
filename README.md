# citrin

Citrin is a continuous benchmark server for a project in crystal-lang.

## Installation

```
git clone https://github.com/TobiasGSmollett/citrin
```

### Required
docker-ce

## Usage

Add this to /etc/default/docker:

```
DOCKER_OPTS="--dns 8.8.8.8 --dns 8.8.4.4"
```

And start the docker daemon:

```
sudo service docker start
```

Set up the webhook on Github to http://localhost:3000/push
and run following command:

```
cd citrin
crystal deps
crystal src/citrin.cr
```

## Development

TODO: Write development instructions here

## Contributing

1. Fork it ( https://github.com/TobiasGSmollett/citrin/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [TobiasGSmollett](https://github.com/TobiasGSmollett) tobias - creator, maintainer
