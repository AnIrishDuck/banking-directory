import os, json, re, sys
import uuid

prior = json.load(open(sys.argv[1]))

def process(entry):
    entry['uuid'] = entry.get('uuid') or str(uuid.uuid4())
    return entry

processed = [process(entry) for entry in prior['data']]
print json.dumps({"data": [entry for entry in processed if entry]})
