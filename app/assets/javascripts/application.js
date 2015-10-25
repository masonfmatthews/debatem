// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require d3
//= require_tree .

function generateHalfDonuts() {
  var width = 150,
      height = 150,
      radius = Math.min(width, height) / 2;

  var arc = d3.svg.arc()
      .outerRadius(radius - 10)
      .innerRadius(radius - 40);

  var pie = d3.layout.pie()
      .sort(null)
      .startAngle(-1.25*Math.PI/2)
      .endAngle(1.25*Math.PI/2)
      .value(function(d) { return d.percentage; });

  var svg = d3.selectAll("svg.half-donut")
      .attr("width", width)
      .attr("height", height)
    .append("g")
      .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");

  var jsonData = [{name: "Yes", percentage: 40}, {name: "No", percentage: 60}];

  var g = svg.selectAll(".arc")
      .data(pie(jsonData))
    .enter().append("g")
      .attr("class", "arc");

  g.append("path")
      .attr("d", arc)
      .style("fill", function(d) { return d.data.name=="Yes" ? "green" : "red"; });

  g.append("text")
      .attr("transform", function(d) { return "translate(" + arc.centroid(d) + ")"; })
      .attr("dy", ".35em")
      .style("text-anchor", "middle")
      .text(function(d) { return d.data.name; });
}

$(generateHalfDonuts);
