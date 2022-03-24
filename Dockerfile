FROM alpine:latest

RUN apk --no-cache add \
    nodejs \
    npm \
    busybox-extras \
  && npm install -g \
    npm@latest \
  # Cleaning up obsolete files:
  && rm -rf \
    /tmp/* \
    /root/.npm

WORKDIR /usr/lib/nightwatch
COPY package.json package-lock.json ./
RUN npm install --production \
  # Cleaning up obsolete files:
  && rm -rf \
  /tmp/* \
  /root/.npm

# Set NODE_PATH to be able to require installed packages:
ENV NODE_PATH=/usr/lib/nightwatch/node_modules

# Extend path to be able to run installed binaries:
ENV PATH=$PATH:/usr/lib/nightwatch/node_modules/.bin

# Avoid permission issues with host mounts by assigning a user/group with
# uid/gid 1000 (usually the ID of the first user account on GNU/Linux):
RUN adduser -D -u 1000 nightwatch
USER nightwatch

WORKDIR /app

RUN mkdir /app/reports /app/tests_output
RUN chown -R nightwatch:nightwatch /app/reports
RUN chown -R nightwatch:nightwatch /app/tests_output

# RUN echo ">>>>>>>>>>>>>>"
# CMD sleep 1000000000
# ENTRYPOINT ["nightwatch"]
CMD nightwatch -e ${BROWSER}
