<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Class Cartography</title>
	</head>
	<body>
    <div id="sidebar" class="span3">
      <table class="table table-striped table-hover table-bordered">
        <tbody>
          <tr><th>Surveys</th></tr>
          <g:each in="${surveys}" var="survey">
            <tr>
              <td>${survey.description}</td>
            </tr>
          </g:each> 
        </tbody>
      </table>
	<g:form name="questionForm" url="[controller:'survey',action:'save']">
		<g:each in="${questions}" var="quest" status="i">
		    <p>${quest.question}</p>
			<g:textArea cols="50" rows="4" id="response${i}" name="response${i}"/>
		</g:each>
		<g:hiddenField name="surveyId" value="${params.surveyId}" />
		<g:hiddenField name="userId" value="${params.userId}" />
		<g:actionSubmit value="Submit" action="save" />		
	</g:form>
      
      
    </div>
  </body>
</html>
