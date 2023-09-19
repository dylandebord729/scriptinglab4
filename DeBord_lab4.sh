#!/bin/sh
cat << EOFILE
<!DOCTYPE html>
<html lang="en">
<head><title>CITC 1317 Lab 4</title>
<style>
table,tr,th,td { border: 1px solid}
tr.tenn { background-color: red }
</style>
</head>
<body><table>
EOFILE

head -1 $1 | \
  sed -e 's=&=\&amp;=g' \
      -e 's=<=\&lt;=g' \
      -e 's=>=\&gt;=g' \
      -e 's=,=</TH><TH>=g' \
      -e 's=^.*$= <TR><TH>&</TH></TR>='

cat $1 | \
  sed -e 1d \
      -e 's=&=\&amp;=g' \
      -e 's=<=\&lt;=g' \
      -e 's=>=\&gt;=g' \
      -e 's=\",\"=</TD><TD>=g' \
      -e 's="==g' \
      -e 's=^.*$= <TR><TD>&</TD></TR>='

cat << EOFILE
</table></body></html>
EOFILE
