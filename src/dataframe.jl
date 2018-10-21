function DataFrame(array::Array{T, 1}) where T <: TwitterType

    #Empty df as container for results
    resultdf = DataFrame()

    #Get array of field names as symbols from composite type
    cols = fieldnames(T)

    #For each field in composite type...
    for column in cols

        #Temp array to hold results
        temp = []

        #Loop over array of composite type, get individual field value from outer loop value
        for value in array
            push!(temp, getfield(value, column))
        end

        #Append each column to df
        resultdf = hcat(resultdf, temp, makeunique=true)

    end

    #Use cols array above to properly name df columns
    names!(resultdf, cols)

    return resultdf

end

#Convert single returned composite type to array
DataFrame(response::T) where T <: TwitterType = DataFrame([response])
