# ia_helper

Scripts to easily enable downloading a specific set of files from an internet archive by using a text file with a list of names.
All 3 scripts perform the same actions, just implemented in different languages.

The idea being I can simple keep a inputlist.txt in the parent directory and update as needed.

## ia_helper.pl
perl implementation

<pre>ia_helper.pl archive inputlist.txt</pre>

## ia_helper.py
python implemention

<pre>ia_helper.py archive inputlist.txt</pre>

## ia_helper.sh
shell script implementation using grep and xargs

note: leading and trailing whitespaces not handled.

<pre>ia_helper.sh archive inputlist.txt</pre>

# Example

inputlist.txt:
<pre>TripDown1905_512kb.mp4
TripDown1905.ogv</pre>

command:
<pre>ia_helper.sh TripDown1905 inputlist.txt</pre>
