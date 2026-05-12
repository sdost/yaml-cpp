project "yaml-cpp"
kind "StaticLib"
language "C++"

targetdir("bin/" .. outputdir .. "/%{prj.name}")
objdir("bin-int/" .. outputdir .. "/%{prj.name}")

files
{
  "src/**.h",
  "src/**.cpp",

  "include/**.h"
}

includedirs
{
  "include"
}

filter "system:windows"
systemversion "latest"
cppdialect "C++17"
staticruntime "off"

filter "system:linux"
pic "On"
systemversion "latest"
cppdialect "C++17"
staticruntime "off"

-- SDE-8: yaml-cpp stays optimized in Debug.
filter "configurations:Debug"
runtime "Debug"
symbols "on"
optimize "speed"
runtimechecks "Off"

filter "configurations:Release"
runtime "Release"
optimize "on"
