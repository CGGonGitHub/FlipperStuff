[void] [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms")

$count = 0

Start-Sleep -Seconds 5

while ($count -ne 10) {
    [System.Windows.Forms.SendKeys]::SendWait("Fick dich @Yasin_fake#9005 ")
    [System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
    $count = $count + 1
}

