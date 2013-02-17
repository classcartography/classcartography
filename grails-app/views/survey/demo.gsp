<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Class Cartogaphy :: Surveys</title>
	</head>
	<body>
    <div id="survey_list" class="span3">
      <table class="table table-striped table-hover table-bordered">
        <tbody>
          <tr><th>Surveys <span class="muted">DUMMY DATA</span></th></tr>

          <tr><td>Course Name: Sample Survey</td></tr> 
          <tr><td>Course Name: Sample Survey</td></tr> 
          <tr><td>Course Name: Sample Survey</td></tr> 
          <tr><td><button class="btn btn-primary">New Survey</button></td></tr> 
        </tbody>
      </table>
    </div>

    <div id="survey_viewer" class="span6">
      <form name="new_survey" id="new_survey">
        <fieldset> 
          <legend>New survey</legend>

          <label for="survey_name">Survey Name</label>
          <input name="survey_name" type="text" class="span6">

          <div id="survey_questions" class="well">
            <label>Questions <span class="muted">( Drag and drop from the list )</span></label>
            <!-- Questions are dragged into here -->
          </div> 

          <button type="submit" class="btn btn-primary">Create Survey</button>
        <fieldset>
      </form>
    </div>

    <div id="question_viewer" class="span3">
      <table class="table table-striped table-hover table-bordered">
        <tbody>
          <tr><th>Questions <span class="muted">DUMMY DATA</span></th></tr>

          <tr><td><span class="question">How much did you learn today?</span></td></tr> 
          <tr><td><span class="question">What was your favorite part of class?</span></td></tr> 
          <tr><td><span class="question">What was your least favorite part of class?</span></td></tr> 
          <tr><td><span class="question">Describe one new thing you learned today.</span></td></tr> 
        </tbody>
      </table>
    <div>
  </body>
</html>
