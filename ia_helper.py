#!/bin/python3

import sys
import os
import re

if len(sys.argv) != 3:
  print ('usage: ia_helper.py archive input_file.txt')
  sys.exit()

r = re.compile(r"^\s+|\n+|\r+")

with open(sys.argv[2]) as file:
    for line in file:
        line = r.sub("", line)

        if line == "":
            continue

        print("GET: " + line)
        cmd = "ia download " + sys.argv[1] + " \"" + line + "\""
        if os.system(cmd) != 0:
            sys.exit()
