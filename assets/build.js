import { context, build } from "esbuild";
import autoprefixer from "autoprefixer";
import postCssPlugin from "@deanc/esbuild-plugin-postcss";
import postCSSNested from "postcss-nested";

const args = process.argv.slice(2);
const watch = args.includes("--watch");
const deploy = args.includes("--deploy");

const loader = {
  // Add loaders for images/fonts/etc, e.g. { '.svg': 'file' }
};

const plugins = [
  postCssPlugin({
    plugins: [autoprefixer, postCSSNested],
  }),
];

// Define esbuild options
let opts = {
  entryPoints: ["js/app.js", "js/sw.js", "js/home.js", "css/app.css"],
  entryNames: "[name]",
  bundle: true,
  splitting: true,
  format: "esm",
  logLevel: "info",
  target: "esnext",
  outdir: "../priv/static/assets",
  external: ["fonts/*", "images/*"],
  nodePaths: ["../deps"],
  loader: loader,
  plugins: plugins,
};

if (deploy) {
  opts = {
    ...opts,
    minify: true,
  };
}

if (watch) {
  opts = {
    ...opts,
    sourcemap: "inline",
  };
  context(opts)
    .then((ctx) => {
      ctx.watch();
    })
    .catch((_error) => {
      process.exit(1);
    });
} else {
  build(opts);
}
