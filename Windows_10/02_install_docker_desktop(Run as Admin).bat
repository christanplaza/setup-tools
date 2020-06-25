@echo off
echo "Checking Docker Compatibility with current OS"
setlocal
set "winEdition="
for /f "tokens=2 delims==" %%G in ('wmic os get Caption /value') do (
    if not defined winEdition set winEdition=%%G
)
echo %winEdition% | find "Windows 10 Pro" > nul
    if errorlevel 1 (
        echo "Windows 10 Home Detected"
        set edition="Home"
        goto BUILD_CHECK
    ) else (
        echo "Windows 10 Pro Detected"
        set edition="Pro"
        goto BUILD_CHECK
    )
:BUILD_CHECK
    echo "Checking if OS Build is Compatible with Docker Desktop"
    for /f "tokens=4-7 delims=[.] " %%i in ('ver') do @(if %%i==Version (set build=%%l) else (set build=%%k))
    if %edition% == "Home" (
        if %build% geq 19018 (
            goto DOCKER_DESKTOP
        ) else (
            goto DOCKER_TOOLBOX
        )
    ) else (
        if %build% geq 15063 (
            goto DOCKER_DESKTOP
        ) else (
            goto DOCKER_TOOLBOX
        )
    )
:DOCKER_DESKTOP
    echo "Build valid, installing Docker Desktop"
    choco install docker-desktop
    goto :EOF
:DOCKER_TOOLBOX
    echo "Build invalid, installing Docker CLI"
    choco install docker-toolbox
    goto :EOF