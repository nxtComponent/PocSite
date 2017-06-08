module.exports = {
  plugins: {
    istanbul: {
      dir: "./coverage",
      reporters: ["text-summary", "lcov"],
      include: [
        "/t-footer/t-footer.html"
      ],
      exclude: [
        "/polymer/polymer.js",
        "/wecomponentsjs/webcomponents-lite.js"
      ]
    }
  }
}
