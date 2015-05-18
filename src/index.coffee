# You can send your own code to group messages by their code type.
CODE_LENGTH = 3

DEFAULT =
    peer: null # p=<peer_key>
    checksum: null # s=<unique>
    address: null # http://example.com:8000/stream
    onError: (ev) -> ev.srcElement.close()


warn = (msg...) -> console?.warn "[WARN]:", msg...

listen = (address, sccb, ercb) ->
    evtSource = new EventSource address
    evtSource.onerror = ercb
    evtSource.onmessage = sccb

###
    Take message from the server and code of message type.

    Example:
        => process({data: "Ping"})
        {'msg': "Ping"}

        => pricess({data: "102Ping"})
        {'msg': "Ping", 'code': 123}
###
process = (response) ->
    result = {}
    {data} = response

    code = parseInt data.slice(0, CODE_LENGTH), 10
    if code >= 0
        result['msg'] = data.slice CODE_LENGTH
        result['code'] = code

    else
        result['msg'] = data

    result


class window.Qri
    constructor: (handler, opts) ->
        lib = new QriLib()
        opts = lib.merge DEFAULT, opts or {}

        {peer, checksum, address, onError} = opts
        unless address
            return warn "address isnt specified. SSE is down."

        unless peer
            return warn "peer isnt specified. SSE is down."

        unless checksum
            return warn "checksum isnt specified. SSE is down."

        url = lib.makeUrl address, {p: peer.toString(), s: checksum.toString()}

        wrapper = (args...) -> handler process args...
        listen url, wrapper, onError



