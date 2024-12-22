document.addEventListener("DOMContentLoaded", () => {
  console.log("Document is fully loaded and parsed.");

  const button = document.createElement("button");
  button.textContent = "Load Feature";
  document.body.appendChild(button);

  button.addEventListener("click", async () => {
    console.log("Button clicked! Loading feature...");

    // Dynamically import the module
    const { loadFeature } = await import("./feature.js");

    // Use the imported module
    const result = loadFeature();
    console.log(result);
  });
});
