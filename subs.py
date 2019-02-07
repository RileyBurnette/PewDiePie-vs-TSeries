#!/usr/bin/env python3
"""
sub to pewdiepie
"""

import sys
import urllib

def supports_color():
  """
  Returns True if the running system's terminal supports color, and False
  otherwise.
  """
  plat = sys.platform
  supported_platform = plat != 'Pocket PC' and (plat != 'win32' or
                                                  'ANSICON' in os.environ)
  # isatty is not always implemented, #6223.
  is_a_tty = hasattr(sys.stdout, 'isatty') and sys.stdout.isatty()
  if not supported_platform or not is_a_tty:
    return False
  return True

from sys import argv
import json

try:
  from urllib.request import urlopen
except:
  from urllib import urlopen

try:
  from console import clear
except:
  def clear():
    if supports_color():
      sys.stdout.write(u"{}[2J{}[;H".format(chr(27), chr(27)))
    else:
      print("")
  
from time import sleep
import ssl

context = ssl._create_unverified_context()

def main():
  pewdiepie = "pewdiepie"
  key = "AIzaSyDOi4pJwTjAQw4xQ3G0CAH_zpht6-ajVkQ"

  data = urlopen("https://www.googleapis.com/youtube/v3/channels?part=statistics&forUsername="+pewdiepie+"&key="+key, context=context).read()
  subs = json.loads(data)["items"][0]["statistics"]["subscriberCount"]

  data2 = urlopen("https://www.googleapis.com/youtube/v3/channels?part=statistics&forUsername="+"tseries"+"&key="+key, context=context).read()
  subs2 = json.loads(data2)["items"][0]["statistics"]["subscriberCount"]

  clear()

  if int(subs) < int(subs2):
    print("YouTube is dead")

  print("PewDiePie" + " has " + "{:,d}".format(int(subs)) + " subscribers!")
  print("T-Series" + " has " + "{:,d}".format(int(subs2)) + " subscribers!")
  print("Difference between PewDiePie and T-Series:", "{:,d}".format(int(subs)-int(subs2)))
  
if "__main__" == __name__:
  if "T-Gay" in argv:
    print("Subscribe to PewDiePie.")
    print("Unsubscribe from T-Series")
  
while True:
  try:
    main()
    sleep(0.1)
  except KeyboardInterrupt:
    print("Don't forget to subsribe to PewDiePie!!!!")
    raise SystemExit
  except urllib.error.URLError as e:
    print(e.reason)
    raise SystemExit
