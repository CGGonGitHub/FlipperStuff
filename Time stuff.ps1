Add-Type -AssemblyName System.Windows.Forms
$FormObject = [System.Windows.Forms.Form]
$ButtonObject = [System.Windows.Forms.Button]
$DropDownObject = [System.Windows.Forms.ComboBox]
$LabelObject = [System.Windows.Forms.Label]
#Variables
$Script:YearMode = 1

$Form = New-Object $FormObject
$Form.Text = 'My first project that actually does something cool'
$Form.ClientSize = '800, 800'
$Form.FormBorderStyle = 'Fixed3D'
$Form.BackColor = '#313131'

#Year
$YearButton = New-Object $LabelObject
$YearButton.Location = New-Object System.Drawing.Point(700, 40)
$YearButton.Text = '2023'
$YearButton.ClientSize = '90, 45'
$YearButton.Font = 'Comic Sans MS, 23'
$YearButton.BackColor = 'transparent'
$YearButton.Add_Click({OpenYearDetailed})

$DateLabel = New-Object $LabelObject
$DateLabel.Location = New-Object System.Drawing.Point(40, 40)
$Day = (Get-Date).Day
$Month = (Get-Date).Month
$DateLabel.Text = "$Day, $Month"
$DateLabel 

$YearMonthsLabel = New-Object $LabelObject
$YearMonthsLabel.Location = New-Object System.Drawing.Point(700, 80)
$YearMonthsLabel.ClientSize = '120, 50'
$YearMonthsLabel.Font = 'Comic Sans MS, 23'
$YearMonthsLabel.Text = ''
$YearMonthsLabel.BackColor = 'white'

$Script:NumberLabel = New-Object $LabelObject
$Script:NumberLabel.Location = New-Object System.Drawing.Point(230, 350)
$Script:NumberLabel.Text = '24:60:600'
$Script:NumberLabel.Font = 'Comic Sans MS, 50, style=Bold'
$Script:NumberLabel.BackColor = 'transparent'
$Script:NumberLabel.ClientSize = '400, 100'




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

$Form.Controls.AddRange(@($YearButton, $YearMonthsLabel, $DateLabel, $NumberLabel))
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