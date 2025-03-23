public class dfg {
    public static void main(String[] args) {
        int in = 0;

        for (float y = 2.5f; y > -2.0f; y -= 0.12f) {
            for (float x = -2.3f; x < 2.3f; x += 0.041f) {
                
                float a = x * x + y * y - 4f;

                if ((a * a * a - x * x * y * y * y) < -0.0f) {
                    
                    String str = "I Love you";
                    int num = in % str.length();

                    System.out.print(str.charAt(num));

                    in++;
                } else {
                    System.out.print(" ");
                }
            }

            System.out.println();
            try {
                Thread.sleep(100);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}
