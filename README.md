# Twitter

Linux: [![Build Status](https://travis-ci.org/randyzwitch/Twitter.jl.png)](https://travis-ci.org/randyzwitch/Twitter.jl)
<br>
Windows: [![Build status](https://ci.appveyor.com/api/projects/status/09qykgs7l2fakcvh?svg=true)](https://ci.appveyor.com/project/randyzwitch/twitter-jl)


__12/08/2015: While I vouch that I'll fix issues as they arise and accept pull requests (preferred!), I unfortunately don't have the time to add additional functionality to this package.__

Twitter.jl is a Julia package to work with the Twitter API v1.1. Currently, only the REST API methods are supported; streaming APIs are supported by [Requests.jl](https://github.com/JuliaWeb/Requests.jl), but the accompanying methods have not been implemented at this time.

## Twitter.jl API

All functions have required arguments for those parameters required by Twitter and an `options` keyword argument to provide a `Dict{String, String}` of optional parameters [Twitter API documentation](https://dev.twitter.com/docs/api/1.1). Most function calls will return either a Julia `Dict` or a typed Array. Bad requests will return the raw `Response` composite type from Requests.jl for debugging purposes.

DataFrame methods are defined for functions returning composite types: `TWEETS`, `PLACES`, `LISTS`, and `USERS`.

## Authentication

Authentication is accomplished by creating an application on [dev.twitter.com](https://dev.twitter.com). Once your application is setup, you can access your consumer_key, consumer_token, oauth_token and oauth_secret from the "Details" tab of the application.

```julia
Using Twitter

twitterauth("6nOtpXmf...",
            "sES5Zlj096S...",
            "98689850-Hj...",
            "UroqCVpWKIt...")
```

This package does not currently support on-the-fly, pop-up a browser-type OAuth authentication.

## Code examples

See [runtests.jl](https://github.com/randyzwitch/Twitter.jl/blob/master/test/runtests.jl) for example function calls.

## Testing

Given the authenticated nature of the Twitter API, and the ability to get banned for rapid fire API calls (like a bot would) it's unlikely that testing will be built into Travis-CI. Rather, the [runtests.jl](https://github.com/randyzwitch/Twitter.jl/blob/master/test/runtests.jl) file can be validated manually to ensure a specific function works, as well as serving as examples in lieu of detailed documentation.

## Licensing

Twitter.jl is licensed under the [MIT "Expat" license](https://github.com/randyzwitch/Twitter.jl/blob/master/LICENSE.md)

## TODO

General:
- Incorporate cursoring for methods returning many pages of results (MOST IMPORTANT TO SOLVE)
- Create Streaming API function calls
- Make code & interface more Julian, clean up any oddities

Nice to have (timeline uncertain):

- Clean up column types for DataFrame methods
- DataFrame methods for generic `Dict` responses
- Keyword arguments for returning DataFrame (to remove step in data retrieval process)
- Ability to save authentication keys to file, remove need for authentication each time
- Create detailed documentation
- Create OAuth Twitter authentication functions
