#!/usr/bin/env bash

echo "[-->] Obtendo artifactId do pom.xml"
ARTIFACT=$(mvn -q \
-Dexec.executable=echo \
-Dexec.args='${project.artifactId}' \
--non-recursive \
exec:exec);
echo "artifactId: '$ARTIFACT'"

echo "[-->] Obtendo versão do projeto do pom.xml"
VERSION=$(mvn -q \
  -Dexec.executable=echo \
  -Dexec.args='${project.version}' \
  --non-recursive \
  exec:exec);
echo "versão: '$VERSION'"

echo "[-->] Obtendo a classe principal do pom.xml (propriedade: 'start-class')"
MAINCLASS=$(mvn -q \
-Dexec.executable=echo \
-Dexec.args='${start-class}' \
--non-recursive \
exec:exec);
echo "Classe principal: '$MAINCLASS'"

echo "[-->] Limpando a pasta target e criando uma nova pasta"
rm -rf target
mkdir -p target/native-image

echo "[-->] Construindo aplicação Spring Boot com mvn package"
mvn -DskipTests package

echo "[-->] Extraindo o fat jar"
JAR="$ARTIFACT-$VERSION.jar"
cd target/native-image
jar -xvf ../$JAR >/dev/null 2>&1
cp -R META-INF BOOT-INF/classes

echo "[-->] Criando o classpath com o conteúdo do fat jar"
LIBPATH=`find BOOT-INF/lib | tr '\n' ':'`
CP=BOOT-INF/classes:$LIBPATH

GRAALVM_VERSION=`native-image --version`
echo "[-->] Compilando aplicação Spring Boot '$ARTIFACT' com o $GRAALVM_VERSION"
time native-image \
  -J-Xmx4G \
  -H:+TraceClassInitialization \
  -H:Name=$ARTIFACT \
  -H:+ReportExceptionStackTraces \
  -Dspring.native.remove-unused-autoconfig=true \
  -Dspring.native.remove-yaml-support=true \
  -cp $CP $MAINCLASS;