#!/bin/bash

function build() {
    echo "Building customer api"
    pushd api/customerapi
    npm install
    docker build -t msdemo/customerapi:1 .
    popd

    echo "Building order api"
    pushd api/orderapi
    npm install
    docker build -t msdemo/orderapi:1 .
    popd
}

function deploy() {
    echo "Deploying customer api"
    # TODO

    echo "Deploying order api"
    # TODO
}

function test() {
    echo "Testing customer api"
    # customerApiBasePath=TODO
    # echo "Testing " ${customerApiBasePath}/api/v1/customerapi/health
    # curl ${customerApiBasePath}/api/v1/customerapi/health

    echo "Testing order api"
    # orderApiBasePath=TODO
    # echo "Testing " ${orderApiBasePath}/api/v1/orderapi/health
    # curl ${orderApiBasePath}/api/v1/orderapi/health    
}

function delete() {
    echo "Delete customer api"
    # TODO

    echo "Delete order api"
    # TODO
   
}

function options() {
      echo "./service.sh build -> Build docker images\n 
/service.sh deploy -> deploy services\n
/service.sh test -> test services\n
/service.sh delete -> delete services\n
      "
}



for var in "$@"
do
  case "$var" in
    build)
      build
      ;;   
    deploy)
      deploy
      ;;       
    test)
      test
      ;;    
    delete)
      delete
      ;; 
    *)
      options
      ;;
  esac    
done
