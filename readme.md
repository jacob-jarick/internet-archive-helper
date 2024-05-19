# ia_helper

Shell script to easily enable downloading a specific set of files from an internet archive by using a text file with a list of names.

The idea being I can simple keep a inputlist.txt in the parent directory and update as needed.

Implemented using grep and parallel

# making an inputlist

<pre>ia list the-3do-company-3do-1g1r-chd-perfect-collection > the-3do-company-3do-1g1r-chd-perfect-collection.txt</pre>

note input list name must match collection name with .txt on the end like the above example.

# Usage
<pre>ia_helper.sh INPUTLISTFILE DIRPREFIX</pre>

INPUTLISTFILE - input file named ARCHIVENAME.txt

ARCHIVENAME - Name of internet archive

DIRPREFIX - optional directory prefix for archives where the files you wish to download are all stored under the same sub directory

## Optional Overrides

parallel jobs, default 2 can be changed by setting env variable PJOBS

<pre>export PJOBS=1</pre>

# Example 1

<pre>

# change to dest directory
cd /mnt/super/Roms/3do

# generate items list (optionally edit items list to remove unwanted files)
ia list the-3do-company-3do-1g1r-chd-perfect-collection > the-3do-company-3do-1g1r-chd-perfect-collection.txt

# fetch
/home/mem/bin/ia_helper.sh the-3do-company-3do-1g1r-chd-perfect-collection.txt
</pre>

# Example 2

using archive https://archive.org/details/drawingmadeeasyh00lutz

drawingmadeeasyh00lutz.txt:
<pre>
drawingmadeeasyh00lutz.pdf
drawingmadeeasyh00lutz_bw.pdf
drawingmadeeasyh00lutz_jp2.zip
</pre>

command:
<pre>ia_helper.sh drawingmadeeasyh00lutz.txt</pre>

# Example 3

note: this example uses the optional prefix argument

using archive https://archive.org/details/rvz-gc-europe-redump

rvz-gc-europe-redump.txt:
<pre>
Billy Hatcher and the Giant Egg (Europe) (Demo).rvz
Interactive Multi-Game Demo Disk - April 2003 (Australia) (En,Fr,De,Es,It).rvz
</pre>

command:
<pre>ia_helper.sh rvz-gc-europe-redump.txt RVZ-GC-EUROPE-REDUMP/</pre>

# Example 4

note: same as example 3 but no prefix argument is used

using archive https://archive.org/details/rvz-gc-europe-redump

rvz-gc-europe-redump.txt:
<pre>
RVZ-GC-EUROPE-REDUMP/Billy Hatcher and the Giant Egg (Europe) (Demo).rvz
RVZ-GC-EUROPE-REDUMP/Interactive Multi-Game Demo Disk - April 2003 (Australia) (En,Fr,De,Es,It).rvz
</pre>

command:
<pre>ia_helper.sh rvz-gc-europe-redump.txt</pre>


# Notes

## IA CLI tool

must be installed in bin path

eg: /usr/local/bin/ia

## Archive Name

Archive name is in the url

eg for the URL https://archive.org/details/drawingmadeeasyh00lutz

the archive name is **drawingmadeeasyh00lutz**

## Archive File List

List of files can be viewed by clicking "SHOW ALL" under "DOWNLOAD OPTIONS"

## Input File

INPUTLISTFILE - lines starting with # are ignored

# Reference

https://archive.org/services/docs/api/internetarchive/cli.html
