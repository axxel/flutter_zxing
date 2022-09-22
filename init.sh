# Define the project name (the same as name: in the pubspec.yaml file)
project="flutter_zxing"

# Define the versions to download
zxing_version="master"

# Define the paths to the directories where the files will be installed
projectPath="../../$project"
zxingPath="$projectPath/ios/Classes/src/zxing"

# Create the download directory
mkdir -p download
cd download

# Download the zxing source code and unzip it
wget -O "zxing-cpp-$zxing_version.zip" "https://github.com/nu-book/zxing-cpp/archive/refs/heads/$zxing_version.zip"
unzip "zxing-cpp-$zxing_version.zip"

# remove zxing from project
rm -R "$zxingPath"

# create the zxing directory
mkdir -p "$zxingPath"

# copy zxing
cp -R "zxing-cpp-$zxing_version/core/" "$zxingPath"
cp -R "zxing-cpp-$zxing_version/zxing.cmake" "$zxingPath/.."

cd ..

# install melos and dependencies
dart pub global activate melos
melos clean
melos bootstrap

# remove the downloaded files
rm -R download

# print success message for zxing
echo "ZXing $zxing_version has been successfully installed"