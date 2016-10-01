# Grafos (ALPHA)

A library to represent and render graphs.

## What?

The goal is to help draw scripted graphs interactively to represent ideas live, as they come. REPL or from file. You should be able to create and modify the data using Elixir, then render it as SVG.

The graph could persist as code in an exs file. Just to run `elixir file.exs` should produce the desired output. The same code run from `iex` should work.

In the beggining graph data is supposed to be small (i.e. will be kept in a map in RAM). The intent is to process it lazily by default, but for now no further thought will be spent there. Maybe someday appears a use case that allows me to give a try to `Flow`/`GenStage`.

We'll see.

## Data model

Borrow much from [Graphviz](http://graphviz.org/) and [Erlang's `:digraph`](http://erlang.org/doc/man/digraph.html), but keeping it more generic and accessible.

* Graph
* Vertex
* Edge

Each one of these has in `id` and `attributes`.

Common attributes:

* `label`: by default `id` is used
* Any SVG attributes that make sense should be valid at some point

### Graph

The `Graph` struct represents a group of `Vertex` or other `Graph`.

Specific attributes:

* `layout`
* ...

### Vertex

The `Vertex` is just a node on the graph.

### Edge

The `Edge` is a nexus between `Vertex`s

Specific attributes:

* `weight`
* ...

## Render

Geometry is resolved by the library. That means that every element of the graph has its coordinates and sizes determined before any render happens.

Render is a mere translation of the whole data struct to SVG.

Wild things like _partial render_ (to allow dynamic graph navigation) and such may come afterwards.

## TODOs

* Too basic stuff yet
...
