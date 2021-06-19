#!/bin/bash

cd Service
npm install
npm run test
rm -rf node_modules # test işlemi bittikten sonra sildim ilerde layer eklenecek olursa burası ayarlanabilir
cd ..

aws cloudformation package --template-file template.yaml --s3-bucket ${DEPLOYMENT_BUCKET} --output-template-file build/template.yaml

aws cloudformation deploy --template-file build/template.yaml --stack-name ${STACK_NAME} --role-arn ${ROLE_ARN} --capabilities CAPABILITY_IAM CAPABILITY_AUTO_EXPAND \
    --parameter-overrides \
    MiddlewareStackName=ig-middleware-service \
    --tags costcenter=deneme
