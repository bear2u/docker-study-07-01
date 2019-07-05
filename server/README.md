> Docker

```
(base) gimtaehyeon-ui-MacBook-Pro:flutter-study-docker bear2u$ docker build .
Sending build context to Docker daemon  120.3kB
Step 1/7 : FROM node:10.15-alpine
 ---> 94f3c8956482
Step 2/7 : WORKDIR "/app"
 ---> Using cache
 ---> ac291a1262d1
Step 3/7 : COPY ./package.json ./
 ---> a2600a75187c
Step 4/7 : RUN npm install
 ---> Running in f1e9a1a90bd4
npm WARN deprecated jade@1.11.0: Jade has been renamed to pug, please install the latest version of pug instead of jade
npm WARN deprecated constantinople@3.0.2: Please update to at least constantinople 3.1.1
npm WARN deprecated transformers@2.1.0: Deprecated, use jstransformer

> nodemon@1.19.1 postinstall /app/node_modules/nodemon
> node bin/postinstall || exit 0

Love nodemon? You can now support the project via the open collective:
 > https://opencollective.com/nodemon/donate

npm notice created a lockfile as package-lock.json. You should commit this file.
npm WARN optional SKIPPING OPTIONAL DEPENDENCY: fsevents@1.2.9 (node_modules/fsevents):
npm WARN notsup SKIPPING OPTIONAL DEPENDENCY: Unsupported platform for fsevents@1.2.9: wanted {"os":"darwin","arch":"any"} (current: {"os":"linux","arch":"x64"})

added 311 packages from 212 contributors and audited 2463 packages in 16.762s
found 3 low severity vulnerabilities
  run `npm audit fix` to fix them, or `npm audit` for details
Removing intermediate container f1e9a1a90bd4
 ---> 60dd20796215
Step 5/7 : COPY . .
 ---> 43ea11007ca8
Step 6/7 : EXPOSE 3000
 ---> Running in 05e4742a9eb5
Removing intermediate container 05e4742a9eb5
 ---> 0edf826fb299
Step 7/7 : CMD ["npm","run","dev"]
 ---> Running in 9d2483561958
Removing intermediate container 9d2483561958
 ---> 49db85e41d62
Successfully built 49db85e41d62
(base) gimtaehyeon-ui-MacBook-Pro:flutter-study-docker bear2u$ 
(base) gimtaehyeon-ui-MacBook-Pro:flutter-study-docker bear2u$ docker images
REPOSITORY              TAG                 IMAGE ID            CREATED             SIZE
<none>                  <none>              49db85e41d62        9 seconds ago       88.6MB
wordpress               latest              798e263bc14e        3 days ago          447MB
mysql                   5.7                 a1aa4f76fab9        2 weeks ago         373MB
my-ubuntu               v1                  f774cdda73b7        4 weeks ago         69.9MB
<none>                  <none>              756df78bbc5b        4 weeks ago         69.9MB
ubuntu                  latest              7698f282e524        6 weeks ago         69.9MB
express_jobinfo_app     latest              87add49162b2        3 months ago        554MB
express_jobinfo_admin   latest              fa2cb3c25c79        3 months ago        492MB
<none>                  <none>              5e6e72d8a4e2        3 months ago        554MB
express_jobinfo_nginx   latest              4523d80a0b05        3 months ago        109MB
<none>                  <none>              3bea806d9b3d        3 months ago        492MB
<none>                  <none>              e21101278e1e        3 months ago        554MB
mongo                   latest              a3abd47e8d61        3 months ago        394MB
node                    10.15-alpine        94f3c8956482        3 months ago        71MB
nginx                   latest              881bd08c0b08        3 months ago        109MB
redis                   latest              0f88f9be5839        3 months ago        95MB
bear2u/jobinfo-admin    latest              3affa477bee4        4 months ago        122MB
mandeuki/konlpy         latest              1a5e188f1938        2 years ago         1.22GB
(base) gimtaehyeon-ui-MacBook-Pro:flutter-study-docker bear2u$ 
(base) gimtaehyeon-ui-MacBook-Pro:flutter-study-docker bear2u$ 
(base) gimtaehyeon-ui-MacBook-Pro:flutter-study-docker bear2u$ docker run -it -d 49db85e41d62 -p 3000:3000
9897b478765c0ca8d1d310cb5d0d6cdaf315c68372aee1ddbcb2b034244f2886
docker: Error response from daemon: OCI runtime create failed: container_linux.go:344: starting container process caused "exec: \"-p\": executable file not found in $PATH": unknown.
(base) gimtaehyeon-ui-MacBook-Pro:flutter-study-docker bear2u$ docker run -it -d -p 3000:3000 49db85e41d62
de078d53e6c94bf0ab26928d1a88414850da7087fbacddb982617bfaa66eeb1c
(base) gimtaehyeon-ui-MacBook-Pro:flutter-study-docker bear2u$ docker ps
CONTAINER ID        IMAGE                   COMMAND                  CREATED             STATUS                             PORTS                      NAMES
de078d53e6c9        49db85e41d62            "npm run dev"            14 seconds ago      Up 12 seconds                      0.0.0.0:3000->3000/tcp     tender_gagarin
348c5c43234b        wordpress:latest        "docker-entrypoint.s…"   About an hour ago   Up About an hour                   0.0.0.0:80->80/tcp         wordpress
8bbf9259ca5b        mysql:5.7               "docker-entrypoint.s…"   About an hour ago   Up About an hour                   3306/tcp, 33060/tcp        mysql
3266948a23a2        express_jobinfo_nginx   "nginx -g 'daemon of…"   3 months ago        Restarting (1) About an hour ago                              express_jobinfo_nginx_1
1daae1a76202        redis                   "docker-entrypoint.s…"   3 months ago        Up 2 hours                         0.0.0.0:6379->6379/tcp     redis
560c0ea927d7        mongo                   "docker-entrypoint.s…"   3 months ago        Up 2 hours                         0.0.0.0:27017->27017/tcp   mongo
(base) gimtaehyeon-ui-MacBook-Pro:flutter-study-docker bear2u$ docker kill de078d53e6c9
de078d53e6c9
(base) gimtaehyeon-ui-MacBook-Pro:flutter-study-docker bear2u$ docker ps
CONTAINER ID        IMAGE                   COMMAND                  CREATED             STATUS                             PORTS                      NAMES
348c5c43234b        wordpress:latest        "docker-entrypoint.s…"   About an hour ago   Up About an hour                   0.0.0.0:80->80/tcp         wordpress
8bbf9259ca5b        mysql:5.7               "docker-entrypoint.s…"   About an hour ago   Up About an hour                   3306/tcp, 33060/tcp        mysql
3266948a23a2        express_jobinfo_nginx   "nginx -g 'daemon of…"   3 months ago        Restarting (1) About an hour ago                              express_jobinfo_nginx_1
1daae1a76202        redis                   "docker-entrypoint.s…"   3 months ago        Up 2 hours                         0.0.0.0:6379->6379/tcp     redis
560c0ea927d7        mongo                   "docker-entrypoint.s…"   3 months ago        Up 2 hours                         0.0.0.0:27017->27017/tcp   mongo
(base) gimtaehyeon-ui-MacBook-Pro:flutter-study-docker bear2u$ docker run -it -d -p 3000:3000 49db85e41d62
698e1b3c71420ebe980c39974cf2f43a2461ac430ed90495c6b77462afc5c520
(base) gimtaehyeon-ui-MacBook-Pro:flutter-study-docker bear2u$ git init
Initialized empty Git repository in /Users/bear2u/study/flutter-study-docker/.git/
(base) gimtaehyeon-ui-MacBook-Pro:flutter-study-docker bear2u$ git add .
(base) gimtaehyeon-ui-MacBook-Pro:flutter-study-docker bear2u$ git commit -m 'init'
[master (root-commit) 9430308] init
 12 files changed, 3084 insertions(+)
 create mode 100644 Dockerfile
 create mode 100644 app.js
 create mode 100755 bin/www
 create mode 100644 docker
 create mode 100644 package-lock.json
 create mode 100644 package.json
 create mode 100644 public/stylesheets/style.css
 create mode 100644 routes/index.js
 create mode 100644 routes/users.js
 create mode 100644 views/error.jade
 create mode 100644 views/index.jade
 create mode 100644 views/layout.jade
(base) gimtaehyeon-ui-MacBook-Pro:flutter-study-docker bear2u$ git remote add origin https://github.com/bear2u/docker-study-07-01.git
(base) gimtaehyeon-ui-MacBook-Pro:flutter-study-docker bear2u$ git push -u origin master
Enumerating objects: 19, done.
Counting objects: 100% (19/19), done.
Delta compression using up to 4 threads
Compressing objects: 100% (16/16), done.
Writing objects: 100% (19/19), 26.00 KiB | 2.17 MiB/s, done.
Total 19 (delta 1), reused 0 (delta 0)
remote: Resolving deltas: 100% (1/1), done.
To https://github.com/bear2u/docker-study-07-01.git
 * [new branch]      master -> master
Branch 'master' set up to track remote branch 'master' from 'origin'.
(base) gimtaehyeon-ui-MacBook-Pro:flutter-study-docker bear2u$ 
```