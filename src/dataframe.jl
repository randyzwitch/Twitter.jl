#############################################################
#
# DataFrame methods to parse typed arrays
#
#############################################################

#Should really try to generate this code, only difference is data type in array
function DataFrame(array::Array{TWEETS, 1})

    #Empty df as container for results
    resultdf = DataFrame()

    #Get array of field names as symbols from composite type
    cols = fieldnames(TWEETS)

    #For each field in composite type...
    for column in cols

        #Temp array to hold results
        temp = []

        #Loop over array of composite type, get individual field value from outer loop value
        for value in array
            push!(temp, getfield(value, column))
        end

        #Append each column to df
        resultdf = hcat(resultdf, temp)

    end

    #Use cols array above to properly name df columns
    names!(resultdf, cols)

    return resultdf

end

#Convert single returned composite type to array
function DataFrame(response::TWEETS)

    return DataFrame([response])

end

function DataFrame(array::Array{USERS, 1})

    #Empty df as container for results
    resultdf = DataFrame()

    #Get array of field names as symbols from composite type
    cols = names(USERS)

    #For each field in composite type...
    for column in cols

        #Temp array to hold results
        temp = []

        #Loop over array of composite type, get individual field value from outer loop value
        for value in array
            push!(temp, getfield(value, column))
        end

        #Append each column to df
        resultdf = hcat(resultdf, temp)

    end

    #Use cols array above to properly name df columns
    names!(resultdf, cols)

    return resultdf

end

#Convert single returned composite type to array
function DataFrame(response::USERS)

    return DataFrame([response])

end

function DataFrame(array::Array{PLACES, 1})

    #Empty df as container for results
    resultdf = DataFrame()

    #Get array of field names as symbols from composite type
    cols = names(PLACES)

    #For each field in composite type...
    for column in cols

        #Temp array to hold results
        temp = []

        #Loop over array of composite type, get individual field value from outer loop value
        for value in array
            push!(temp, getfield(value, column))
        end

        #Append each column to df
        resultdf = hcat(resultdf, temp)

    end

    #Use cols array above to properly name df columns
    names!(resultdf, cols)

    return resultdf

end

#Convert single returned composite type to array
function DataFrame(response::PLACES)

    return DataFrame([response])

end

function DataFrame(array::Array{LISTS, 1})

    #Empty df as container for results
    resultdf = DataFrame()

    #Get array of field names as symbols from composite type
    cols = names(LISTS)

    #For each field in composite type...
    for column in cols

        #Temp array to hold results
        temp = []

        #Loop over array of composite type, get individual field value from outer loop value
        for value in array
            push!(temp, getfield(value, column))
        end

        #Append each column to df
        resultdf = hcat(resultdf, temp)

    end

    #Use cols array above to properly name df columns
    names!(resultdf, cols)

    return resultdf

end

#Convert single returned composite type to array
function DataFrame(response::LISTS)

    return DataFrame([response])

end