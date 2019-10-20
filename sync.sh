#!/bin/sh
br=`git symbolic-ref --short -q HEAD | awk -F 'go' '{print $2}'`
case "$OSTYPE" in
  darwin*)  sed -i '' "s/0.0.0/$br.0/" "package.json" ;;
  linux*)   sed -i    "s/0.0.0/$br.0/" "package.json" ;;
esac
mkdir dist
curl https://raw.githubusercontent.com/golang/go/release-branch.go$br/misc/wasm/wasm_exec.js > ./dist/wasm_exec.js
