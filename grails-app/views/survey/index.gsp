
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Class Cartography</title>
	</head>
	<body>

        <fieldset> 
          <legend>Hi, Billy. Tell us about your day!</legend>
        </fieldset>

	<g:form name="questionForm" url="[controller:'survey',action:'save']">
		<g:each in="${questions}" var="quest" status="i">
		    <p>${quest.question}</p>
			<g:if test="${i == 0}">
				<g:select name="response${i}" from="${1..10}" value="10"/>
			</g:if>	
			<g:else>
				<g:textArea cols="200" rows="4" id="response${i}" name="response${i}"/>
			</g:else>	    
		</g:each>
		<g:hiddenField name="surveyId" value="1" />
		<g:hiddenField name="userId" value="1" /><br/>
		<g:actionSubmit value="Submit" action="save" />		
	</g:form>
  </body>
</html>

