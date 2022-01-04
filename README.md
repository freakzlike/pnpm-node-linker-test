# pnpm-node-linker-test

1. Clone the repository
`git checkout https://github.com/freakzlike/pnpm-node-linker-test.git`

2. Build the docker image
`docker build -t pnpm-node-linker-test -f Dockerfile .`

3. Run the docker image
Replace `<path-to-repo>` with the absolute path to the repository
`docker run  -v <path-to-repo>/.pnpm-store:/home/node/.pnpm-store -w /var/lib/app -v <path-to-repo>/app:/var/lib/app -it --entrypoint /bin/bash pnpm-node-linker-test`

4. Install the packages inside the container
`pnpm install`

Output:
```
Lockfile is up-to-date, resolution step is skipped
Packages: +1
+
WARN EXDEV: cross-device link not permitted, link '/home/node/.pnpm-store/v3/files/6a/8011db36b113d52d7173b8904f456cf06021911593bbb767e9c43e60e8eabc1c62d874ecac6b5597a3544772d9798abe491c6fc3bf5ccf542b76cf73588c3f' -> '/var/lib/app/node_modules/_tmp_8_56b51f87cba29360b8c1dc9aa923be54/tslib.es6.html'
Falling back to copying packages from store
Packages are copied from the content-addressable store to the virtual store.
  Content-addressable store is at: /home/node/.pnpm-store/v3
  Virtual store is at:             node_modules/.pnpm
Progress: resolved 1, reused 0, downloaded 1, added 1, done
```

When you run `pnpm install` again then the number of packages is doubled.
```
Lockfile is up-to-date, resolution step is skipped
Packages: +1
+
Progress: resolved 2, reused 2, downloaded 0, added 0, done
```
