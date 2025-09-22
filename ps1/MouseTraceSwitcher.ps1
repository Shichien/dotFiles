$signature = @"
[DllImport("user32.dll", EntryPoint = "SystemParametersInfo")]
public static extern bool SystemParametersInfo(int uiAction, int uiParam, int pvParam, int fWinIni);
"@
$systemParametersInfo = Add-Type -MemberDefinition $signature -Name "Win32Utils" -Namespace "User32" -PassThru

$regPath = "HKCU:\Control Panel\Mouse"
$regName = "MouseTrails"
$currentValue = Get-ItemPropertyValue -Path $regPath -Name $regName -ErrorAction SilentlyContinue

$SPI_SETMOUSETRAILS = 0x005D # 动作ID：设置鼠标轨迹
$SPIF_UPDATEINIFILE = 0x01   # 标志：将更改写入用户配置文件
$SPIF_SENDCHANGE = 0x02      # 标志：广播消息通知所有程序设置已更改
$broadcast = $SPIF_UPDATEINIFILE + $SPIF_SENDCHANGE

if ($null -eq $currentValue) {
    $currentValue = "0"
}

if ($currentValue -eq "0") {
    $systemParametersInfo::SystemParametersInfo($SPI_SETMOUSETRAILS, 2, 0, $broadcast)
} else {
    $systemParametersInfo::SystemParametersInfo($SPI_SETMOUSETRAILS, 0, 0, $broadcast)
}