#############################################################
#
# Spam Reporting Functions
#
#############################################################

function post_users_report_spam(; options=Dict{String, String}())

    r = post_oauth("https://api.twitter.com/1.1/users/report_spam.json", options)

    #return to_USERS(r)
    return r.status == 200 ? to_USERS(Requests.json(r)) : r

end