<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="minimal"/>
		<title>Class Cartography: Survey #${survey.id}</title>
	</head>
	<body>
    <div id="surveyResponse" class="span6 well">
      <h4>How is your learning going? <span class="muted">SAMPLE FORM</span></h4>

      <g:form name="surveyResponse" url="[controller:'response',action:'save']">
        <g:each in="${questions}" var="question">
          <label for="question_${question.id}">${question.question}</label>
          <textarea name="question_${question.id}" placeholder="Placeholder value" rows="3"></textarea> 
        </g:each>

      <label for="learn_amt">How much did you learn in COURSE_NAME today?</label>
      <select name="learn_amt">
        <option value="5">A whole lot</option>
        <option value="4">Quite a bit</option>
        <option value="3">About average</option>
        <option value="2">Not that much</option>
        <option value="1">Nothing at all</option>
      </select>

      <label for="positive_comment">What was the best part of class today?</label>
      <input name="positive_comment" type="text" class="span6" />

      <label for="negative_comment">What was your <em>least</em> favorite part?</label>
      <input name="negative_comment" type="text" class="span6" />

      <label for="one_thing_learned">Something new you learned today:</label>
      <input name="one_thing_learned" type="text" class="span6" />

      </g:form>
    </div>
	</body>
</html>
