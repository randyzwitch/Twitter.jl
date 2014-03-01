# Twitter

[![Build Status](https://travis-ci.org/randyzwitch/Twitter.jl.png)](https://travis-ci.org/randyzwitch/Twitter.jl)

Twitter.jl is a Julia package to work with the Twitter API v1.1.

##Twitter.jl API

While in development, most function calls will return one long string of JSON as a Julia `Dict` or a typed Array. It is planned to define DataFrame methods where feasible.

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

GENERAL:
- Figure out how to do streaming function calls (IOStream?)
- Incorporate cursoring for methods returning many pages of results (MOST IMPORTANT TO SOLVE)
- Create COORDINATES, ENTITIES type, add proper field types (Is this really necessary?)
- DataFrame methods for returned data/custom types
- Wrap return with logic to check that a valid response was returned first
- Keyword arguments for returning DataFrame (to remove step in data retrieval process)
- Make interface more Julian, clean up any oddities
- Ability to save authentication keys to file, remove need for authentication each time
- Create Read The Docs documentation
