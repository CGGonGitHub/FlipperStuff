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
$YearButton = New-Object $LabelObject
$YearButton.Location = New-Object System.Drawing.Point(550, 40)
$YearButton.Text = (-join("$Year", " Years"))
$YearButton.ClientSize = '240, 45'
$YearButton.Font = 'Comic Sans MS, 30'
$YearButton.BackColor = 'white'
$YearButton.Add_Click({OpenYearDetailed})

$YearMonthsLabel = New-Object $LabelObject
$YearMonthsLabel.Location = New-Object System.Drawing.Point(625, 90)
$YearMonthsLabel.ClientSize = '165, 45'
$YearMonthsLabel.Font = 'Comic Sans MS, 25'
$YearMonthsLabel.Text = (-join("$Month", " Months"))
$YearMonthsLabel.BackColor = 'white'

$YearDaysLabel = New-Object $LabelObject
$YearDaysLabel.Location = New-Object System.Drawing.Point(660, 140)
$YearDaysLabel.ClientSize = '130, 45'
$YearDaysLabel.Font = 'Comic Sans MS, 23'
$YearDaysLabel.Text = (-join("$DayOfMonth", " Days"))
$YearDaysLabel.BackColor = 'white'

$YearHoursLabel = New-Object $LabelObject
$YearHoursLabel.Location = New-Object System.Drawing.Point(675, 190)
$YearHoursLabel.ClientSize = '115, 45'
$YearHoursLabel.Font = 'Comic Sans MS, 20'
$YearHoursLabel.Text = (-join("$Hour", " Hours"))
$YearHoursLabel.BackColor = 'white'

$YearMinutesLabel = New-Object $LabelObject
$YearMinutesLabel.Location = New-Object System.Drawing.Point(675, 240)
$YearMinutesLabel.ClientSize = '115, 35'
$YearMinutesLabel.Font = 'Comic Sans MS, 15'
$YearMinutesLabel.Text = (-join("$Minute", " Minutes"))
$YearMinutesLabel.BackColor = 'white'

$YearSecondsLabel = New-Object $LabelObject
$YearSecondsLabel.Location = New-Object System.Drawing.Point(685, 280)
$YearSecondsLabel.ClientSize = '105, 30'
$YearSecondsLabel.Font = 'Comic Sans MS, 13'
$YearSecondsLabel.Text = (-join("$Second", " Seconds"))
$YearSecondsLabel.BackColor = 'white'

$YearMilliSecondsLabel = New-Object $LabelObject
$YearMilliSecondsLabel.Location = New-Object System.Drawing.Point(675, 315)
$YearMilliSecondsLabel.ClientSize = '115, 30'
$YearMilliSecondsLabel.Font = 'Comic Sans MS, 10'
$YearMilliSecondsLabel.Text = (-join("$MilliSecond", " Milliseconds"))
$YearMilliSecondsLabel.BackColor = 'white'


function OpenYearDetailed {
    Switch($Script:YearMode) {
        1 {
            Write-Host 1
        }
        2 {
            Write-Host 2
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

$Form.Controls.AddRange(@($YearButton, $YearMonthsLabel, $DateLabel, $NumberLabel, $YearDaysLabel, $YearHoursLabel, $YearMinutesLabel, $YearSecondsLabel, $YearMilliSecondsLabel))
$Form.ShowDialog()
$Form.Dispose()

#while( $true) {
#    $Hour = (Get-Date).Hour
#    $Minute = (Get-Date).Minute
#    $Second = (Get-Date).Second
#    $Millisecond = (Get-Date).Millisecond
#
#
#    $finalNumber = (-join("$Hour",":","$Minute",":","$Second",":","$Millisecond"))
#    $Script:NumberLabel.Text = $finalNumber
#}

#Modes:
#How far we are
#Total of ever
#Total of year
