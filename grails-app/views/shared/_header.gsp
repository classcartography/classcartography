<div class="navbar navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container">
      <a class="brand" href="/">Class Cartography</a>
      <p class="navbar-text pull-right">
        <g:if test="${session.token}">
          Welcome User! <a href="logout" class="navbar-link">Logout</a>
	  </g:if>
      <g:else>
          <a class="navbar-link" href="auth">Login</a>
      </g:else>
      </p>
      <ul class="nav">
        <li><g:link controller="main" action="index">Dashboard</g:link></li>
        <li><g:link controller="main" action="demo">Dashboard-Demo</g:link></li>
        <li><g:link controller="survey" action="list">Surveys</g:link></li>
        <li><g:link controller="survey" action="demo">Surveys-Demo</g:link></li>
      </ul>
    </div>
  </div>
</div>
