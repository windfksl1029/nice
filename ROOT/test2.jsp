<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>GC Testing with JavaScript</title>
    <style>
        #output {
            margin-top: 20px;
            border: 1px solid #ccc;
            padding: 10px;
            font-family: Arial, sans-serif;
        }
    </style>
</head>
<body>
    <h1>GC Testing with JavaScript</h1>
    
    <div id="output"></div>

    <script type="text/javascript">
        function allocateMemory() {
          var megabytes = 10;
          var memory = new Array(megabytes * 1024 * 1024);
          return memory;
        }

        function performGC() {
          if (typeof window.gc === 'function') {
            window.gc();
          } else if (typeof window.CollectGarbage === 'function') {
            for (var i = 0; i < 3; i++) {
              window.CollectGarbage();
            }
          }
        }

        function runGC() {
          var iteration = 1;
          var output = document.getElementById("output");
          output.innerHTML = ""; // Clear previous output
          
          function appendOutput(message) {
            output.innerHTML += message + "<br/>";
          }
          
          function formatMemorySize(bytes) {
            return (bytes / (1024 * 1024)).toFixed(2) + "MB";
          }

          function iterate() {
            appendOutput("Iteration: " + iteration);
            var memory = allocateMemory();
            appendOutput("Allocated " + formatMemorySize(memory.length) + " of memory");
            iteration++;
            performGC();
            appendOutput("Garbage collection performed");

            // Adjust the number of iterations as desired
            if (iteration <= 10) {
              setTimeout(iterate, 1000); // Delay between iterations (1000ms = 1s)
            }
          }

          iterate();
        }

        runGC();
    </script>
</body>
</html>


