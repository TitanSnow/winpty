set_xmakever("2.1.3")
set_project("winpty")
target("winpty-agent")
    set_languages("ansi","gnuxx11")
    add_cxflags("/EHsc")
    set_kind("binary")
    add_headers("include/*")
    add_includedirs("include","gen")
    add_defines("WINPTY_AGENT_ASSERT")
    add_links("advapi32","user32","shell32")
    add_files(
                "agent/Agent.cc",
                "agent/AgentCreateDesktop.cc",
                "agent/ConsoleFont.cc",
                "agent/ConsoleInput.cc",
                "agent/ConsoleInputReencoding.cc",
                "agent/ConsoleLine.cc",
                "agent/DebugShowInput.cc",
                "agent/DefaultInputMap.cc",
                "agent/EventLoop.cc",
                "agent/InputMap.cc",
                "agent/LargeConsoleRead.cc",
                "agent/NamedPipe.cc",
                "agent/Scraper.cc",
                "agent/Terminal.cc",
                "agent/Win32Console.cc",
                "agent/Win32ConsoleBuffer.cc",
                "agent/main.cc",
                "shared/BackgroundDesktop.cc",
                "shared/Buffer.cc",
                "shared/DebugClient.cc",
                "shared/GenRandom.cc",
                "shared/OwnedHandle.cc",
                "shared/StringUtil.cc",
                "shared/WindowsSecurity.cc",
                "shared/WindowsVersion.cc",
                "shared/WinptyAssert.cc",
                "shared/WinptyException.cc",
                "shared/WinptyVersion.cc")
    before_build(function (target)
        os.cd(path.join("$(scriptdir)","shared"))
        os.exec("UpdateGenVersion.bat")
        os.cd("-")
    end)
target("winpty")
    set_languages("ansi","gnuxx11")
    add_cxflags("/EHsc")
    add_deps("winpty-agent")
    set_kind("shared")
    add_headers("include/*")
    add_includedirs("include","gen")
    add_defines("COMPILING_WINPTY_DLL")
    add_links("advapi32","user32")
    add_files(
                "libwinpty/AgentLocation.cc",
                "libwinpty/winpty.cc",
                "shared/BackgroundDesktop.cc",
                "shared/Buffer.cc",
                "shared/DebugClient.cc",
                "shared/GenRandom.cc",
                "shared/OwnedHandle.cc",
                "shared/StringUtil.cc",
                "shared/WindowsSecurity.cc",
                "shared/WindowsVersion.cc",
                "shared/WinptyAssert.cc",
                "shared/WinptyException.cc",
                "shared/WinptyVersion.cc")
