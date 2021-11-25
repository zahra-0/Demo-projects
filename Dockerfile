FROM openjdk:8

RUN mkdir -p /user/mvn

ADD  https://dlcdn.apache.org/maven/maven-3/3.8.4/binaries/apache-maven-3.8.4-bin.tar.gz /user/mvn/mvn.tar.gz

RUN tar -xzf /user/mvn/mvn.tar.gz -C /user/mvn --strip-components=1 \
 && rm -f /user/mvn/mvn.tar.gz \
 && ln -s /user/mvn/bin/mvn /usr/bin/mvn

ENV MAVEN_HOME /user/mvn
ENV MAVEN_CONFIG "$USER_HOME_DIR/.m2"

WORKDIR /root

COPY src /home/app/src
COPY pom.xml /home/app
#RUN mvn -f /home/app/pom.xml clean package

CMD mvn -f /home/app/pom.xml clean install