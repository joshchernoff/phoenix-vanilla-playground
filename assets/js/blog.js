document.addEventListener("DOMContentLoaded", () => {
  import("./user_socket.js").then(({ socket }) => {
    let posts_chan = socket.channel("room:posts", {});

    posts_chan
      .join()
      .receive("ok", (resp) => {
        console.log("Joined posts successfully", resp);
      })
      .receive("error", (resp) => {
        console.log("Unable to join posts", resp);
      });

    posts_chan.on("likes", (payload) => {
      console.log(payload);
    });
  });
});
