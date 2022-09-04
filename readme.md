# ia_helper

Script to easily enable downloading a specific set of files from an internet archive by using a text file with a list of names.

The idea being I can simple keep a inputlist.txt in the parent directory and update as needed.

## ia_helper.sh

shell script implementation using grep and parallel (previously xargs)

usage:
<pre>ia_helper.sh ARCHIVENAME INPUTLISTFILE DIRPREFIX</pre>

ARCHIVENAME - name of internet archive

INPUTLISTFILE - input file, eg files.txt

DIRPREFIX - optional directory prefix for archives where the files you wish to download are all stored under the same sub directory

# Example 1

using archive https://archive.org/details/drawingmadeeasyh00lutz

inputlist.txt:
<pre>
drawingmadeeasyh00lutz.pdf
drawingmadeeasyh00lutz_bw.pdf
drawingmadeeasyh00lutz_jp2.zip
</pre>

command:
<pre>ia_helper.sh rvz-gc-europe-redump inputlist.txt</pre>

# Example 2

note: this example uses the optional prefix argument

using archive https://archive.org/details/rvz-gc-europe-redump

inputlist.txt:
<pre>
Billy Hatcher and the Giant Egg (Europe) (Demo).rvz
Interactive Multi-Game Demo Disk - April 2003 (Australia) (En,Fr,De,Es,It).rvz
</pre>

command:
<pre>ia_helper.sh drawingmadeeasyh00lutz inputlist.txt RVZ-GC-EUROPE-REDUMP/</pre>

# Example 3

note: same as example 2 but no prefix argument is used

using archive https://archive.org/details/rvz-gc-europe-redump

inputlist.txt:
<pre>
RVZ-GC-EUROPE-REDUMP/Billy Hatcher and the Giant Egg (Europe) (Demo).rvz
RVZ-GC-EUROPE-REDUMP/Interactive Multi-Game Demo Disk - April 2003 (Australia) (En,Fr,De,Es,It).rvz
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
