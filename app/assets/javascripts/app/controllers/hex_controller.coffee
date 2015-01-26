# http://bl.ocks.org/mbostock/5249328
class HexagonMesh
  constructor: (appendTo) ->
    @selector = '.hexagonMesh'
    @mousing = 0
    @width = 960
    @height = 500
    @radius = 20
    @topology = hexTopology(@radius, @width, @height)
    @projection = hexProjection(@radius)
    @path = d3.geo.path().projection(@projection)
    @svg = d3.select('.hexagonMesh')
      .append("svg")
        .attr("width", @width)
        .attr("height", @height)

    @svg
      .append("g")
        .attr("class", "hexagon")
      .selectAll("path")
        .data(@topology.objects.hexagons.geometries)
        .enter()
      .append("path")
        .attr("d", (d) ->
         @path topojson.feature(@topology, d)
        )
       .attr("class", (d) ->
         (if d.fill then "fill" else null)
       )
      .on("mousedown", mousedown)
      .on("mousemove", mousemove)
      .on "mouseup", mouseup

    @svg
      .append("path")
      .datum(topojson.mesh(@topology, @topology.objects.hexagons))
      .attr("class", "mesh")
      .attr "d", @path

    @border = @svg.append("path").attr("class", "border").call(redraw)
  mousedown = (d) ->
    @mousing = (if d.fill then -1 else +1)
    mousemove.apply this, arguments
    return
  mousemove = (d) ->
    if @mousing
      d3.select(this).classed "fill", d.fill = @mousing > 0
      border.call redraw
    return
  mouseup = ->
    mousemove.apply this, arguments
    @mousing = 0
    return
  redraw = (border) ->
    border.attr "d", @path(topojson.mesh(@topology, @topology.objects.hexagons, (a, b) ->
      a.fill ^ b.fill
    ))
    return
  hexTopology = (radius, width, height) ->
    dx = radius * 2 * Math.sin(Math.PI / 3)
    dy = radius * 1.5
    m = Math.ceil((height + radius) / dy) + 1
    n = Math.ceil(width / dx) + 1
    geometries = []
    window.arcs = []
    j = -1

    while j <= m
      i = -1

      while i <= n
        y = j * 2
        x = (i + (j & 1) / 2) * 2
        arcs.push [ [x,y-1], [1,1] ], [ [x+1,y], [0,1] ], [ [x+1,y+1], [-1,1] ]
        ++i
      ++j
    j = 0
    q = 3

    while j < m
      i = 0

      while i < n
        geometries.push
          type: "Polygon"
          arcs: [[
            q
            q + 1
            q + 2
            ~(q + (n + 2 - (j & 1)) * 3)
            ~(q - 2)
            ~(q - (n + 2 + (j & 1)) * 3 + 2)
          ]]
          fill: Math.random() > i / n * 2

        ++i
        q += 3
      ++j
      q += 6
    transform:
      translate: [0,0]
      scale: [1,1]

    objects:
      hexagons:
        type: "GeometryCollection"
        geometries: geometries

    arcs: arcs

  hexProjection = (radius) ->
    dx = radius * 2 * Math.sin(Math.PI / 3)
    dy = radius * 1.5
    stream: (stream) ->
      point: (x, y) ->
        stream.point x * dx / 2, (y - (2 - (y & 1)) / 3) * dy / 2
        return

      lineStart: ->
        stream.lineStart()
        return

      lineEnd: ->
        stream.lineEnd()
        return

      polygonStart: ->
        stream.polygonStart()
        return

      polygonEnd: ->
        stream.polygonEnd()
        return
      

#new HexagonMesh()