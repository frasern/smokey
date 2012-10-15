#!/bin/bash

cd /opt/smokey;

source /etc/smokey.sh

if [ x$2 = xunprio ]; then
  ARG="-t ~@high -t ~@medium -t ~@low"
else
  ARG="-t @$2"
fi

for i in `find features -name "*.feature"`; do
  for priority in high medium low unprio; do
    if [ "x${priority}" != "xunprio" ]; then
      runpriority="-t @${priority}";
    else
      runpriority="-t ~@high -t ~@medium -t ~@low";
    fi
    tmpfeature=${i##*/}
    feature=${tmpfeature%%.*}
    bundle exec cucumber $i --format Cucumber::Formatter::Nagios -t ~@pending -t ~@notnagios $runpriority > /tmp/smokey_${feature}_${priority}
  done;
done;