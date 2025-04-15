allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

buildscript {
    dependencies {
        classpath 'com.google.gms:google-services:4.3.15'
    }
}

plugins {
    id("com.google.gms.google-services") version "4.3.15" apply false
}
