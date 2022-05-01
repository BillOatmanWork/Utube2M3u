dotnet publish -r win-x64 -c Release -p:PublishReadyToRun=true -p:PublishSingleFile=true -p:PublishTrimmed=true --self-contained true -p:IncludeNativeLibrariesForSelfExtract=true
dotnet publish -r osx.10.14-x64 -c Release /p:PublishSingleFile=true /p:IncludeNativeLibrariesForSelfExtract=true
dotnet publish -r debian-x64 -c Release /p:PublishSingleFile=true /p:IncludeNativeLibrariesForSelfExtract=true
dotnet publish -r debian.10-x64 -c Release /p:PublishSingleFile=true /p:IncludeNativeLibrariesForSelfExtract=true
dotnet publish -r linux-arm -c Release /p:PublishSingleFile=true /p:IncludeNativeLibrariesForSelfExtract=true
dotnet publish -r ubuntu.18.04-x64 -c Release /p:PublishSingleFile=true /p:IncludeNativeLibrariesForSelfExtract=true
dotnet publish -r alpine.3.12-x64 -c Release /p:PublishSingleFile=true /p:IncludeNativeLibrariesForSelfExtract=true
dotnet publish -r linux-x64 -c Release /p:PublishSingleFile=true /p:IncludeNativeLibrariesForSelfExtract=true

