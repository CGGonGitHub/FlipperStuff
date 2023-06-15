Add-Type -AssemblyName System.Windows.Forms
$FormObject = [System.Windows.Forms.Form]
$ButtonObject = [System.Windows.Forms.Button]
$DropDownObject = [System.Windows.Forms.ComboBox]
$LabelObject = [System.Windows.Forms.Label]
#Variables
$Script:YearMode = 1

$Year = (Get-Date).Year
$Month = (Get-Date).Month
$MonthName = (Get-Culture).DateTimeFormat.GetMonthName($Month)
$DayOfYear = (Get-Date).DayOfYear
$DayOfMonth = (Get-Date).Day
$DayOfWeek = (Get-Date).DayOfWeek
$DayName = (Get-Culture).DateTimeFormat.GetDayName($DayOfWeek)
$Hour = (Get-Date).Hour
$Minute = (Get-Date).Minute
$Second = (Get-Date).Second
$Millisecond = (Get-Date).Millisecond
function OpenYearDetailed {
    Switch($Script:YearMode) {
        1 {
            Write-Host 1
            $Script:RightYearButton.Text = (-join((Get-Date).Year, " Years"))
            $Script:RightMonthsLabel.Text = (-join((Get-Date).Month, " Months"))
            $Script:RightDaysLabel.Text = (-join((Get-Date).Day, " Days"))
            $Script:RightMinutesLabel.Text = (-join((Get-Date).Minute, " Minutes"))
            $Script:RightSecondsLabel.Text = (-join((Get-Date).Second, " Seconds"))
            $Script:RightMilliSecondsLabel.Text = (-join((Get-Date).Millisecond, " Milliseconds"))

        }
        2 {
            Write-Host 2
            $Script:RightYearButton.Text = ''
        }
        3 {
            Write-Host 3
        }

    }
    if($Script:YearMode -eq 3) {
        $Script:YearMode = 1
    } else {
        $Script:YearMode++
    }

}

$Form = New-Object $FormObject
$Form.Text = 'My first project that actually does something cool'
$Form.ClientSize = '800, 800'
$Form.FormBorderStyle = 'Fixed3D'
$Form.BackColor = '#313131'

#Left Side
$DateLabel = New-Object $LabelObject
$DateLabel.Location = New-Object System.Drawing.Point(40, 40)
$DateLabel.Font = 'Comic Sans MS, 30, style=underline'
$DateLabel.ClientSize = '300, 100'
$DateLabel.Text = "$Day. $MonthName"


$Script:NumberLabel = New-Object $LabelObject
$Script:NumberLabel.Location = New-Object System.Drawing.Point(230, 350)
$Script:NumberLabel.Text = '24:60:600'
$Script:NumberLabel.Font = 'Comic Sans MS, 50, style=Bold'
$Script:NumberLabel.BackColor = 'transparent'
$Script:NumberLabel.ClientSize = '400, 100'

$finalNumber = (-join("$Hour",":","$Minute",":","$Second",":","$Millisecond"))
$Script:NumberLabel.Text = $finalNumber

# Right Side
#Year
$Script:RightYearButton = New-Object $LabelObject
$Script:RightYearButton.Location = New-Object System.Drawing.Point(550, 40)
$Script:RightYearButton.Text = (-join("$Year", " Years"))
$Script:RightYearButton.ClientSize = '240, 45'
$Script:RightYearButton.Font = 'Comic Sans MS, 30'
$Script:RightYearButton.BackColor = 'white'
$Script:RightYearButton.Add_Click({OpenYearDetailed})

$Script:RightMonthsLabel = New-Object $LabelObject
$Script:RightMonthsLabel.Location = New-Object System.Drawing.Point(625, 90)
$Script:RightMonthsLabel.ClientSize = '165, 45'
$Script:RightMonthsLabel.Font = 'Comic Sans MS, 25'
$Script:RightMonthsLabel.Text = (-join("$Month", " Months"))
$Script:RightMonthsLabel.BackColor = 'white'

$Script:RightDaysLabel = New-Object $LabelObject
$Script:RightDaysLabel.Location = New-Object System.Drawing.Point(660, 140)
$Script:RightDaysLabel.ClientSize = '130, 45'
$Script:RightDaysLabel.Font = 'Comic Sans MS, 23'
$Script:RightDaysLabel.Text = (-join("$DayOfMonth", " Days"))
$Script:RightDaysLabel.BackColor = 'white'

$Script:RightHoursLabel = New-Object $LabelObject
$Script:RightHoursLabel.Location = New-Object System.Drawing.Point(675, 190)
$Script:RightHoursLabel.ClientSize = '115, 45'
$Script:RightHoursLabel.Font = 'Comic Sans MS, 20'
$Script:RightHoursLabel.Text = (-join("$Hour", " Hours"))
$Script:RightHoursLabel.BackColor = 'white'

$Script:RightMinutesLabel = New-Object $LabelObject
$Script:RightMinutesLabel.Location = New-Object System.Drawing.Point(675, 240)
$Script:RightMinutesLabel.ClientSize = '115, 35'
$Script:RightMinutesLabel.Font = 'Comic Sans MS, 15'
$Script:RightMinutesLabel.Text = (-join("$Minute", " Minutes"))
$RightMinutesLabel.BackColor = 'white'

$Script:RightSecondsLabel = New-Object $LabelObject
$Script:RightSecondsLabel.Location = New-Object System.Drawing.Point(685, 280)
$Script:RightSecondsLabel.ClientSize = '105, 30'
$Script:RightSecondsLabel.Font = 'Comic Sans MS, 13'
$Script:RightSecondsLabel.Text = (-join("$Second", " Seconds"))
$Script:RightSecondsLabel.BackColor = 'white'

$RightMilliSecondsLabel = New-Object $LabelObject
$RightMilliSecondsLabel.Location = New-Object System.Drawing.Point(675, 315)
$RightMilliSecondsLabel.ClientSize = '115, 30'
$RightMilliSecondsLabel.Font = 'Comic Sans MS, 10'
$RightMilliSecondsLabel.Text = (-join("$MilliSecond", " Milliseconds"))
$RightMilliSecondsLabel.BackColor = 'white'



$Form.Controls.AddRange(@($RightYearButton, $RightMonthsLabel, $DateLabel, $NumberLabel, $RightDaysLabel, $RightHoursLabel, $RightMinutesLabel, $RightSecondsLabel, $RightMilliSecondsLabel))
$Form.ShowDialog()
$Form.Dispose()


#Modes:
#How far we are
#Total of ever
#Total of year

#$val = $true
#while($val -eq $true) {
#    $finalNumber = (-join((Get-Date).Hour,":",(Get-Date).Minute,":",(Get-Date).Second,":",(Get-Date).Millisecond))
#    $Script:NumberLabel.Text = $finalNumber
#    Write-Host $finalNumber
#}
