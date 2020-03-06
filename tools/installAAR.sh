#!/bin/sh

GROUP=jp.adfully
ARTIFACT=adfurikunsdk
VERSION=3.3.1
PACKAGING=aar

mvn clean dependency:copy -DgroupId=$GROUP -DartifactId=$ARTIFACT -Dversion=$VERSION -Dtype=$PACKAGING -U

mvn install:install-file -DgroupId=$GROUP -DartifactId=$ARTIFACT -Dversion=$VERSION \
-Dfile=target/$ARTIFACT-$VERSION.$PACKAGING \
-Dpackaging=$PACKAGING \
-DpomFile=target/$ARTIFACT-$VERSION.pom \
-DlocalRepositoryPath=../ \
-DcreateChecksum=true

md5 target/$ARTIFACT-$VERSION.$PACKAGING
rm -r ./target

