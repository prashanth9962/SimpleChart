<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.data.show.*,java.util.List,java.io.*,java.awt.*" %>
 
<html lang="en" data-ember-extension="1">
 
 <head>
 <script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
 <script src="nvd3/lib/d3.v3.js"></script>
<script src="nvd3/nv.d3.min.js"></script>
 <link rel="stylesheet" type="text/css" href="nvd3/nv.d3.min.css">   
  <script src="nvd3/src/models/pie.js"></script>
 <script src="nvd3/src/models/pieChart.js"></script>
<script src="nvd3/src/utils.js"></script> 

   
 </head>
 <%
String startdate=request.getParameter("startdate");
String enddate=request.getParameter("enddate");
 
List l=new RequestChart().getdata(startdate, enddate);
int mozilla=Integer.parseInt(l.get(0).toString());
int ie=Integer.parseInt(l.get(1).toString());
int chrome=Integer.parseInt(l.get(2).toString());
int safari=Integer.parseInt(l.get(3).toString());
int netscape=Integer.parseInt(l.get(4).toString());

%>
 <body>
 <div>
 <svg id="test1" class="mypiechart"></svg>
 </div>
    

</body>
<script type="text/javascript">
    var testdata = [
    {
      key: "mozilla",
      y: <%=mozilla%>
    },
    {
      key: "internet explorer",
      y: <%=ie%>
    },
    {
      key: "chrome",
      y: <%=chrome%>
    },
    {
      key: "safari",
      y: <%=safari%>
    },
    {
      key: "netscape",
      y: <%=netscape%>
    },
    
    
  ];


nv.addGraph(function() {
    var width = 500,
        height = 500;

    var chart = nv.models.pieChart()
        .x(function(d) { return d.key })
        .y(function(d) { return d.y })
        .showLabels(true)
        .color(d3.scale.category10().range())
        .width(width)
        .height(height);

      d3.select("#test1")
          .datum(testdata)
        .transition().duration(1200)
          .attr('width', width)
          .attr('height', height)
          .call(chart);

d3.select(".nv-legend > g").remove();
d3.select(".nvd3").attr("transform", "translate(0,20)");


    chart.dispatch.on('stateChange', function(e) { nv.log('New State:', JSON.stringify(e)); });

    return chart;
});
    </script>

</html>