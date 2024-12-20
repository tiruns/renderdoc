$env:JAVA_HOME="C:\Program Files\Android\Android Studio\jbr\"
$env:ANDROID_SDK="$env:LOCALAPPDATA\Android\Sdk"
$env:ANDROID_NDK="$env:LOCALAPPDATA\Android\Sdk\ndk\25.2.9519653\"

$env:PATH+=";C:\Program Files\Android\Android Studio\jbr\bin\"

init-devenv # Enter-VsDevShell

if (test-path "build-android-64")
{
    rmdir "build-android-64" -r
}
mkdir "build-android-64" | out-null
cd "build-android-64"
cmake -DBUILD_ANDROID=On -DANDROID_ABI=arm64-v8a -G "Ninja" ..\
cd ..

if (test-path "build-android-32")
{
    rmdir "build-android-32" -r
}
mkdir "build-android-32" | out-null
cd "build-android-32"
cmake -DBUILD_ANDROID=On -DANDROID_ABI=armeabi-v7a -G "Ninja" ..\
cd ..
