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
        <div class="span9">
          <img alt="Sample graph" src="http://www.austrade.gov.au/Images/UserUploadedImages/3510/ISEnrolment_Aust_Graph1994_2007.gif" />
        </div>
      </div>

      <hr>

      <div id="feedback_overview_area" class="row">
        <div id="student_feed" class="span5">
          <h4>Latest Feedback</h4>  
          <blockquote>
            [Sample of text from student's latest feedback response.]
            <small>Sep. 23</small>
          </blockquote>
          <blockquote>
            Cras sed dui in sem rutrum placerat ultricies sed est. Sed in porta tellus. Etiam pretium justo ipsum.
          </blockquote>
          <blockquote>
            In sollicitudin lectus sit amet velit facilisis sodales varius massa congue. Quisque tristique, arcu id blandit ultricies, orci justo molestie metus, at rhoncus odio dui eu mauris.
          </blockquote>
          <blockquote>
            Proin ut accumsan lorem. Donec magna orci, venenatis volutpat tempus quis, blandit quis justo. Nulla sit amet est dui, ac tempus lacus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Quisque sit amet felis nibh.
          </blockquote>
        </div>

        <div id="semantic_analysis" class="span4">
          <div class="well well-small">
            <div id="word_frequency">
              <h4>Word Frequency</h4>
              <div class="progress progress-info">
                <div class="bar" style="width: 40%">confused : 40x</div>
              </div>
              <div class="progress progress-info">
                <div class="bar" style="width: 60%">algebra : 60x</div>
              </div>
              <div class="progress progress-info">
                <div class="bar" style="width: 33%">homework : 33x</div>
              </div>
            </div>

            <h4>Positive Associations</h4>
            <div class="word_cloud">
              <span class="label label-success">drawing</span>
              <span class="label label-success">art</span>
              <span class="label label-success">food</span>
            </div>

            <h4>Negative Associations</h4>
            <div class="word_cloud">
              <span class="label label-warning">quiz</span>
              <span class="label label-warning">recess</span>
              <span class="label label-warning">sharing</span>
              <span class="label label-warning">show and tell</span>
            </div>
          </div>
        </div>
      </div>
    </div>
	</body>
</html>
