#!/bin/bash
NAME=server

cp -r skeleton/ $NAME/
chmod 755 -R $NAME/
find $NAME/ -name "*.py" -exec chmod 644 {} \;
mv $NAME/skeleton $NAME/$NAME
mv $NAME/tests/skeleton_tests.py $NAME/tests/$NAME"_tests.py"
