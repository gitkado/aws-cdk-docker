# aws-cdk-docker

## set
```
$ cp env.list.sample env.list
$ vi env.list
AWS_ACCESS_KEY=[your_access_key]
AWS_SECRET_ACCESS_KEY=[your_secret_access_key]
REGION=ap-northeast-1
OUTPUT=text
```

## build
```
$ docker build -t aws-cdk . --no-cache
```

## start
```
$ docker run --rm -it --env-file ./env.list -v `pwd`:/usr/src/ aws-cdk /bin/bash
```

## try
```
# https://dev.classmethod.jp/cloud/aws-cdk-python-workshop/

$ mkdir cdk-workshop && cd cdk-workshop
$ cdk init sample-app --language python
$ pip install -r requirements.txt
# regionをap-northeast-1に変更
$ vi app.py

$ cdk ls
$ cdk synth hello-cdk-1
$ cdk bootstrap -b cdk-workshop-sample-app-yyyymmdd

$ cdk deploy hello-cdk-1
$ cdk destroy hello-cdk-1
```