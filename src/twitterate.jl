# struct for new cursor object
mutable struct Cursorable
        body::Dict
		screen_name::String
	    cursor::Int
        f::Function
        function Cursorable(body::Dict = Dict(), screen_name = "", cursor=-1, f = get_followers_ids)
                newcursor = new()
                newcursor.body = body
                newcursor.screen_name = screen_name
                newcursor.cursor = cursor
                newcursor.f = f
                newcursor
        end
end

Base.iterate(T::Cursorable) = T, T.cursor

# feed the existing object and existing cursor into the iteration
function Base.iterate(T::Cursorable, cursor)
    if cursor == 0 # no more valid entries
        nothing
    else
        newbody = T.f(screen_name = T.screen_name)
        Cursorable(newbody, T.screen_name, newbody["next_cursor"], T.f), newbody["next_cursor"]
    end
 end
