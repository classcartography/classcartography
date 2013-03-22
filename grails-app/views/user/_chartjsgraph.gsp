        	<span class="lineChartHeading">How is your <a href="#">8th Grade English - Sec 6</a> class doing?</span>
        	<canvas id="understandingChart" width="700" height="260"></canvas>
        	<div class="lineChartTable">
        		<div class="lineChartRow">
	        		<div class="lineChartCell1"></div>
	        		<div class="lineChartCell2"></div>
	        		<div class="lineChartCell3">
	        			Understanding
	        		</div>
	        		<div class="lineChartCell4"></div>
	        		<div class="lineChartCell5">
	        			Grade
	        		</div>
        		</div>
        	</div><br/>

<script>

		var lineChartData = {
			labels : ["Lesson 1","HW 1","Lesson 2","HW 2","Lesson 3","HW 3","Quiz 1", "Lesson 4", "HW 4", "Lesson 5", "HW 5", "Lesson 6", "HW 6", "Quiz 2"],
			datasets : [
				{
					fillColor : "rgba(220,220,220,0.5)",
					strokeColor : "rgba(20,165,215,1)",
					pointColor : "rgba(20,165,215,1)",
					pointStrokeColor : "#fff",
					data : [62,70,65,75,88,86,80,40,54,79,85,94,86,95]
				},
				{
					fillColor : "rgba(151,187,205,0.5)",
					strokeColor : "rgba(165,215,20,1)",
					pointColor : "rgba(151,187,205,1)",
					pointStrokeColor : "#fff",
					data : [76,76,70,70,56,56,87,58,58,83,83,84,84,87]
				}
			]
			
		}
		
        var lineOptions = {
            pointDotRadius : 3,
	        scaleOverlay : false,
	        scaleOverride : true,
	        scaleSteps : 10,
	        scaleStepWidth : 10,
	        scaleStartValue : 10,
            scaleLineColor : "rgba(255,0,0,.1)",
            bezierCurve : false,
            scaleShowLabels : true,
            datasetFill : false,
            scaleFontSize : 10
        }

		var myLine = new Chart(document.getElementById("understandingChart").getContext("2d")).Line(lineChartData, lineOptions);

</script>
        	
        	