#!/bin/sh
br=`git symbolic-ref --short -q HEAD | awk -F 'go' '{print $2}'`
sed -i s/0.0.0/$br/ package.json
curl https://raw.githubusercontent.com/golang/go/release-branch.go$br/misc/wasm/wasm_exec.js > ./dist/wasm_exec.js

