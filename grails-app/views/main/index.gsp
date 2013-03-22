<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Class Cartography</title>
		
	</head>
	<body>
    <div id="top" class="span12">
      <div id="graph_area" class="row">
        <div class="span2">
        	Hello, ${session.name}<br/><br/>
        	<img src="${resource(dir: 'images', file: 'linda.jpg')}"/>
        </div>
        <div class="span10">
        	<span class="lineChartHeading">How is your <a href="#">8th Grade English - Sec 6</a> class doing?</span>
        	<canvas id="understandingChart" width="800" height="260"></canvas>
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
        </div>
      </div>

      <div id="bottom" class="row">
        <div id="pie-chart" class="span4">
        <span class="pieChartHeading">Student Understanding</span><br/>
        Did students understand Homework #7?
        <canvas id="pieChart" height="200" width="200"></canvas>
        	<div class="pieChartTable">
        		<div class="pieChartRow">
	        		<div class="pieChartCell1"></div>
	        		<div class="pieChartCell2"></div>
	        		<div class="pieChartCell3">Yes</div>
	        		<div class="pieChartCell4"></div>
	        		<div class="pieChartCell5">No</div>
        		</div>
        	</div><br/>
        
        </div>
        <div id="notifications" class="span4">
	        <span class="notificationHeading">Notifications</span>
			<div id="wrapper">
				<div id="scroller">
					<ul>
						<li>
							<img class="img-padding-right" align="left" src="${resource(dir: 'images', file: 'warning.png')}"/>
							<span class="padding">Alton didn't understand the last 3 homework assignments.</span>
						</li>
						<li>
							<img class="img-padding-right" align="left" src="${resource(dir: 'images', file: 'warning.png')}"/>
							<span class="padding">Tomasa had trouble with the last quiz. Her last comment was "Too many questions!"</span>
						</li>
						<li>
							<img class="img-padding-right" align="left" src="${resource(dir: 'images', file: 'warning.png')}"/>
							<span class="padding">Lashawn did not hand in his last 3 homework assignments. His last comment was "I didn't have enough time to finish."</span>
						</li>
						<li>
							<img class="img-padding-right" align="left" src="${resource(dir: 'images', file: 'star.png')}"/>
							<span class="padding">Dominic may need more challenging work. Her last comment was "This quiz was really easy."</span>
						</li>
						<li>
							<img class="img-padding-right" align="left" src="${resource(dir: 'images', file: 'warning.png')}"/>
							<span class="padding">Marco didn't understand the last 3 lessons.</span>
						</li>
						<li>
							<img class="img-padding-right" align="left" src="${resource(dir: 'images', file: 'warning.png')}"/>
							<span class="padding">Johnny didn't understand the last 3 homework assignments.</span>
						</li>
						<li>
							<img class="img-padding-right" align="left" src="${resource(dir: 'images', file: 'warning.png')}"/>
							<span class="padding">Gerardo did not hand in his last 3 homework assignments.</span>
						</li>
					</ul>
				</div>
			</div>
        </div>
        <div id="messages" class="span4">
	        <span class="commentHeading">Most Recent Comments</span>
			<div id="commentWrapper">
				<div id="commentScroller">
					<ul>
						<li>
							<img class="img-padding-right" align="left" src="${resource(dir: 'images', file: 'female-0.jpg')}"/>
							<span class="commentSubject">Quiz #2</span>
							<span class="commentDateTime">March 4, 2013 4:34pm</span>
							<span class="padding">Can you go over question 5 in class tomorrow?</span>
						</li>
						<li>
							<img class="img-padding-right" align="left" src="${resource(dir: 'images', file: 'male-1.jpg')}"/>
							<span class="commentSubject">Homework #6</span>
							<span class="commentDateTime">March 4, 2013 2:24pm</span>
							<span class="padding">I didn't understand question 4.</span>
						</li>
						<li>
							<img class="img-padding-right" align="left" src="${resource(dir: 'images', file: 'male-2.jpg')}"/>
							<span class="commentSubject">Homework #6</span>
							<span class="commentDateTime">March 4, 2013 1:12pm</span>
							<span class="padding">Is there a tutor that can help me with algebra?</span>
						</li>
					</ul>
						<li>
							<img class="img-padding-right" align="left" src="${resource(dir: 'images', file: 'female-2.jpg')}"/>
							<span class="commentSubject">Homework #6</span>
							<span class="commentDateTime">March 4, 2013 12:10pm</span>
							<span class="padding">This homework assignment was really difficult.</span>
						</li>
				</div>
			</div>
        </div>
      </div>
    </div>

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
            datasetFill : false
        }

		var myLine = new Chart(document.getElementById("understandingChart").getContext("2d")).Line(lineChartData, lineOptions);

		var pieData = [
				{
					value: 62,
					color:"#14a5d7"
				},
				{
					value :38,
					color:"#d71444"
				},
			
			];

	var myPie = new Chart(document.getElementById("pieChart").getContext("2d")).Pie(pieData);	
	</script>
    
	</body>
</html>
