project "imgui"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "off"

    targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
    objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "imgui.cpp",
        "imgui_draw.cpp",
        "imgui_tables.cpp",
        "imgui_widgets.cpp",
        "imgui_demo.cpp",
        "imgui.h",
        "imgui_internal.h",
        "imstb_rectpack.h",
        "imstb_textedit.h",
        "imstb_truetype.h"
    }

    includedirs { "." }

    filter "system:windows"
        systemversion "latest"
        -- defines { "IMGUI_IMPL_WIN32", "IMGUI_IMPL_DX12" }
        files 
        {
            "backends/imgui_impl_win32.cpp",
            "backends/imgui_impl_win32.h",
            "backends/imgui_impl_dx12.cpp",
            "backends/imgui_impl_dx12.h"
        }
        includedirs { "backends" }

    -- filter "system:linux or system:macosx"
    --     pic "On"
    --     systemversion "latest"
    --     defines { "IMGUI_IMPL_OPENGL_LOADER_GLAD" }
    --     files 
    --     {
    --         "backends/imgui_impl_glfw.cpp",
    --         "backends/imgui_impl_glfw.h",
    --         "backends/imgui_impl_opengl3.cpp",
    --         "backends/imgui_impl_opengl3.h"
    --     }
    --     includedirs { "backends" }

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"
