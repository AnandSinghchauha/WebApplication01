if (-not (Test-Path -Path $env:JAVA_HOME)) {
    $JAVA_INSTALL_PATH = "C:\Program Files\Java"
    $JAVA_DOWNLOAD_URL = "https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_windows-x64_bin.zip"

    if (-not (Test-Path -Path $env:System_DefaultWorkingDirectory)) {
        $env:System_DefaultWorkingDirectory = (Get-Location).Path
    }

    Invoke-WebRequest -Uri $JAVA_DOWNLOAD_URL -OutFile "$($env:System_DefaultWorkingDirectory)\jre.exe" -UseBasicParsing
    Start-Process -FilePath "$($env:System_DefaultWorkingDirectory)\jre.exe" -ArgumentList "/s", "/INSTALLDIR=$JAVA_INSTALL_PATH", "/STATIC=1", "/L", "install.log" -Wait

    $env:JAVA_HOME = "$JAVA_INSTALL_PATH\jre"
    $env:PATH += ";$env:JAVA_HOME\bin"
    $env:PATH = $env:PATH + ';' + $JAVA_INSTALL_PATH + '\bin'
}
