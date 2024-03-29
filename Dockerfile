FROM openjdk:11-jre-slim
LABEL maintainer="Matthias Burkert <to.matthiasburkerttriberg@gmail.com>"

ENV OTP_VERSION=2.0.0
ENV OTP_FILENAME=otp.jar
ENV JAVA_OPTIONS=-Xmx2G
ENV PORT=9000
ENV SECURE_PORT=9001
ENV DEPLOY_FOLDER_RUN_TIME=bw-fast
ARG DEPLOY_FOLDER_BUILD_TIME=bw-fast

ADD https://repo1.maven.org/maven2/org/opentripplanner/otp/$OTP_VERSION/otp-$OTP_VERSION-shaded.jar /

RUN mkdir projects && cd projects
RUN mkdir $DEPLOY_FOLDER_BUILD_TIME

COPY /projects/$DEPLOY_FOLDER_BUILD_TIME /projects/$DEPLOY_FOLDER_BUILD_TIME

RUN ln -s otp-$OTP_VERSION-shaded.jar $OTP_FILENAME.jar

ENTRYPOINT java $JAVA_OPTIONS -Djava.security.egd=file:/dev/./urandom -jar $OTP_FILENAME.jar --build --serve /projects/$DEPLOY_FOLDER_RUN_TIME --port $PORT --securePort $SECURE_PORT
