#
# Coffeescript vizualization project
#


###
  Example code borrowed from : http://bl.ocks.org/mbostock/1021953
###

width = 960
height = 500

fill = d3.scale.category10()

nodes = []
foci = [{x: 150, y: 150}, {x: 350, y: 250}, {x: 700, y: 400}]

svg = d3.select("#chart").append("svg")
    .attr("width", width)
    .attr("height", height)

force = d3.layout.force()
    .nodes(nodes)
    .links([])
    .gravity(0)
    .size([width, height])
    .on("tick", tick)

node = svg.selectAll("circle")

tick = (e) ->
  k = .1 * e.alpha;
  nodes.forEach (o, i) ->
    o.y += (foci[o.id].y - o.y) * k
    o.x += (foci[o.id].x - o.x) * k
  node
    .attr "cx", (d) -> d.x
    .attr "cy", (d) -> d.y

setInterval((->
  nodes.push({id: ~~(Math.random() * foci.length)})
  force.start()
  node = node.data(nodes)
  node.enter().append("circle")
      .attr("class", "node")
      .attr "cx", (d) -> d.x
      .attr "cy", (d) -> d.y
      .attr "r", 8
      .style "fill", (d) -> fill(d.id)
      .style "stroke", (d) -> d3.rgb(fill(d.id)).darker(2)
      .call(force.drag)
  ), 500)