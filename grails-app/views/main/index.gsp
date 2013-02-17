<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>ClassCartographer</title>
	</head>
	<body>
    <div id="sidebar" class="span3">
      <g:render template="/user/sidebar" />
    </div>
    <div id="student_stats_window" class="span9">
      <div id="graph_area" class="row">
        <div class="span9"></div>
        <!-- TODO: Make partial template file in students/_graph -->
      </div>

      <hr>

      <div id="feedback_overview_area" class="row">
        <!-- TODO: Make partial template file in students/_feedback_overview -->

        <div id="student_feed" class="span5">
        </div>

        <div id="semantic_analysis" class="span4">
        
        <a href="getCoursesForUser">get courses</a></br>
        <a href="getStudentsForCourse?course_id=088fc0cffc2a91c8bb7b82e076b60ccfc8e37959_id">get students</a></br>
        </div>
      </div>
    </div>
	</body>
</html>
