<div class="navbar navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container">
      <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="brand" href="/">Class Cartography</a>
      <div class="nav-collapse collapse">
      
      <p class="navbar-text pull-right">
      <g:if test="${session.token}">
          Welcome User! <a href="logout" class="navbar-link">Logout</a>
	  </g:if>
      <g:else>
          <a class="navbar-link" href="auth">Login</a>
      </g:else>
      </p>
      
        <ul class="nav">
          <li><a href="/dashboard">Dashboard</a></li>
        </ul>
      </div><!--/.nav-collapse -->
    </div>
  </div>
</div>
