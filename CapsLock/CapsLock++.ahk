#Requires AutoHotkey v2.0

CapsLock & q:: {
    userInput := InputBox("可选项：Wiki、Bing、Youtube、Github、Bilibili、All", "引擎搜索", "w400 h100").Value

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
