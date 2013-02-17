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
    </div>
  </body>
</html>
