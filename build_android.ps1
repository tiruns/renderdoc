./set_android_env.ps1

cd "build-android-64"
ninja
cd ..

cd "build-android-32"
ninja
cd ..


cp ./build-android-64/bin/org.renderdoc.renderdoccmd.arm64.apk ./x64/
cp ./build-android-32/bin/org.renderdoc.renderdoccmd.arm32.apk ./x64/
