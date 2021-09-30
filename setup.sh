#!/bin/bash

cd
if [ ! -d FtcRobotCode-`date +%Y` ]
then
	mkdir -p FtcRobotCode-`date +%Y`
fi

echo "Year:"
read YEAR

echo "Version"
read VERSION

cd FtcRobotCode-$YEAR
curl -L https://github.com/FIRST-Tech-Challenge/FtcRobotController/archive/v$VERSION.zip >FtcRobotController-$VERSION.zip
unzip FtcRobotController-$VERSION

CURRHOMEPATH=`pwd`;
for i in A B C; do
	cp -r FtcRobotController-$VERSION FtcRobotController-$VERSION-$i
	cd FtcRobotController-$VERSION-$i/TeamCode/src/main/java/org/firstinspires/ftc/
	rm -rf teamcode
	git clone https://github.com/ftcwaylandmi/$YEAR-$i.git teamcode
	cd $CURRHOMEPATH;
done

rm -rf FtcRobotController-$VERSION
rm -rf FtcRobotController-$VERSION.zip
