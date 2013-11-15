# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# getAreaData = (key) ->
#     histcatexpshort = []
#     day_ = new Date()
#     for i in [1..99]
#       histcatexpshort.push([day_.getTime(),i/Math.random()%2])
#       day_.setDate(day_.getDate()+1)
#     {key: key, values: histcatexpshort}


# defaultChartConfig = (containerid, data, guideline, useDates, auxOptions) ->
#   if not auxOptions? then auxOptions = {}
#   if not guideline? then guideline = true
#   nv.addGraph ->
#     chart = nv.models.lineChart().useInteractiveGuideline(guideline)
#     chart.x((d,i) -> d.x)

#     if auxOptions.width
#       chart.width(auxOptions.width)

#     if auxOptions.height
#       chart.height(auxOptions.height)

#     if auxOptions.forceY
#       chart.forceY([0])
#     if useDates != undefined
#       formatter = (d,i) ->
#         now = (new Date()).getTime() - 86400 * 1000 * 365
#         now = new Date(now + d * 86400 * 1000)
#         d3.time.format('%b %d %Y')(now )
#     else
#         formatter = d3.format(",.1f")
#     chart.margin({right: 40})
#     chart.xAxis.tickFormat(formatter)
#     chart.yAxis
#         .axisLabel('Voltage (v)')
#         .tickFormat(d3.format(',.2f'))
#     d3.select('#' + containerid + ' svg')
#         .datum(data)
#         .transition().duration(500)
#         .call(chart)
#     nv.utils.windowResize(chart.update)
#     return chart

# hyperbole = ->
#   series1 = []
#   series2 = []
#   series3 = []
#   for i in [1..14]
#       series1.push({x: i, y: 1*4 / i})
#       series2.push({x: i, y: 5*10 / i})
#       series3.push({x: i, y: -8*0.7 / i})
#   [
#     {values: series1, key: "Series 1"}
#     {values: series2, key: "Series 2"}
#     {values: series3, key: "Series 3"}
#   ]

# stream_layers = (n, m, o) ->
#   if (arguments.length < 3) then o = 0
#   bump = (a) ->
#     x = 1 / (.1 + Math.random())
#     y = 2 * Math.random() - .5
#     z = 10 / (.1 + Math.random())
#     for i in [0..m-1]
#       w = (i / m - y) * z
#       a[i] += x * Math.exp(-w * w)
#   d3.range(n).map ->
#       a = []
#       for i in [0..m-1]
#         a[i] = o + o * Math.random()
#       for i in [0..4]
#         bump(a)
#       a.map(stream_index)

# stream_waves = (n, m) ->
#   d3.range(n).map (i) ->
#     d3.range(m).map((j) ->
#       x = 20 * j / m - i / 3
#       2 * x * Math.exp(-.5 * x)
#     ).map(stream_index)

# stream_index = (d, i) ->
#   {x: i, y: Math.max(0, d)}

# jQuery ->
#   test_data = stream_layers(3,10+Math.random()*5,.1).map (data, i) ->
#     {key: 'Stream' + i, values: data}

#   defaultChartConfig "chart3", hyperbole(), true, false, {width: 700, height: 400}
#   nv.addGraph ->
#     data = [{key: "Testing", values: [{label: "A", value: 3}, {label: "B", value: 7}, {label: "C", value: 5}, {label: "D", value: 10}, {label: "E", value: 15}]}]
#     chart = nv.models.discreteBarChart()
#       .margin({top: 30, right: 60, bottom: 50, left: 70})
#       .x((d) -> d.label)
#       .y((d) -> d.value)
#       .staggerLabels(true)
#       .tooltips(false)
#       .showValues(true)
#     chart.xAxis
#       .axisLabel "Regions (postal code)"
#     chart.yAxis
#       .axisLabel('Listings')
#       .tickFormat d3.format('')
#     d3.select('#chart1 svg')
#       .datum(data)
#       .call(chart)
#     nv.utils.windowResize chart.update
#     return chart

#   nv.addGraph ->
#     data =  [{key: "A", y: 3}, {key: "B", y: 7}, {key: "C", y: 5}, {key: "D", y: 10}, {key: "E", y: 15}]
#     width = 500
#     height = 500
#     chart = nv.models.pieChart()
#       .x((d) -> d.key)
#       .y((d) -> d.y)
#       .color(d3.scale.category10().range())
#       .donut(true)

#     d3.select("#chart2 svg")
#       .datum(data)
#       .transition().duration(1200)
#       .call(chart)

#     nv.utils.windowResize(chart.update)
#     return chart

#   nv.addGraph ->
#     chart = nv.models.multiBarChart()
#       .barColor(d3.scale.category20().range())
#       .margin({bottom: 100})
#       .transitionDuration(300)
#       .delay(0)
#       .rotateLabels(-45)
#       .groupSpacing(0.1)
#     chart.multibar
#       .hideable(true)
#     chart.reduceXTicks(false).staggerLabels(true)
#     chart.xAxis
#       .axisLabel("Current Index")
#       .showMaxMin(false)
#       .tickFormat(d3.format(',.6f'))
#     chart.yAxis
#       .tickFormat(d3.format(',.1f'))
#     d3.select('#chart4 svg')
#       .datum(hyperbole())
#       .call(chart)
#     nv.utils.windowResize(chart.update)
#     chart.dispatch.on 'stateChange', ((e) ->
#       nv.log('New State:', JSON.stringify(e)))
#     return chart

#   nv.addGraph ->
#     chart = nv.models.multiBarHorizontalChart()
#       .barColor(d3.scale.category20().range())
#       .margin({bottom: 100})
#       .transitionDuration(300)
#       .delay(0)
#     chart.xAxis
#         .axisLabel("Current Index")
#         .showMaxMin(false)
#         .tickFormat(d3.format(',.6f'))
#     chart.yAxis
#         .tickFormat(d3.format(',.1f'))
#     d3.select('#chart5 svg')
#         .datum(hyperbole())
#        .call(chart)
#     nv.utils.windowResize(chart.update)

#     chart.dispatch.on 'stateChange', ((e) ->
#       nv.log('New State:', JSON.stringify(e)))
#     return chart

#   nv.addGraph ->
#     chart = nv.models.stackedAreaChart()
#         .useInteractiveGuideline(true)
#         .x((d) -> d[0])
#         .y((d) -> d[1])
#         .color(d3.scale.category10().range())
#         .transitionDuration(300)
#         .clipEdge(true)
#     chart.xAxis
#         .tickFormat((d) -> d3.time.format('%x')(new Date(d)))
#     chart.yAxis
#         .tickFormat(d3.format(',.2f'))
#     d3.select('#chart0 svg')
#       .datum([getAreaData("Area1"), getAreaData("Area2"), getAreaData("Area3"), getAreaData("Area4")])
#       .transition().duration(0)
#       .call(chart)
#     nv.utils.windowResize(chart.update)
#     chart.dispatch.on 'stateChange', ((e) ->
#       nv.log('New State:', JSON.stringify(e)))
#     return chart






