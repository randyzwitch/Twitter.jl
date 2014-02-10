# Twitter

[![Build Status](https://travis-ci.org/randyzwitch/Twitter.jl.png)](https://travis-ci.org/randyzwitch/Twitter.jl)

Twitter.jl is a Julia package to work with the Twitter API v1.1. The beginning focus of development will be accessing data from the Twitter API, leaving the 'application' method calls to be developed into functions at a later date (or perhaps, never).

##Twitter.jl API

In general, the theme of the functions in this package is to require one main argument in the function call, then have a second optional keyword argument that takes a `Dict` of arguments to customize the API call. This is done to keep the function signatures from being huge, as well as to make it simple to get data from the Twitter API for the most common use cases.

While in development, most function calls will return one long string of JSON (but of Julia type `ASCIIString`). It is planned to write parsers for each type of call to return either JSON, a Dict or a DataFrame.

Also note that the API is subject to change at will until this package is regestered on METADATA.

##Authentication

Authentication is accomplished by creating an application on [dev.twitter.com](https://dev.twitter.com). Once your application is setup, you can access your consumer_key, consumer_token, oauth_token and oauth_secret from the "Details" tab of the application.

This package does not currently support on-the-fly, pop-up a browser-type OAuth authentication. 

##Code examples

```julia
  using Twitter

  #Authentication for application_only methods (i.e. non-user-account-specific endpoints)
  twitterauth("6nOtpXmf...", "sES5Zlj096St0O65V...")

  #Authentication using both application_only and OAuth
  twitterauth("6nOtpXmf...", 
            "sES5Zlj096St0O65V...";
            oauth_token = "98689850-...",
            oauth_secret = "UroqCVpWKItl9z...")

  #Search for tweets containing search term '#Duke'
  #https://dev.twitter.com/docs/api/1.1/get/search/tweets
  search_tweets_result = search_tweets("#Duke")

  #Get followers list
  #https://dev.twitter.com/docs/api/1.1/get/followers/list
  get_followers_list_result = get_followers_list("randyzwitch")
```

##Testing

Given the authenticated nature of the Twitter API, it's unlikely that testing will be built into Travis-CI. Rather, a test file will be provided in the future for testing, which will also serve as detailed examples.

##Licensing

Twitter.jl is licensed under the [MIT "Expat" license](https://github.com/randyzwitch/Twitter.jl/blob/master/LICENSE.md)
