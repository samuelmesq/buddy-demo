FROM onemarket/base-image:node-6.9--yarn-0.19.1

# build tools
RUN apk update && apk upgrade && apk add --no-cache \
 # bcrypt:
 g++ \
 make \
 gcc \
 python

ADD package.json yarn.lock .npmrc /tmp/
ADD .yarn-cache.tgz /

RUN cd /tmp && yarn
RUN mkdir -p /opt/app && cd /opt/app && ln -s /tmp/node_modules

WORKDIR /opt/app

COPY . .

CMD ["yarn", "start"]
