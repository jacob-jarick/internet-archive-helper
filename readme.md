# ia_helper

Scripts to easily enable downloading a specific set of files from an internet archive by using a text file with a list of names.
All 3 scripts perform the same actions, just implemented in different languages.

The idea being I can simple keep a inputlist.txt in the parent directory and update as needed.

## ia_helper.sh

**FASTEST** now that it makes use of gnu parallel

shell script implementation using grep and parallel (previously xargs)

<pre>ia_helper.sh archive inputlist.txt</pre>

## ia_helper.pl
perl implementation

<pre>ia_helper.pl archive inputlist.txt</pre>

## ia_helper.py
python implemention

<pre>ia_helper.py archive inputlist.txt</pre>

# Example

using archive https://archive.org/details/drawingmadeeasyh00lutz

inputlist.txt:
<pre>
drawingmadeeasyh00lutz.pdf
drawingmadeeasyh00lutz_bw.pdf
drawingmadeeasyh00lutz_jp2.zip
</pre>

command:
<pre>ia_helper.sh drawingmadeeasyh00lutz inputlist.txt</pre>

# Notes

Archive name is in the url

eg for the URL https://archive.org/details/drawingmadeeasyh00lutz

the archive name is **drawingmadeeasyh00lutz**

List of files can be viewed by clicking "SHOW ALL" under "DOWNLOAD OPTIONS"

# Reference

https://archive.org/services/docs/api/internetarchive/cli.html
