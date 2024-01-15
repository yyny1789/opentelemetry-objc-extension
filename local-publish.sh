#!/bin/sh
set -o pipefail
set -e

remote_url="git@gitee.com:aliyun-sls/opentelemetry-objc-extension.git"
VERSION=$(cat VERSION)
echo "version: ${VERSION}"

sed -i '' "s/s.version *=.*/s.version          = \"$VERSION\"/" OpenTelemetryApiObjc.podspec
sed -i '' "s/s.version *=.*/s.version          = \"$VERSION\"/" OpenTelemetrySdkObjc.podspec

git add VERSION
git add OpenTelemetryApiObjc.podspec
git add OpenTelemetrySdkObjc.podspec

if [ -n "$(git diff --cached --name-only)" ]; then
    echo "Has staged changes"
    git commit -m "version: $VERSION"
else
    echo "No git changes"
fi

if git rev-parse -q --verify "refs/tags/$VERSION" >/dev/null; then
    git tag -d $VERSION
    echo "Local tag: $VERSION has deleted"
else
    echo "No local git tag: $VERSION"
fi

if git ls-remote --tags "$remote_url" | grep -qE "refs/tags/$VERSION$"; then
    git push gitee :$VERSION
    echo "Remote tag: $VERSION has deleted"
else
    echo "No remote git tag: $VERSION"
fi

git tag $VERSION
git push gitee $VERSION
    
pod repo push gitee-aliyun-sls OpenTelemetryApiObjc.podspec --allow-warnings --verbose --skip-tests --sources=https://gitee.com/aliyun-sls/Specs.git
pod repo push gitee-aliyun-sls OpenTelemetrySdkObjc.podspec --allow-warnings --verbose --skip-tests --sources=https://gitee.com/aliyun-sls/Specs.git
