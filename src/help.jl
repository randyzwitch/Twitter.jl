#############################################################
#
# Help section Functions for Twitter API
#
#############################################################

function get_help_configuration()
    
	response = get(URI("https://api.twitter.com/1.1/help/configuration.json");
                   headers = {"Authorization" => "Bearer $(twittercred.auth_only_bearer_token)"})
    
    #Currently, just returns Response object from Requests.jl
	if response.status == 200
		return response
	else
        #This will return the summary 
		error(response)
	end
end

function get_help_languages()
    
	response = get(URI("https://api.twitter.com/1.1/help/languages.json");
                   headers = {"Authorization" => "Bearer $(twittercred.auth_only_bearer_token)"})
    
    #Currently, just returns Response object from Requests.jl
	if response.status == 200
		return response
	else
        #This will return the summary 
		error(response)
	end
end

function get_help_privacy()
    
	response = get(URI("https://api.twitter.com/1.1/help/privacy.json");
                   headers = {"Authorization" => "Bearer $(twittercred.auth_only_bearer_token)"})
    
    #Currently, just returns Response object from Requests.jl
	if response.status == 200
		return response
	else
        #This will return the summary 
		error(response)
	end
end

function get_help_tos()
    
	response = get(URI("https://api.twitter.com/1.1/help/tos.json");
                   headers = {"Authorization" => "Bearer $(twittercred.auth_only_bearer_token)"})
    
    #Currently, just returns Response object from Requests.jl
	if response.status == 200
		return response
	else
        #This will return the summary 
		error(response)
	end
end

#TODO: Add resources keyword argument
#https://dev.twitter.com/docs/api/1.1/get/application/rate_limit_status
function get_application_rate_limit_status()
    
	response = get(URI("https://api.twitter.com/1.1/application/rate_limit_status.json");
                   headers = {"Authorization" => "Bearer $(twittercred.auth_only_bearer_token)"})
    
    #Currently, just returns Response object from Requests.jl
	if response.status == 200
		return response
	else
        #This will return the summary 
		error(response)
	end
end