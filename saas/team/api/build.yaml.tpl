componentType: K8S_MICROSERVICE
componentName: team
options:
  containers:
    - ports:
        - containerPort: 7001
      name: server
      build:
        imagePush: ${IMAGE_BUILD_ENABLE}
        imagePushRegistry: ${IMAGE_PUSH_REGISTRY}
        args:
          TAG: ack
        dockerfileTemplateArgs:
          JRE11_IMAGE: registry.cn-hangzhou.aliyuncs.com/alisre/openjdk:11.0.10-jre
        dockerfileTemplate: Dockerfile
        repoPath: saas/team/api/teammanage
        branch: ${SOURCE_BRANCH}
        repo: ${SOURCE_REPO}
        ciAccount: "${SOURCE_CI_ACCOUNT}"
        ciToken: "${SOURCE_CI_TOKEN}"


  initContainers:
    - name: db-migration
      build:
        imagePush: ${IMAGE_BUILD_ENABLE}
        imagePushRegistry: ${IMAGE_PUSH_REGISTRY}
        args:
          TAG: ack
        dockerfileTemplateArgs:
          MIGRATE_IMAGE: ${MIGRATE_IMAGE}
        dockerfileTemplate: Dockerfile-db-migration
        repoPath: saas/team/api/teammanage
        branch: ${SOURCE_BRANCH}
        repo: ${SOURCE_REPO}
        ciAccount: "${SOURCE_CI_ACCOUNT}"
        ciToken: "${SOURCE_CI_TOKEN}"

  env:
    - DB_HOST
    - DB_PORT
    - DB_USER
    - DB_PASSWORD
    - DB_NAME
    - COOKIE_DOMAIN
    - APPMANAGER_PACKAGE_ENDPOINT_PROTOCOL
    - APPMANAGER_PACKAGE_ENDPOINT
    - APPMANAGER_PACKAGE_ACCESS_KEY
    - APPMANAGER_PACKAGE_SECRET_KEY
    - APPMANAGER_ENDPOINT
    - AUTHPROXY_ENDPOINT
    - TEAM_DEFAULT_REPO
    - TEAM_DEFAULT_REGISTRY
    - TEAM_DEFAULT_ACCOUNT

