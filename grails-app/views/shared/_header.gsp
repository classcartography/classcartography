<div class="navbar navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container">
      <a class="brand-cc" href="index"><img src="${resource(dir: 'images', file: 'classcart-logo.png')}"/></a>
      <p class="navbar-text pull-right">
        <g:if test="${session.token}">
          Hello, ${session.name} - <g:link controller="inBloomAPI" action="logout" class="navbar-link">Logout</g:link>
	    </g:if>
      </p>
      <ul class="nav">
        <!--<li><g:link controller="main" action="index">Dashboard</g:link></li>-->
        <li>&nbsp;</li>
        <li><g:link controller="main" action="demo">Dashboard</g:link></li>
        <!--<li><g:link controller="survey" action="list">Feedback</g:link></li>-->
        <li><g:link controller="survey" action="demo">Manage Feedback</g:link></li>
      </ul>
    </div>
  </div>
</div>
