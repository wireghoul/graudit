<P>this is html, so popen() and exec() 'calls' are harmless

<?php blah(foo()); ?>
<?php blah(foo());
?>

<?php stat("singleline"); ?>

<?php eval("evil!") ?>
<?php /*exec("evil! (2)") */ ?>
<?php
exec("evil! (3)")
?>

<?php foo(bar(baz(quux(1)))); ?>

<P> blah

<?php

print "?>\n";
print '?>\n';

$start_date = mktime(0, 0, 0, 3, 24, 2000);

/* time() sucks */
# time() sucks
/* time() sucks */
$str = "time() sucks";
$str = 'time() sucks';
$str = '"time() sucks"';

$total_time = sprintf("%1.5f", (time() - $start_date) / (100000000));
print
   "<P><EM><SMALL>" .
   "Providing random bits for ~${total_time}e23 femtoseconds." .
   "</SMALL></EM>\n";

require  ('php_lib/searchbox.php');
print make_searchbox  ();

/* $blah = tempnam(); #comment */

$blah = run_sql("select foo from bar");

/* mail($spammer); */
$obj->mail($blah);

statfalsepositive();
afalsepositiveforstat();
wheestatisgreat();

is_dir("foo");
is_file("blah");

lstat("foo");
stat("bar");

eval("secondary evil");
eval("lesser evil");

$obj -> mail("foo");

?>

is_dir("html") <!-- I am HTML! -->

</DIV>

</BODY>
</HTML>
