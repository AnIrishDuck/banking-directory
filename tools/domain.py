import sys
from urlparse import urlparse

print urlparse(sys.argv[1]).netloc
