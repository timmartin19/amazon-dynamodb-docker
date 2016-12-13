FROM java:jre-alpine

WORKDIR /app
ADD http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest.tar.gz dynamodb.tar.gz
RUN tar -xzf dynamodb.tar.gz

EXPOSE 8000
ENTRYPOINT ["java", "-Djava.library.path=./DynamoDBLocal_lib", "-jar", "DynamoDBLocal.jar"]
CMD ["-sharedDb"]

