FROM openjdk:11-jre-slim
LABEL maintainer="Matthias Burkert <to.matthiasburkerttriberg@gmail.com>"

ENV OTP_VERSION=2.0.0
ENV OTP_FILENAME=otp.jar
ENV REGION=bw
ENV JAVA_OPTIONS=-Xmx2G

ADD https://repo1.maven.org/maven2/org/opentripplanner/otp/$OTP_VERSION/otp-$OTP_VERSION-shaded.jar /

RUN mkdir projects && cd projects
RUN mkdir $REGION

COPY /projects/$REGION /projects/$REGION

RUN ln -s otp-$OTP_VERSION-shaded.jar $OTP_FILENAME.jar

ENTRYPOINT java $JAVA_OPTIONS -Djava.security.egd=file:/dev/./urandom -jar $OTP_FILENAME.jar --build --serve /projects/$REGION