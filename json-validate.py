#!/usr/bin/env python

import json
import os
import fnmatch
import sys


def locate(pattern, root=os.curdir):
    '''Locate all files matching supplied filename pattern in and below
    supplied root directory.
    '''
    for path, dirs, files in os.walk(os.path.abspath(root)):
        for filename in fnmatch.filter(files, pattern):
            yield os.path.join(path, filename)


def json_validator(data):
    try:
        json.loads(data)
        return True
    except ValueError as error:
        print("invalid json: %s" % error)
        sys.exit(1)


# main
print("validate json files")

for file in locate("*.json"):
    print(file)
    with open(file, 'r') as payload:
        json_validator(payload.read())

print("all json files are validated successfully")
