#1. build POI docker image for ACR after copying Dockerfile_3 to root level of poi folder
docker build --no-cache --build-arg IMAGE_VERSION="1.0" --build-arg IMAGE_CREATE_DATE="$(Get-Date((Get-Date).ToUniversalTime()) -UFormat '%Y-%m-%dT%H:%M:%SZ')" --build-arg IMAGE_SOURCE_REVISION="$(git rev-parse HEAD)" -f Dockerfile_3 -t "registryxzq2360.azurecr.io/vinodtripinsights/poi:1.0" .

#2. build trips docker image for ACR after copying Dockerfile_3 to root level of trips folder
docker build --no-cache --build-arg IMAGE_VERSION="1.0" --build-arg IMAGE_CREATE_DATE="$(Get-Date((Get-Date).ToUniversalTime()) -UFormat '%Y-%m-%dT%H:%M:%SZ')" --build-arg IMAGE_SOURCE_REVISION="$(git rev-parse HEAD)" -f Dockerfile_4 -t "registryxzq2360.azurecr.io/vinodtripinsights/trips:1.0" .

#3. build tripviewer docker image for ACR after copying Dockerfile_1 to root level of tripviewer folder
#
#ERROR TROUBLESHOOTING
#---------------------------------
#If -f argument is not adjusted to point to correct Dockerfile (here Dockerfile_1) name you will get following error
#unable to prepare context: unable to evaluate symlinks in Dockerfile path: CreateFile C:\learn\openhackms\containerslab\containers_artifacts\src\tripviewer\Dockerfile: The system cannot find the file specified.
#----------------------------------
docker build --no-cache --build-arg IMAGE_VERSION="1.0" --build-arg IMAGE_CREATE_DATE="$(Get-Date((Get-Date).ToUniversalTime()) -UFormat '%Y-%m-%dT%H:%M:%SZ')" --build-arg IMAGE_SOURCE_REVISION="$(git rev-parse HEAD)" -f Dockerfile_1 -t "registryxzq2360.azurecr.io/vinodtripinsights/tripviewer:1.0" .

#4. build trips docker image for ACR after copying Dockerfile_0 to root level of user-java folder
docker build --no-cache --build-arg IMAGE_VERSION="1.0" --build-arg IMAGE_CREATE_DATE="$(Get-Date((Get-Date).ToUniversalTime()) -UFormat '%Y-%m-%dT%H:%M:%SZ')" --build-arg IMAGE_SOURCE_REVISION="$(git rev-parse HEAD)" -f Dockerfile_0 -t "registryxzq2360.azurecr.io/vinodtripinsights/user-java:1.0" .

#5. build userprofile docker image for ACR after copying Dockerfile_2 to root level of userprofile folder
docker build --no-cache --build-arg IMAGE_VERSION="1.0" --build-arg IMAGE_CREATE_DATE="$(Get-Date((Get-Date).ToUniversalTime()) -UFormat '%Y-%m-%dT%H:%M:%SZ')" --build-arg IMAGE_SOURCE_REVISION="$(git rev-parse HEAD)" -f Dockerfile_2 -t "registryxzq2360.azurecr.io/vinodtripinsights/userprofile:1.0" .

#5 Login to ACR from docker cli so that images can be uploaded
docker login registryxzq2360.azurecr.io
