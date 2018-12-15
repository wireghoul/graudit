#!/bin/bash
# loop through composer cache files
# cp zip to /tmp/composeraudit
# unzip
# graudit >> ~/.composer/auditreport.txt

rm ~/.composer/auditreport.txt
mkdir /tmp/composeraudit
for zf in `find ~/.composer/cache/files/ -name "*.zip"`; do
	echo "[+] Auditing: $zf"
	cp $zf /tmp/composeraudit/
	cd /tmp/composeraudit
	unzip *.zip >/dev/null
	graudit -x *.js -d fruit . > /tmp/composerreport.txt
	findings=`wc -l /tmp/composerreport.txt | cut -d' ' -f1`
	if [ $findings -ge 11 ]; then
		cat /tmp/composerreport.txt >> ~/.composer/auditreport.txt
	        echo "$findings findings"
	fi
        rm -rf /tmp/composeraudit/*
done
