#!/bin/sh
# Save graudit output as <div>ified html
# Steady on the regex if you want to modify this
VERSION=0.2
cat <<HEADER
<html>
    <head>
        <title>graudit report for graudit $*</title>
        <meta name="keywords" content="graudit static analysis report" />
        <!-- Shameless plug -->
        <meta name="description" content="Static analysis report generated using graudit - http://www.justanotherhacker.com" />
        <meta name="generator" content="grauditreport using graudit version $gver" />
        <style>
            body { background:#000; color:#fff }
            ul { list-style: none; margin: 0; padding: 0}
            li { display: inline }
            #fn { color:purple }
            #m { color:cyan }
            #ln { color:green }
            #vuln { color:red }
            #spacer { border-bottom: 1px solid #fff; width: 100px; height: 3px }
        </style>
    <head>
<body>
HEADER

# We use graudit -Z to do exact matching as ext regex don't support non greedy matching
graudit -Z $* | \
sed -e's/\&/\&amp;/g' -e's/"/\&quot;/g' -e"s/'/\&apos;/g" -e's/</\&lt\;/g' -e's/>/\&gt\;/g' \
-e"s/^\x1b\[35m\x1b\[K\(.*\)\x1b\[m\x1b\[K\x1b\[36m\x1b\[K\([-:]\)\x1b\[m\x1b\[K\x1b\[32m\x1b\[K\(.*\)\x1b\[m\x1b\[K\x1b\[36m\x1b\[K\([-:]\)\x1b\[m\x1b\[K\(.*\)$/<ul id='line'><li id='fn'>\1<\/li><li id='m'>\2<\/li><li id='ln'>\3<\/li><li id='m'>\4<\/li><li id='code'>\5<\/li><\/ul>/" \
-e"s/\x1b\[41;01;37m\x1b\[K\(.*\)\x1b\[m\x1b\[K/<li id='vuln'>\1<\/li>/g" \
-e"s/\x1b\[36m\x1b\[K##############################################\x1b\[m\x1b\[K/<hr \/>/"
