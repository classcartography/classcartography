<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Class Cartogaphy :: Surveys</title>
	</head>
	<body>
    <div id="survey_list" class="span3">
        <fieldset> 
          <legend>Feedback Forms</legend>
         </fieldset>
      <table class="table table-striped table-hover table-bordered">
        <tbody>
          <tr><td>Math - 3rd Grade</td></tr> 
          <tr><td>Math - 4th Grade</td></tr> 
          <tr><td>English - 2nd Grade</td></tr> 
          <tr><td>English - 3rd Grade</td></tr> 
          <tr><td><button class="btn btn-primary">New Survey</button></td></tr> 
        </tbody>
      </table>
    </div>

    <div id="survey_viewer" class="span6">
      <form name="new_survey" id="new_survey">
        <fieldset> 
          <legend>New Feedback Form</legend>

          <label for="survey_name">Name</label>
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
        <fieldset> 
          <legend>Questions</legend>
         </fieldset>
      <table class="table table-striped table-hover table-bordered">
        <tbody>
          <tr><td><span class="question">How much did you learn today?</span></td></tr> 
          <tr><td><span class="question">What was your favorite part of class?</span></td></tr> 
          <tr><td><span class="question">What was your least favorite part of class?</span></td></tr> 
          <tr><td><span class="question">Describe one new thing you learned today.</span></td></tr> 
        </tbody>
      </table>
    <div>
  </body>
</html>
