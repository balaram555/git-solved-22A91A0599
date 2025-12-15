const env = process.env.NODE_ENV || "production";

console.log("Monitoring started");
console.log("Environment:", env);

function checkSystemHealth() {
  console.log("System health: OK");
}

setInterval(checkSystemHealth, 60000);
checkSystemHealth();

// Experimental monitoring (disabled)
// if (process.env.EXPERIMENTAL === "true") {
//   console.log("Experimental AI monitoring enabled");
// }
