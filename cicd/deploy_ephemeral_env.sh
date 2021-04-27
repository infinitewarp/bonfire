source ${CICD_ROOT}/_common_deploy_logic.sh

# Deploy k8s resources for app and its dependencies (use insights-stage instead of insights-production for now)
# -> use this PR as the template ref when downloading configurations for this component
# -> use this PR's newly built image in the deployed configurations
result=$(bonfire deploy \
    ${APP_NAME} \
    --ref-env insights-stage \
    --set-template-ref ${APP_NAME}/${COMPONENT_NAME}=${GIT_COMMIT} \
    --set-image-tag ${IMAGE}=${IMAGE_TAG})

if [ $? -eq 0 ]; then
    export NAMESPACE=$result
fi
