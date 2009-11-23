<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>Paths</title>
  </head>

  <body>
    <h1>Paths</h1>

    <table>
      <tr><td colspan='2'><b><%= Runtime.getRuntime() %></b>
      <tr><td>request.getScheme()<td><%= request.getScheme() %>
      <tr><td>request.getServerName()<td><%= request.getServerName() %>
      <tr><td>request.getServerPort()<td><%= request.getServerPort() %>
      <tr><td><td>
      <tr><td>request.getRequestURI()<td><%= request.getRequestURI() %>
      <tr><td>request.getContextPath()<td><%= request.getContextPath() %>
      <tr><td>request.getServletPath()<td><%= request.getServletPath() %>
      <tr><td>request.getPathInfo()<td><%= request.getPathInfo() %>
      <tr><td>request.getPathTranslated()<td><%= request.getPathTranslated() %>
      <tr><td>request.getQueryString()<td><%= request.getQueryString() %>

    <hr>
    <address><a href="mailto:sam@caucho.com">Sam</a></address>
<!-- Created: Mon Dec 16 09:47:34 EST 2002 -->
<!-- hhmts start -->
Last modified: Thu Dec 19 16:42:33 EST 2002
<!-- hhmts end -->
  </body>
</html>
