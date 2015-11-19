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
  var width = 200,
      height = 150,
      radius = 100;

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
      .data(allPercentages) //NOTE: This is defined in the Ruby propositions/index view
    .append("g")
      .attr("transform", "translate(" + width / 2 + "," + width / 2 + ")");

  var g = svg.selectAll(".arc")
      .data(function(d) {return pie([{percentage: d}, {percentage: 100-d}]);})
    .enter().append("g")
      .attr("class", "arc");

  g.append("path")
      .attr("d", arc)
      .style("fill", function(d, i) { return i==0 ? "#3c763d" : "#a94442"; });

  svg.append("text")
      .attr("class", "overall-percentage")
      .attr("dy", ".35em")
      .attr("y", "-10px")
      .style("text-anchor", "middle")
      .text(function(d) {return "" + d + "%"});
}

$(generateHalfDonuts);
