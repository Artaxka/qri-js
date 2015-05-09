Qri JavaScript interface
================================

This is only a part of our infrastructure for easy integration of push notifications between Server-side and Client-side. Our infrastructure are based on [SSE](http://www.w3.org/TR/eventsource/#abstract) interface.
Read more about other Qri components:

1. [SSE server](https://github.com/Orderry/orderry-qri);

Infrastructure
==============

```
 |--------|     |---------|     |--------|
 | Python | ... | Clojure | ... | Haskel |
 |--------|     |---------|     |--------|
         \           |            /
          \          |           /
        |-------------------------|
        | Erlang SSE Proxy Server |
        |-------------------------|
             |               |
             |               |
       |----------|     |----------|
       | Client_1 | ... | Client_N |  <-- QriJS
       |----------|     |----------|
```

Installing
==========

### from source

Download suitable project archive [zip](https://github.com/Orderry/qri-js/archive/master.zip).

Include in your html documents one of the following javascript file:

> -    dist/qri.js
> -    dist/qri.min.js (minified version)
