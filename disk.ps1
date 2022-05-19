$disk =Get-Disk | where PartitionStyle  -eq 'raw' | sort Number
$letter = 70..89 | ForEach-Object { [char]$_}
$count=0
$labels ='data1','data2'

foreach ($disk in $disks){
 $driveletter = $letter[$count].ToSingle()
 $disk | 
 Initialize-Disk -PartitionStyle MBR -PassThru |

 New-Partition -UseMaximumSize -AssignDriveLetter $driveletter |
 
 Format-Volume -FileSystem NTFS -NewFileSystemLabel $labels[$count] -Confirm:$false -Force
 $count++  
}
