./set_android_env.ps1

$targets = "build-android-64", "build-android-32"
# $stripe = $args[0] -eq "-s" -or $args[0] -eq "--stripe"

foreach ($target in $targets)
{
    if (test-path $target)
    {
        rmdir $target -r
    }

    mkdir $target | out-null
    cd $target

    $abi = "arm64-v8a"
    if ($target.Contains("32"))
    {
        $abi = "armeabi-v7a"
    }

    cmake -DCMAKE_BUILD_TYPE=Release -DSTRIP_ANDROID_LIBRARY=On -DBUILD_ANDROID=On `
        -DANDROID_ABI="$abi" -G "Ninja" ..\

    # if ($stripe)
    # {
    #   cmake -DCMAKE_BUILD_TYPE=Release -DSTRIP_ANDROID_LIBRARY=On -DBUILD_ANDROID=On `
    #       -DANDROID_ABI="$abi" -G "Ninja" ..\
    # }
    # else
    # {
    #     cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_ANDROID=On -DANDROID_ABI="$abi" -G "Ninja" ..\
    # }

    cd ..
}
