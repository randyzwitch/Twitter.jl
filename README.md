# Twitter

[![Build Status](https://travis-ci.org/randyzwitch/Twitter.jl.png)](https://travis-ci.org/randyzwitch/Twitter.jl)

Twitter.jl is a Julia package to work with the Twitter API v1.1.

##Twitter.jl API

While in development, most function calls will return one long string of JSON as a Julia `Dict`. It is planned to write parsers for each type of call to return either JSON or a DataFrame.

Also note that the API is subject to change at will until this package is regestered on METADATA.

##Authentication

Authentication is accomplished by creating an application on [dev.twitter.com](https://dev.twitter.com). Once your application is setup, you can access your consumer_key, consumer_token, oauth_token and oauth_secret from the "Details" tab of the application.

This package does not currently support on-the-fly, pop-up a browser-type OAuth authentication. 

##Code examples

See [tests.jl](https://github.com/randyzwitch/Twitter.jl/blob/master/tests/tests.jl) for example function calls for simple examples. More detailed examples will be provided at a later date once API is finalized.

##Testing

Given the authenticated nature of the Twitter API, it's unlikely that testing will be built into Travis-CI. Rather, a test file will be provided in the future for testing, which will also serve as detailed examples.

##Licensing

Twitter.jl is licensed under the [MIT "Expat" license](https://github.com/randyzwitch/Twitter.jl/blob/master/LICENSE.md)

##TODO

Everything, including:

POST calls:
- Working API calls for remaining POST methods
- Make POST functions incorporate options Dict to build request URI
- Refactor code OAuth-post generic call

GENERAL:
- Wrap return functions for types to make sure a valid response was returned first
- Incorporate cursoring for methods returning many pages of results - MOST IMPORTANT TO SOLVE
- Add proper field types to TWEETS, USERS and PLACES custom types
- Parser for returned data/custom types into DataFrame
- Keyword arguments (or just DataFrame methods) for type of data structure desired as returned object
- Make interface more Julian, clean up any oddities
- Ability to save authentication keys to file, remove need for authentication each time
- Create Read The Docs documentation
