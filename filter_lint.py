#!/usr/bin/python2
import sys
import re

cur_file = None
printed_file = False

for line in sys.stdin:
    line = line.strip()
    if line.startswith('Evaluating'):
        cur_file = line
        printed_file = False
    else:
        if not printed_file:
            print(cur_file)
            printed_file = True
        print('\t' + line)
