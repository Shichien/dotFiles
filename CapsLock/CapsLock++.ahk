#Requires AutoHotkey v2.0
CoordMode("Pixel", "Screen")
CoordMode("Mouse", "Screen")

CapsLock & q:: {
    userInput := InputBox("可选项：Wiki、Bing、Youtube、Github、Bilibili、All、（cmd）", "引擎搜索", "w400 h100").Value

    if userInput {
        ; 分割输入为搜索引擎和搜索内容
        inputParts := StrSplit(userInput, A_Space)
        engine := StrLower(inputParts[1])
        searchContent := inputParts.Length > 1 ? SubStr(userInput, StrLen(engine) + 2) : userInput

        ; 定义搜索URL
        wikiUrl := "https://en.wikipedia.org/wiki/Special:Search?search=" . searchContent
        bingUrl := "https://www.bing.com/search?q=" . searchContent
        youtubeUrl := "https://www.youtube.com/results?search_query=" . searchContent
        githubUrl := "https://github.com/search?q=" . searchContent
        bilibiliUrl := "https://search.bilibili.com/all?keyword=" . searchContent

        ; 根据用户选择打开对应网站
        switch engine {
            case "wiki":
                Run(wikiUrl)
            case "bing":
                Run(bingUrl)
            case "youtube":
                Run(youtubeUrl)
            case "github":
                Run(githubUrl)
            case "bilibili":
                Run(bilibiliUrl)
            case "all":
                Run(wikiUrl)
                Run(bingUrl)
                Run(youtubeUrl)
                Run(githubUrl)
                Run(bilibiliUrl)
            case "cmd":
                Run("powershell.exe -NoExit -Command " . searchContent)
            default:
                Run(bingUrl)
        }
    }
}

; 伪 Vim 光标移动操作
CapsLock & Enter:: {
    Send "{End}"  ; 移动到行尾
    Send "{Enter}"  ; 插入新行
}

CapsLock & o:: {
    Send "{End}"
    Send "{Enter}"
}

; 伪 Vim 删除操作
CapsLock & Backspace:: {
    Send "{Home}"
    Send "+{End}" ; 使用 Shift + End 选择一整行
    Send "{Backspace}"
}

; 伪 Vim 插入操作
CapsLock & i:: {
    Send "{Home}"
}

CapsLock & a:: {
    Send "{End}"
}

; Deprecated
; 使用 CapsLock + W 创建快速笔记，使用 VSCode 编辑
; CapsLock & w:: {
;     Current := A_Now
;     formatted := FormatTime(Current, "yyyy-MM-dd_HH-mm-ss")
;     FilePath := A_Desktop . "\QuickNote_" . formatted . ".md"
;     Run("code " . FilePath)
; }

; Disable Win Hotkeys
#a:: return         ; Disable Win + A : Action Center
#c:: return         ; Disable Win + C : Cortana
#f:: return         ; Disable Win + F : Feedback Hub
#k:: return         ; Disable Win + K : Connect Wireless Displays
#l:: return         ; Disable Win + L : Lock Computer
#n:: return         ; Disable Win + N : Notification settings
#o:: return         ; Disable Win + O : Device Orientation lock
#q:: return         ; Disable Win + Q : Win Search
#s:: return         ; Disable Win + S : Win Search
#t:: return         ; Disable Win + T : Cycle Taskbar
#u:: return         ; Disable Win + U : Accessibility Settings
#w:: return         ; Disable Win + W : Windows Widgets
#^o:: return        ; Disable Win + Ctrl + O: Open on-screen keyboard
#^c:: return        ; Disable Win + Ctrl + C: Toggle color filter
#^n:: return        ; Disable Win + Ctrl + N: Open Narrator settings
#^s:: return        ; Disable Win + Ctrl + S: Open Windows Speech Recognition
#Esc:: return       ; Disable Win + Esc: Close Magnifier
#Enter:: return     ; Disable Win + Enter: Open Narrator
#^Enter:: return    ; Disable Win + Ctrl + Enter: Open Narrator Settings

; #NumpadAdd:: return  ; Disable Win + Numpad Plus: Open Magnifier and zoom in
; #Equal:: return  ; Disable Win + Equal/Plus (main keyboard)

; #NumpadSub:: return  ; Disable Win + Numpad Minus: Zoom out in Magnifier
; #Hyphen:: return  ; Disable Win + Hyphen/Minus (main keyboard)

; Volume control with Win + Plus/Minus
#+:: Send "{Volume_Up}"            ; Win + Plus increases volume
#-:: Send "{Volume_Down}"          ; Win + Minus decreases volume

; Open Recycle Bin with Win + Delete
#Delete:: Run "shell:RecycleBinFolder"

ToggleWin(winTitle, exePath := "") {
    if WinExist(winTitle) {
        if WinActive(winTitle) {
            WinMinimize()
            return "Active"
        } else {
            WinActivate(winTitle)
            return "Minimized"
        }
        return "Toggled"
    } else {
        if (exePath != "") {
            Run(exePath)
        }
    }
}

; Open Obsidian with Ctrl + Alt + O
^!o:: ToggleWin("ahk_exe Obsidian.exe", "")

; Open VSCode with Ctrl + Alt + C
^!c:: ToggleWin("ahk_exe Code.exe", "Code.exe")

; Open WeChat with Ctrl + Alt + W

; Open QQ with Ctrl + Alt + Q

; Open Edge with Ctrl + Alt + E
^!e:: ToggleWin("ahk_exe msedge.exe")

; Open EverythingToolbar with Ctrl + Alt + S

; Open Pot Player with Ctrl + Alt + D

; Open WPS with Ctrl + Alt + P
^!p:: ToggleWin("ahk_exe wps.exe")

; Open NetEase Music with Ctrl + Alt + N
^!n:: {
    ; DrawSearchRectangle(1811, 1520, 2559, 1599)
    if (WinExist("ahk_exe cloudmusic.exe")) {
        if (WinActive("ahk_exe cloudmusic.exe")) {
            WinMinimize("ahk_exe cloudmusic.exe")
        } else {
            MouseGetPos(&OriginalX, &OriginalY)
            Found := ImageSearch(&FoundX, &FoundY, 1811, 1520, 2559, 1599, "*30 ./icons/netease_music.png")
            if Found {
                Click(FoundX + 16, FoundY + 16)
                Sleep(50)
                MouseMove(OriginalX, OriginalY, 0)
            }
        }
    } else {
        MouseGetPos(&OriginalX, &OriginalY)
        Found := ImageSearch(&FoundX, &FoundY, 1811, 1520, 2559, 1599, "*30 ./icons/netease_music.png")
        if Found {
            Click(FoundX + 16, FoundY + 16)
            Sleep(50)
            MouseMove(OriginalX, OriginalY, 0)
        }
    }
}

global g_TempBox := ""

CapsLock & w:: {
    global g_TempBox
    if IsObject(g_TempBox) {
        g_TempBox.Destroy()
    } else {
        g_TempBox := TempBox()
        g_TempBox.Show()
    }
    return
}

class TempBox {
    __New() {
        this.gui := Gui("+AlwaysOnTop +Resize", "Temp Box")
        this.gui.SetFont("s12", "Consolas")
        this.edit := this.gui.Add("Edit", "w300 h150 VScroll +Wrap")
        this.button := this.gui.Add("Button", "x220 w80 Default", "Copy")

        this.button.OnEvent("Click", this._CopyToClipboard.Bind(this))
        this.gui.OnEvent("Escape", this._OnEscape.Bind(this))
        this.gui.OnEvent("Size", this._OnSize.Bind(this))
    }

    Show() {
        WinWidth := 300 + 30
        xPos := A_ScreenWidth - 700
        yPos := 50
        this.gui.Show("x" xPos " y" yPos)
    }

    Destroy() {
        global g_TempBox
        this.gui.Destroy()
        g_TempBox := ""
    }

    _CopyToClipboard(*) {
        A_Clipboard := this.edit.Value
        this.Destroy() ; 调用统一的销毁方法
    }

    _OnEscape(*) {
        this.Destroy()
    }

    _OnSize(gui, MinMax, Width, Height) {
        if (MinMax = -1)
            return

        this.edit.Move(10, 10, Width - 20, Height - 50)
        this.button.Move(Width - 110, Height - 35)
    }
}
