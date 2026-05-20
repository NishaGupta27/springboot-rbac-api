import java.net.*;
import java.io.*;
import java.nio.channels.*;
import java.util.Properties;

public class MavenWrapperDownloader {
    private static final String WRAPPER_VERSION = "3.2.0";
    private static final String DEFAULT_DOWNLOAD_URL = "https://repo.maven.apache.org/maven2/org/apache/maven/wrapper/maven-wrapper/3.2.0/maven-wrapper-3.2.0.jar";

    public static void main(String[] args) throws Exception {
        File mavenWrapperPropertyFile = new File(".mvn/wrapper/maven-wrapper.properties");
        String url = DEFAULT_DOWNLOAD_URL;
        if (mavenWrapperPropertyFile.exists()) {
            Properties mavenWrapperProperties = new Properties();
            mavenWrapperProperties.load(new FileInputStream(mavenWrapperPropertyFile));
            url = mavenWrapperProperties.getProperty("wrapperUrl", url);
        }

        File outputFile = new File(".mvn/wrapper/maven-wrapper.jar");
        if (!outputFile.getParentFile().exists() && !outputFile.getParentFile().mkdirs()) {
            System.err.println("- ERROR creating output directory '" + outputFile.getParentFile().getAbsolutePath() + "'");
            System.exit(1);
        }
        System.out.println("- Downloading from: " + url);

        File downloadedFile = new File(System.getProperty("java.io.tmpdir"), "maven-wrapper.jar");
        if (!downloadedFile.getParentFile().exists() && !downloadedFile.getParentFile().mkdirs()) {
            System.err.println("- ERROR creating temp directory '" + downloadedFile.getParentFile().getAbsolutePath() + "'");
            System.exit(1);
        }
        try {
            downloadFileFromURL(url, downloadedFile);
            if (!downloadedFile.renameTo(outputFile)) {
                System.err.println("- ERROR installing maven-wrapper.jar into: " + outputFile.getAbsolutePath());
                System.exit(1);
            }
        } catch (Throwable e) {
            System.err.println("- Error downloading " + url);
            e.printStackTrace();
            System.exit(1);
        }
        System.out.println("- Downloading complete");
    }

    private static void downloadFileFromURL(String urlString, File destination) throws Exception {
        URL website = new URL(urlString);
        ReadableByteChannel rbc;
        rbc = Channels.newChannel(website.openStream());
        FileOutputStream fos = new FileOutputStream(destination);
        fos.getChannel().transferFrom(rbc, 0, Long.MAX_VALUE);
        fos.close();
        rbc.close();
    }
}
