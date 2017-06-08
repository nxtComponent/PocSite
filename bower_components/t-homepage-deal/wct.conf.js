module.exports = {
  plugins: {
    istanbul: {
      dir: "./coverage",
      reporters: ["text-summary", "lcov"],
      include: [
        "/t-homepage-deal/t-homepage-deal.html"
      ],
      exclude: [
        "/polymer/polymer.js",
        "/wecomponentsjs/webcomponents-lite.js"
      ]
    }
  }
}
