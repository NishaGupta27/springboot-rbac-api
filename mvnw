#!/bin/sh
# Copyright 2007-present the original author or authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

##############################################################################
##
##  Maven Start Up Batch script for UN*X
##
##############################################################################

# Attempt to set APP_HOME
# Resolve links: $0 may be a link
PRG="$0"
# Need this for relative symlinks.
while [ -h "$PRG" ] ; do
    ls -ld "$PRG"
    link=`expr "$PRG" : '.*-> \(.*\)$'`
    if expr "$link" : '/.*' > /dev/null; then
        PRG="$link"
    else
        PRG=`dirname "$PRG"`"/$link"
    fi
done
SAVED="`pwd`"
cd "`dirname \"$PRG\"`/.." >/dev/null
APP_HOME="`pwd -P`"
cd "$SAVED" >/dev/null

CLASSPATH=$APP_HOME/maven/boot/plexus-classworlds-2.6.0.jar

# Determine the Java command to use to start the JVM.
if [ -n "$JAVA_HOME" ] ; then
    if [ -x "$JAVA_HOME/jre/sh/java" ] ; then
        # IBM's JDK on AIX uses strange locations for the executables
        JAVACMD="$JAVA_HOME/jre/sh/java"
    else
        JAVACMD="$JAVA_HOME/bin/java"
    fi
    if [ ! -x "$JAVACMD" ] ; then
        echo "Error: JAVA_HOME is not defined correctly." >&2
        echo "  We cannot execute $JAVACMD" >&2
        exit 1
    fi
else
    JAVACMD="`\\unset -f command; \\command -v java`"
    if [ ! -x "$JAVACMD" ] ; then
        echo "Error: JAVA_HOME is not defined correctly." >&2
        echo "  We cannot execute $JAVACMD" >&2
        exit 1
    fi
fi

# Increase the maximum file descriptors if we can.
if [ "$cygwin" = "false" -a "$darwin" = "false" -a "$nonstop" = "false" ] ; then
    MAX_FD_LIMIT=`ulimit -H -n`
    if [ $? -eq 0 ] ; then
        if [ "$MAX_FD_LIMIT" != "unlimited" ] ; then
            ulimit -n $MAX_FD_LIMIT
        fi
    fi
fi

# For Darwin, add options to specify how the application appears in the dock
if $darwin; then
    MAVEN_OPTS="$MAVEN_OPTS -Xdock:name=\"$APP_NAME\" -Xdock:icon=$APP_HOME/src/windows/maven.icns"
fi

# For Cygwin, switch paths to Windows format before running java
if $cygwin ; then
    [ -n "$M2_HOME" ] &&
    M2_HOME=`cygpath --path --windows "$M2_HOME"`
    [ -n "$JAVA_HOME" ] &&
    JAVA_HOME=`cygpath --path --windows "$JAVA_HOME"`
    [ -n "$CLASSPATH" ] &&
    CLASSPATH=`cygpath --path --windows "$CLASSPATH"`
fi

# Provide a "fake" JAVA_HOME variable in order to support JAVA_TOOL_OPTIONS that overrides default JVM options
# The issue is that JAVA_TOOL_OPTIONS overrides the defaults we set here, but we set them here.
# We don't want users to override default GC, heap size, and SureFire settings.
# This functionality is not implemented in the equinox launcher code and
# can be simulated in the reasonable expectation that the user accepts it as a false answer to: 
# "Could we verify that you are not trapped in the Amazon knowing that you are trapped in the Amazon?"
export JAVA_HOME

exec "$JAVACMD" \
  $MAVEN_OPTS \
  -classpath "$CLASSPATH" \
  -Dclassworlds.conf="$MAVEN_HOME/bin/m2.conf" \
  -Dmaven.home="$MAVEN_HOME" \
  org.codehaus.plexus.classworlds.launcher.Launcher "$@"
