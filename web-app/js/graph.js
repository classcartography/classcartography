var Graph;

Graph = {
  questions: [],
  responses: [],

  questions_url: 'sample_data/questions.json',
  responses_url: 'sample_data/responses.json',

  init: function() {
    this.getQuestions();
    this.getResponses();
    return this;
  },

  getQuestions: function() {
    var graph = this;
    $.getJSON(graph.questions_url, function(question_data) {
      graph.questions = question_data;
    });
    return graph;
  },

  getResponses: function() {
    var graph = this;
    $.getJSON(graph.responses_url, function(response_data) {
      graph.responses = response_data;
    });
    return graph;
  },

  drawResponses: function(responseData) {
    // Set up D3 Graph
    var margin = {top: 10, right: 10, bottom: 100, left: 40},
        margin2 = {top: 330, right: 10, bottom: 20, left: 40},
        width = 720 - margin.left - margin.right,
        height = 400 - margin.top - margin.bottom,
        height2 = 400 - margin2.top - margin2.bottom;

    var parseDate = d3.time.format("%Y-%m-%d").parse;

    var x = d3.time.scale().range([0, width]),
        x2 = d3.time.scale().range([0, width]),
        y = d3.scale.linear().range([height, 0]),
        y2 = d3.scale.linear().range([height2, 0]);

    var xAxis = d3.svg.axis().scale(x).orient("bottom"),
        xAxis2 = d3.svg.axis().scale(x2).orient("bottom"),
        yAxis = d3.svg.axis().scale(y).orient("left");

    var brush = d3.svg.brush()
        .x(x2)
        .on("brush", brush);

    var area = d3.svg.area()
        .interpolate("monotone")
        .x(function(d) { return x(d.create_date); })
        .y0(height)
        .y1(function(d) { return y(d.response); });

    var area2 = d3.svg.area()
        .interpolate("monotone")
        .x(function(d) { return x2(d.create_date); })
        .y0(height2)
        .y1(function(d) { return y2(d.response); });

    var svg = d3.select("svg#graph")
        .attr("width", width + margin.left + margin.right)
        .attr("height", height + margin.top + margin.bottom);

    svg.append("defs").append("clipPath")
        .attr("id", "clip")
        .append("rect")
        .attr("width", width)
        .attr("height", height);

    var focus = svg.append("g")
        .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

    var context = svg.append("g")
        .attr("transform", "translate(" + margin2.left + "," + margin2.top + ")");

    responseData.forEach(function(d) {
      var date_obj = new Date(Number(d.create_date));
      d.create_date = parseDate(date_obj.getUTCFullYear() + '-' + date_obj.getMonth() + '-' + date_obj.getDate());
      d.response = Number(d.response);
    });

    x.domain(d3.extent(responseData.map(function(d) { return d.create_date; })));
    y.domain([0, d3.max(responseData.map(function(d) { return d.response; }))]);
    x2.domain(x.domain());
    y2.domain(y.domain());

    focus.append("path")
        .datum(responseData)
        .attr("clip-path", "url(#clip)")
        .attr("d", area);

    focus.append("g")
        .attr("class", "x axis")
        .attr("transform", "translate(0," + height + ")")
        .call(xAxis);

    focus.append("g")
        .attr("class", "y axis")
        .call(yAxis);

    context.append("path")
        .datum(responseData)
        .attr("d", area2);

    context.append("g")
        .attr("class", "x axis")
        .attr("transform", "translate(0," + height2 + ")")
        .call(xAxis2);

    context.append("g")
        .attr("class", "x brush")
        .call(brush)
      .selectAll("rect")
        .attr("y", -6)
        .attr("height", height2 + 7);

    function brush() {
      x.domain(brush.empty() ? x2.domain() : brush.extent());
      focus.select("path").attr("d", area);
      focus.select(".x.axis").call(xAxis);
    }
  }
}; 

$(document).ready(function() {
  Graph.init();

  setTimeout( function() { Graph.drawResponses( Graph.responses ); } , 1000 );
});
