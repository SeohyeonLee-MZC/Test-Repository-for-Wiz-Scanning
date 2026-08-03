FROM ubuntu:20.04
LABEL maintainer="SAMATE, NIST"
WORKDIR /opt
ARG GRADLE_VERSION=2.11
ARG JAVA_VERSION=8
RUN apt-get update && apt-get install -y --no-install-recommends \
    libncurses5 libstdc++6 lib32stdc++6 lib32z1 zlib1g curl make unzip \
    openjdk-${JAVA_VERSION}-jdk && \
    curl -LO https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip && \
    unzip gradle-${GRADLE_VERSION}-bin.zip && \
    rm gradle-${GRADLE_VERSION}-bin.zip
ENV ANDROID_HOME=/opt/android/sdk
RUN mkdir -p ${ANDROID_HOME} && \
    curl -LO https://dl.google.com/android/repository/commandlinetools-linux-6858069_latest.zip && \
    unzip commandlinetools*.zip -d ${ANDROID_HOME} && \
    rm commandlinetools*.zip
ENV PATH=${ANDROID_HOME}/emulator:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/cmdline-tools/bin:${ANDROID_HOME}/platform-tools:${PATH}
RUN mkdir ~/.android && echo '### User Sources for Android SDK Manager' > ~/.android/repositories.cfg
RUN yes | sdkmanager --sdk_root=$ANDROID_HOME --licenses
RUN sdkmanager --sdk_root=$ANDROID_HOME --install "platforms;android-19"
RUN sdkmanager --sdk_root=$ANDROID_HOME --install "build-tools;19.1.0"
WORKDIR /sard
COPY . .
