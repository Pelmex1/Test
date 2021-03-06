apply plugin: 'java'

sourceCompatibility = 1.8

compileJava.options.encoding = "UTF-8"
compileTestJava.options.encoding = "UTF-8"

repositories {
    mavenLocal()
    mavenCentral()
    maven { url 'https://jitpack.io' }
    maven { url 'https://hub.spigotmc.org/nexus/content/repositories/snapshots' }
}

ext {
    spigot_version = '1.16.4-R0.1-SNAPSHOT' // this is for spigot, u can get it using `version` command
}

dependencies {
    implementation "org.spigotmc:spigot-api:$spigot_version"
}

jar {
    duplicatesStrategy = 'include'
    archiveFileName = "${project.archivesBaseName}.jar"
    from{ configurations.compileClasspath.collect{ it.isDirectory() ? it : it.name.endsWith("pom") ? it : zipTree(it)}}

}
