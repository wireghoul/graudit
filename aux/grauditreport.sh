#!/bin/sh
# Save graudit output as <div>ified html
# Steady on the regex if you want to modify this

cat <<HEADER
<html>
    <head>
        <title>Graudit report for graudit $*</title>
        <meta keyword="graudit static analysis report">
        <style>
        #vuln { color : #FF0000 }
        </style>
    <head>
<body>
HEADER

# We use graudit -Z to do exact matching as ext regex don't support non greedy matching
graudit -Z $* | \
sed -e's/</\&lt\;/g' -e's/>/\&gt\;/g' \
-e"s/^\x1b\[35m\x1b\[K\(.*\)\x1b\[m\x1b\[K\x1b\[36m\x1b\[K\([-:]\)\x1b\[m\x1b\[K\x1b\[32m\x1b\[K\(.*\)\x1b\[m\x1b\[K\x1b\[36m\x1b\[K\([-:]\)\x1b\[m\x1b\[K\(.*\)$/<div id='fn'>\1<\/div><div id='m'>\2<\/div><div id='ln'>\3<\/div><div id='m'>\4<\/div><div id='code'>\5<\/div>/" \
-e"s/\x1b\[41;01;37m\x1b\[K\(.*\)\x1b\[m\x1b\[K/<div id='vuln'>\1<\/div>/g"
