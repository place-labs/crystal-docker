# crystal-docker

Docker Engine API wrapper. Provides typed interaction with the [Docker Engine API](https://docs.docker.com/engine/api/latest/).

Client structure has been designed to mirror API provided by the [official python SDK](https://docker-py.readthedocs.io/en/stable/client.html).

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     crystal-docker:
       github: aca-labs/crystal-docker
   ```

2. Run `shards install`

## Usage

```crystal
require "crystal-docker"
```

TODO: Write usage instructions here

## Contributing

1. Fork it (<https://github.com/aca-labs/crystal-docker/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Kim Burgess](https://github.com/kimburgess) - creator and maintainer
- [Jerome Gravel-Niquet](https://github.com/jeromegn) - `HTTP::Client` and `OpenSSL` extensions from the original [docker.cr lib](https://github.com/jeromegn/docker.cr)
