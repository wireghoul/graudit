<?php
//1 vuln, 1 safe call
exec( $_GET[cmd] );
exec( "echo 123" );
system ("$_POST['cmd']");
system ("pwd");
popen ("$_REQUEST[cmd]");
popen ('which php');
//backdoor style
passthru ($_COOKIE['cmd']);
passthru ('nosuch --cmd');
`ls -la $_GET[fname]`
`ls -la`
shell_exec("touch $_POST[fname]");
shell_exec("id");
exec $_GET['cmd'];
exec

?>
