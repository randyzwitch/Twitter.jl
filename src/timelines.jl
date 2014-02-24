#############################################################
#
# Timelines Functions
#
#############################################################

function get_mentions_timeline(; options = Dict())

	#TODO: This method can only return 800 tweets maximum, 200 at a time
	#TODO: Incorporate paging to retrieve all 800 tweets, as well as warning message for trying to retrieve too many 

	r = get_oauth("https://api.twitter.com/1.1/statuses/mentions_timeline.json", options)

    #Return array of type TWEETS
    return to_TWEETS(r)

end

function get_user_timeline(; options = Dict())
    
    #TODO: Warning/Error message that a screen_name or user_id must be specified for each function call
    #TODO: Incorporate paging to retrieve all 3200 max tweets, as well as warning message for trying to retrieve too many
    
    r = get_oauth("https://api.twitter.com/1.1/statuses/user_timeline.json", options)

    #Return array of type TWEETS
    return to_TWEETS(r)

end

function get_home_timeline(; options = Dict())

	#TODO: This method can only return 800 tweets maximum, 200 at a time
	#TODO: Incorporate paging to retrieve all 800 tweets, as well as warning message for trying to retrieve too many 
    
    r = get_oauth("https://api.twitter.com/1.1/statuses/home_timeline.json", options)

    #Return array of type TWEETS
    return to_TWEETS(r)

end

function get_retweets_of_me(; options = Dict())
    
    #TODO: Warning message if count > 100
    #I think you can request 100 in one shot, no need for paging

    r = get_oauth("https://api.twitter.com/1.1/statuses/retweets_of_me.json", options)

    #Return array of type TWEETS
    return to_TWEETS(r)

end