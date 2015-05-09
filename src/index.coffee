DEFAULT =
    address: "http://example.com:8000/stream"
    onError: (ev) -> ev.srcElement.close()


listen = (address, sccb, ercb) ->
    evtSource = new EventSource address
    evtSource.onerror = ercb
    evtSource.onmessage = sccb


class window.Qri
    constructor: (handler, opts) ->
        lib = new QriLib()
        opts = lib.merge DEFAULT, opts or {}

        {address, onError} = opts

        listen address, handler, onError
