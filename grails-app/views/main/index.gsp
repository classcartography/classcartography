<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>ClassCartographer</title>
	</head>
	<body>
    <div id="sidebar" class="span3">
      <g:render template="/shared/sidebar" />
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
        </div>
      </div>
    </div>
	</body>
</html>
