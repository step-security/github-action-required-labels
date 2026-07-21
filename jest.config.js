module.exports = {
  // Transpile our source/tests with babel-jest.
  transform: {
    "^.+\\.[cm]?js$": "babel-jest",
  },
  // @actions/github@7 pulls in ESM-only Octokit packages. By default Jest
  // skips transforming node_modules; allow-list the ESM packages so their
  // `import`/`export` syntax is transpiled to CommonJS.
  transformIgnorePatterns: [
    "/node_modules/(?!(@octokit|universal-user-agent|before-after-hook)/)",
  ],
};
