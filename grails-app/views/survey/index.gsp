<html>
<body>

	<g:form name="questionForm" url="[controller:'survey',action:'save']">
		<g:each in="${questions}" var="quest" status="i">
		    <p>${quest.question}</p>
			<g:textArea cols="50" rows="4" id="response${i}" name="response${i}"/>
		</g:each>
		<g:hiddenField name="surveyId" value="${params.surveyId}" />
		<g:hiddenField name="userId" value="${params.userId}" />
		<g:actionSubmit value="Submit" action="save" />		
	</g:form>

</body>
</html>