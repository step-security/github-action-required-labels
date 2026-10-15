# Use the latest version of Node.js
#
# You may prefer the full image:
# FROM node
#
# or even an alpine image (a smaller, faster, less-feature-complete image):
# FROM node:alpine
#
# You can specify a version:
# FROM node:10-slim
FROM node:alpine@sha256:233761595746769ebfdb6090f44fc7cdf818ae0ce62d2b37e0367723b9823e36

# Labels for GitHub to read your action
LABEL "com.github.actions.name"="Required Labels"
LABEL "com.github.actions.description"="Require labels to be added to a pull request before merging"
# Here are all of the available icons: https://feathericons.com/
LABEL "com.github.actions.icon"="check-square"
# And all of the available colors: https://developer.github.com/actions/creating-github-actions/creating-a-docker-container/#label
LABEL "com.github.actions.color"="blue"

# Copy the pre-built, self-contained bundle produced by `npm run build`
# (ncc inlines all dependencies, so no `npm ci` is required)
COPY dist/ /dist/

# Run the bundled action
ENTRYPOINT ["node", "/dist/index.js"]
