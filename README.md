# Twitter

Linux: [![Build Status](https://travis-ci.org/randyzwitch/Twitter.jl.png)](https://travis-ci.org/randyzwitch/Twitter.jl)
<br>
Windows: [![Build status](https://ci.appveyor.com/api/projects/status/09qykgs7l2fakcvh?svg=true)](https://ci.appveyor.com/project/randyzwitch/twitter-jl) <br>
CodeCov: [![codecov](https://codecov.io/gh/randyzwitch/Twitter.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/randyzwitch/Twitter.jl)

Twitter.jl is a Julia package to work with the Twitter API v1.1. Currently, only the REST API methods are supported; streaming API endpoints aren't implemented at this time.

## Twitter.jl API

All functions have required arguments for those parameters required by Twitter and an `options` keyword argument to provide a `Dict{String, String}` of optional parameters [Twitter API documentation](https://dev.twitter.com/docs/api/1.1). Most function calls will return either a `Dict` or an `Array <: TwitterType`. Bad requests will return the response code from the API (403, 404, etc.)

DataFrame methods are defined for functions returning composite types: `Tweets`, `Places`, `Lists`, and `Users`.

## Authentication

Authentication is accomplished by creating an application on [dev.twitter.com](https://dev.twitter.com). Once your application is setup, you can access your consumer_key, consumer_token, oauth_token and oauth_secret from the "Details" tab of the application.

```julia
Using Twitter

twitterauth("6nOtpXmf...",
            "sES5Zlj096S...",
            "98689850-Hj...",
            "UroqCVpWKIt...")
```

This package does not currently support OAuth authentication.

## Code examples

See [runtests.jl](https://github.com/randyzwitch/Twitter.jl/blob/master/test/runtests.jl) for example function calls.

## TODO

General:
- Incorporate cursoring for methods returning many pages of results (MOST IMPORTANT TO SOLVE)
- Clean up column types for DataFrame methods
- DataFrame methods for generic `Dict` responses
- Keyword arguments for returning DataFrame (to remove step in data retrieval process)
- Ability to save authentication keys to file, remove need for authentication each time
- Create detailed documentation
