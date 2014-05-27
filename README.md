# lbstats cookbook
[![Build Status](https://travis-ci.org/szelcsanyi/chef-lbstats.svg?branch=master)](https://travis-ci.org/szelcsanyi/chef-lbstats)

## Description

Configures [Loadbalancer statistics daemon](https://github.com/szelcsanyi/lbstats) via Opscode Chef

## Supported Platforms

* Ubuntu
* Debian

## Recipes

* `lbstats` - Basic configuration.
* `lbstats::monitor` - The monitor part of the daemon. Use this on the central node where data comes to.
* `lbstats:collector` - The collector part of the daemon. Use this on the edge nodes where data comes from.

## Usage

Include the **monitor** or the **collector** recipe in the run list of the desired node. Set the attributes in the attributes file.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

* Freely distributable and licensed under the [MIT license](http://szelcsanyi.mit-license.org/2014/license.html).
* Copyright (c) 2014 Gabor Szelcsanyi
