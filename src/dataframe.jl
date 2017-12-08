#############################################################
#
# DataFrame methods to parse typed arrays
#
#############################################################

#Should really try to generate this code, only difference is data type in array
function DataFrame(array::Array{Tweets, 1})

    #Empty df as container for results
    resultdf = DataFrame()

    #Get array of field names as symbols from composite type
    cols = fieldnames(Tweets)

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
function DataFrame(response::Tweets)

    return DataFrame([response])

end

function DataFrame(array::Array{Users, 1})

    #Empty df as container for results
    resultdf = DataFrame()

    #Get array of field names as symbols from composite type
    cols = names(Users)

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
function DataFrame(response::Users)

    return DataFrame([response])

end

function DataFrame(array::Array{Places, 1})

    #Empty df as container for results
    resultdf = DataFrame()

    #Get array of field names as symbols from composite type
    cols = names(Places)

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
function DataFrame(response::Places)

    return DataFrame([response])

end

function DataFrame(array::Array{Lists, 1})

    #Empty df as container for results
    resultdf = DataFrame()

    #Get array of field names as symbols from composite type
    cols = names(Lists)

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
function DataFrame(response::Lists)

    return DataFrame([response])

end
