#!/bin/bash

# When you face problems around "Unauthenticated" error such as the following:
#
#  2020/10/07 22:19:15 failed to create profile, will retry: rpc error: code = Unauthenticated desc = transport: oauth2: cannot fetch token: 400 Bad Request
#  Response: {
#    "error": "invalid_grant",
#    "error_description": "Bad Request"
#  }
#
#  Try running this command and authenticate the application default:
#
#  $ gcloud auth application-default login

rev=$(git rev-parse --short HEAD)
datetime=$(date +%H%M%S)
version="${USER}-${datetime}-${rev}"

go build -ldflags="-X 'main.Version=${version}'" -o server
./server -project_id=${PROJECT_ID} -version=${version} -concurrency=1 -heap -heap_alloc