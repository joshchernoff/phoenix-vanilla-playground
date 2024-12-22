document.addEventListener("DOMContentLoaded", () => {
  console.log("Document is fully loaded and parsed.");

  const button = document.createElement("button");
  button.textContent = "Load Feature";
  document.body.appendChild(button);

  button.addEventListener("click", async () => {
    console.log("Button clicked! Loading feature...");

    // Dynamically import the module
    import("./user_socket.js").then((module) => {
      module.channel.on("shout", (payload) => {
        console.log(payload);
      });

      document.getElementById("shout").addEventListener("click", () => {
        module.channel.push("shout", { payload: "foobar" });
      });
    });
  });
});
