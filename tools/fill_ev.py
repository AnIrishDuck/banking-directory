import os, json, re, sys
from urlparse import urlparse

prior = json.load(open(sys.argv[1]))

def check_domain(cn, url):
    root = lambda domain: list(reversed(domain.lower().split('.')))[0:2]
    return root(cn) == root(url)

def ev(domain):
    data = "domain/ev/{0}".format(domain)
    if os.path.exists(data):
        slurp = open(data).read().split('\n')[0].replace('Subject:', '')
        parts = [part.strip().split('=') for part in re.split('[,/]', slurp)]
        parts = dict(kv for kv in parts if len(kv) == 2)
        state = parts.get('jurisdictionST') or parts.get('ST') or None

        if not check_domain(parts['CN'], domain):
            return []

        pieces = [
            parts['CN'],
            parts['O'],
            "{0}, {1}".format(state, parts['jurisdictionC'])
        ]
        return pieces
    else:
        return []

def process(entry):
    entry['ssl'] = ev(urlparse(entry['url']).netloc)
    return entry

processed = [process(entry) for entry in prior['data']]
print json.dumps({"data": [entry for entry in processed if entry]})
