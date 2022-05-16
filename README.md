# Twitter.jl

A Julia package for interacting with the Twitter API.

Linux: [![Build Status](https://travis-ci.org/randyzwitch/Twitter.jl.png)](https://travis-ci.org/randyzwitch/Twitter.jl)
<br/>

CodeCov: [![codecov](https://codecov.io/gh/randyzwitch/Twitter.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/randyzwitch/Twitter.jl)


Twitter.jl is a Julia package to work with the Twitter API v1.1. Currently, only the REST API methods are supported; streaming API endpoints aren't implemented at this time.

All functions have required arguments for those parameters required by Twitter and an `options` keyword argument to provide a `Dict{String, String}` of optional parameters [Twitter API documentation](https://developer.twitter.com/en/docs/twitter-api/v1). Most function calls will return either a `Dict` or an `Array <: TwitterType`. Bad requests will return the response code from the API (`403`, `404`, etc).

DataFrame methods are defined for functions returning composite types: `Tweets`, `Places`, `Lists`, and `Users`.

## Authentication

Before one can make use of this package, you must create an application on the [Twitter's Developer Platform](https://dev.twitter.com).

Once your application is approved, you can access your dashboard/portal to grab your authentication credentials from the "Details" tab of the application.

## Installation

To install this package, enter `]` on the REPL to bring up Julia's package manager. Then add the package:

```julia
julia> ]
(v1.7) pkg> add Twitter
```
*Tip: Press `Ctrl+C` to return to the `julia>` prompt.*
## Usage

To run Twitter.jl, enter the following command in your Julia REPL

```julia
julia> using Twitter
```

Then the a global variable has to be declared with the `twitterauth` function. This function holds the `consumer_key`, `consumer_secret`, `oauth_token`, and `oauth_secret` respectively.

```julia
twitterauth("6nOtpXmf...",
            "sES5Zlj096S...",
            "98689850-Hj...",
            "UroqCVpWKIt...")
```
* Ensure you put your credentials in an env file to avoid pushing your secrets to the public 🙀.

*Note: This package does not currently support OAuth authentication.*

## Code examples

See [runtests.jl](https://github.com/randyzwitch/Twitter.jl/blob/master/test/runtests.jl) for example function calls.

### Want to contribute? 

Contributions are welcome! Kindly refer to the [contribution guidelines](CONTRIBUTING.md).