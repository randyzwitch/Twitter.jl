# Twitter

Linux: [![Build Status](https://travis-ci.org/randyzwitch/Twitter.jl.png)](https://travis-ci.org/randyzwitch/Twitter.jl)
<br>
CodeCov: [![codecov](https://codecov.io/gh/randyzwitch/Twitter.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/randyzwitch/Twitter.jl)

Twitter.jl is a Julia package to work with the Twitter API v1.1. Currently, only the REST API methods are supported; streaming API endpoints aren't implemented at this time.

## Twitter.jl API

All functions have required arguments for those parameters required by Twitter and an `options` keyword argument to provide a `Dict{String, String}` of optional parameters [Twitter API documentation](https://developer.twitter.com/en/docs/twitter-api/v1). Most function calls will return either a `Dict` or an `Array <: TwitterType`. Bad requests will return the response code from the API (403, 404, etc.)

DataFrame methods are defined for functions returning composite types: `Tweets`, `Places`, `Lists`, and `Users`.

## Authentication

Authentication is accomplished by creating an application on [dev.twitter.com](https://dev.twitter.com). Once your application is setup, you can access your consumer_key, consumer_token, oauth_token and oauth_secret from the "Details" tab of the application.

```julia
using Twitter

twitterauth("6nOtpXmf...",
            "sES5Zlj096S...",
            "98689850-Hj...",
            "UroqCVpWKIt...")
```

This package does not currently support OAuth authentication.

## Code examples

See [runtests.jl](https://github.com/randyzwitch/Twitter.jl/blob/master/test/runtests.jl) for example function calls.

## Contributing/TODO

Contributions to Twitter.jl are absolutely welcomed and very appropriate for beginners to Julia! Areas for improvement are identified below, but if you have a different idea, please open an issue (then, create a pull request):

General:
- Clean up API to move away from required arguments to keyword-only
- Clean up column types for DataFrame methods (switch `eltypes` from `Any` to `Union{T, Missing}`)
- Keyword arguments for returning DataFrame (to remove step in data retrieval process)
- Ability to save authentication keys to file, remove need for authentication each time
- Create detailed documentation
