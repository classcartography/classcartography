<div class="navbar navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container">
      <a class="brand" href="/">Class Cartography</a>
      <p class="navbar-text pull-right">
        <g:if test="${session.token}">
          Welcome ${session.name}! - <g:link controller="inBloomAPI" action="logout" class="navbar-link">Logout</g:link>
	    </g:if>
        <g:else>
          <g:link controller="inBloomAPI" action="auth" class="navbar-link">Login</g:link>
        </g:else>
      </p>
      <ul class="nav">
        <li><g:link controller="main" action="index">Dashboard</g:link></li>
        <li><g:link controller="main" action="demo">Dashboard-Demo</g:link></li>
        <li><g:link controller="survey" action="list">Feedback</g:link></li>
        <li><g:link controller="survey" action="demo">Feedback-Demo</g:link></li>
      </ul>
    </div>
  </div>
</div>
