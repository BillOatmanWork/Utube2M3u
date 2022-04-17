dotnet publish -r win-x64 -c Release -p:PublishReadyToRun=true -p:PublishSingleFile=true -p:PublishTrimmed=true --self-contained true -p:IncludeNativeLibrariesForSelfExtract=true
dotnet publish -r osx.10.14-x64 -c Release /p:PublishSingleFile=true /p:IncludeNativeLibrariesForSelfExtract=true
dotnet publish -r debian-x64 -c Release /p:PublishSingleFile=true /p:IncludeNativeLibrariesForSelfExtract=true
dotnet publish -r debian.10-x64 -c Release /p:PublishSingleFile=true /p:IncludeNativeLibrariesForSelfExtract=true
dotnet publish -r linux-arm -c Release /p:PublishSingleFile=true /p:IncludeNativeLibrariesForSelfExtract=true
dotnet publish -r ubuntu.18.04-x64 -c Release /p:PublishSingleFile=true /p:IncludeNativeLibrariesForSelfExtract=true
dotnet publish -r alpine.3.12-x64 -c Release /p:PublishSingleFile=true /p:IncludeNativeLibrariesForSelfExtract=true
dotnet publish -r linux-x64 -c Release /p:PublishSingleFile=true /p:IncludeNativeLibrariesForSelfExtract=true

cd test

copy /Y "C:\Stuff\J3u\J3u\bin\Release\net5.0\win-x64\publish\J3u.exe" .
"C:\Program Files\7-Zip\7z" a -tzip J3u-WIN.zip J3u.exe

copy /Y "C:\Stuff\J3u\J3u\bin\Release\net5.0\debian.10-x64\publish\J3u" .
"C:\Program Files\7-Zip\7z" a -t7z J3u-DEB10.7z J3u

copy /Y "C:\Stuff\J3u\J3u\bin\Release\net5.0\debian-x64\publish\J3u" .
"C:\Program Files\7-Zip\7z" a -t7z J3u-DEB9.7z J3u

copy /Y "C:\Stuff\J3u\J3u\bin\Release\net5.0\linux-arm\publish\J3u" .
"C:\Program Files\7-Zip\7z" a -t7z J3u-RasPi.7z J3u

copy /Y "C:\Stuff\J3u\J3u\bin\Release\net5.0\osx.10.14-x64\publish\J3u" .
"C:\Program Files\7-Zip\7z" a -t7z J3u-OSX.7z J3u

copy /Y "C:\Stuff\J3u\J3u\bin\Release\net5.0\ubuntu.18.04-x64\publish\J3u" .
"C:\Program Files\7-Zip\7z" a -t7z J3u-UBU.7z J3u

copy /Y "C:\Stuff\J3u\J3u\bin\Release\net5.0\alpine.3.12-x64\publish\J3u" .
"C:\Program Files\7-Zip\7z" a -t7z J3u-ALP.7z J3u

copy /Y "C:\Stuff\J3u\J3u\bin\Release\net5.0\linux-x64\publish\J3u" .
"C:\Program Files\7-Zip\7z" a -t7z J3u-LIN64.7z J3u
