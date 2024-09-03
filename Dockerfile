FROM maven:3-amazoncorretto-17⁠ AS builder
COPY . /spc
RUN cd /spc && mvn package

FROM amazoncorretto:17-alpine3.17
LABEL author="Ashfaque" project="spc"
ARG HOMEDIR='/spc'
ARG USERNAME='spc'
RUN adduser -h ${HOMEDIR} -s /bin/sh -D ${USERNAME}
COPY --from=builder --chown=${USERNAME}:${USERNAME} /spc/target/springpetclinic-*.jar ${HOMEDIR}/springpetclinic-*.jar
USER ${USERNAME}
WORKDIR ${HOMEDIR}
EXPOSE 8080
CMD [ "java","-jar", "springpetclinic-*.jar" ]
