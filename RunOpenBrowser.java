import java.awt.Desktop;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;

public class RunOpenBrowser {
    public static void main(String[] args) {
        try {
            String url = "http://localhost:8082/War_JAVA/Demo.jsp";
            Desktop.getDesktop().browse(new URI(url));
        } catch (IOException | URISyntaxException e) {
            e.printStackTrace();
        }
    }
}
