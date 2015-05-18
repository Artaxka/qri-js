###
    Qri helpers lib.
###

class window.QriLib
    constructor: ->

    copy: (obj) ->
        o = new Object()
        for own k, v of obj
            o[k] = v

        o

    merge: (x, y) ->
        o = @.copy x

        for own k, v of y when not x[k]
            o[k] = v

        o

    makeUrl: (address, params) ->
        kwargs = (["#{k}=#{v}"] for own k, v of params)
        address + "?" + kwargs.join "&"
