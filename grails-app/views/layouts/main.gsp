<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Class Cartographu"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Icons -->
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">

    <!-- Stylesheets -->
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'global.css')}" type="text/css">

		<g:layoutHead/>
		<r:layoutResources />
	</head>
	<body>
        <g:if test="${session.token}">
			<g:render template="/shared/header" />
	    </g:if>
        <g:else>
			<g:render template="/shared/header-login" />
        </g:else>

        <g:layoutBody/>

        <div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>

		<g:javascript library="application"/>

		<r:layoutResources />
	</body>
</html>
