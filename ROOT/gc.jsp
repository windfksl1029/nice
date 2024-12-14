import java.nio.ByteBuffer;

public class GCTest {
    public static void main(String[] args) throws InterruptedException {
        for (int i = 0; i < 1000000; i++) {
            ByteBuffer buf = ByteBuffer.allocate(100 * 1024);
            long used = Runtime.getRuntime().totalMemory() - Runtime.getRuntime().freeMemory();
            String s = "prefix" + i + ", prefix=" + used;
            System.out.println(s);
            Thread.sleep(1);
        }
    }
}
