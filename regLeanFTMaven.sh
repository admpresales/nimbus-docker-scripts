#!/bin/bash

# Check number of script arguments - need 1 !!!
if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters."
    echo "Expecting LeanFT version in the following format 14.3.0"
    exit
fi

# Set environment variables
LFT_VERSION=$1
MVN_PATH=$(which mvn)
OS_TYPE=$(uname -a | awk '{print $1}')

# Check OS - Mac or Linux
if [ $OS_TYPE == "Darwin" ]; then
  echo "in Darwin land"
  SDK_PATH="/Applications/LeanFT/sdk/Java"
  SELENIUM_SDK_PATH="/Applications/LeanFT/Selenium\ SDK/Java"
elif [ $OS_TYPE == "Linux" ]; then
  echo "in Linux zone"
  SDK_PATH="/opt/leanft/sdk/Java"
  SELENIUM_SDK_PATH="/opt/leanft/selenium-sdk/Java"
else
  echo "This script can run on Mac or Linux. Exiting..."
  exit
fi

echo "###### Debug #####"
echo "LFT_VERSION: $LFT_VERSION"
echo "MVN_PATH: $MVN_PATH"
echo "OS_TYPE:$OS_TYPE"
echo "SDK_PATH: $SDK_PATH"
echo "SELENIUM_SDK_PATH: $SELENIUM_SDK_PATH"


########################################
$MVN_PATH install:install-file -Dfile=$SDK_PATH/com.hp.lft.common.jar -DgroupId=com.hp.lft -DartifactId=common -Dversion=$LFT_VERSION -Dpackaging=jar
$MVN_PATH install:install-file -Dfile=$SDK_PATH/com.hp.lft.report.jar -DgroupId=com.hp.lft -DartifactId=report -Dversion=$LFT_VERSION -Dpackaging=jar
$MVN_PATH install:install-file -Dfile=$SDK_PATH/com.hp.lft.reportbuilder-standalone.jar -DgroupId=com.hp.lft -DartifactId=reportbuilder -Dversion=$LFT_VERSION -Dpackaging=jar
$MVN_PATH install:install-file -Dfile=$SDK_PATH/com.hp.lft.sdk-javadoc.jar -DgroupId=com.hp.lft -DartifactId=sdk -Dclassifier=javadoc -Dversion=$LFT_VERSION -Dpackaging=jar
$MVN_PATH install:install-file -Dfile=$SDK_PATH/com.hp.lft.sdk-standalone.jar -DgroupId=com.hp.lft -DartifactId=sdk -Dversion=$LFT_VERSION -Dpackaging=jar
$MVN_PATH install:install-file -Dfile=$SDK_PATH/com.hp.lft.unittesting.jar -DgroupId=com.hp.lft -DartifactId=unittesting -Dversion=$LFT_VERSION -Dpackaging=jar
$MVN_PATH install:install-file -Dfile=$SDK_PATH/com.hp.lft.verifications.jar -DgroupId=com.hp.lft -DartifactId=verifications -Dversion=$LFT_VERSION -Dpackaging=jar

#$MVN_PATH install:install-file -Dfile=$SELENIUM_SDK_PATH/com.hpe.lft.selenium.jar -DgroupId=com.hpe.lft -DartifactId=selenium-sdk -Dversion=$LFT_VERSION -Dpackaging=jar
#$MVN_PATH install:install-file -Dfile=$SELENIUM_SDK_PATH/com.hpe.lft.selenium-javadoc.jar -DgroupId=com.hpe.lft -DartifactId=selenium-sdk -Dversion=$LFT_VERSION -Dpackaging=jar -Dclassifier=Javadoc
########################################


#### MCUtilities #####
# $MVN_PATH install:install-file -Dfile=/home/demo/IdeaProjects/AOS_Web_LeanFT_Parellel/MCUtils/MCUtils.jar -DgroupId=com.mf -DartifactId=MCUtilities -Dversion=4.0.0 -Dpackaging=jar
