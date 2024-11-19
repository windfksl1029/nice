<%
    int iterations = 30001;
    String result = "";

    long startTime = System.currentTimeMillis();
    for (int i = 0; i < iterations; i++) {
        result += " " + i;
    }
    long endTime = System.currentTimeMillis();
    out.println("Inefficient concatenation took " + (endTime - startTime) + " milliseconds");
%>
