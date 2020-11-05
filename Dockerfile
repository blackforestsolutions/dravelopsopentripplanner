FROM openjdk:11-jre-slim
LABEL maintainer="Matthias Burkert <to.matthiasburkerttriberg@gmail.com>"
ENV OTP_VERSION=1.4.0
ENV OTP_FILENAME=otp.jar
ENV REGION=bw
ENV JAVA_OPTIONS=-Xmx2G
VOLUME /tmp
ADD https://repo1.maven.org/maven2/org/opentripplanner/otp/$OTP_VERSION/otp-$OTP_VERSION-shaded.jar /usr/local/share/java/
ADD https://repo1.maven.org/maven2/org/opentripplanner/otp/$OTP_VERSION/otp-$OTP_VERSION-shaded.jar /

#Graph
RUN mkdir graphs && cd graphs
RUN mkdir $REGION
COPY /graphs/$REGION /graphs/$REGION

RUN ln -s otp-$OTP_VERSION-shaded.jar /usr/local/share/java/otp.jar

RUN ln -s otp-$OTP_VERSION-shaded.jar otp.jar

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/usr/local/share/java/otp.jar"]