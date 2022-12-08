$data = Get-Content -Path '/Users/tkennedy/REPOS/adventofcode2022/day 4/input.txt'

$overlapping = 0

foreach ($row in $data) {
  $split = $row.Split(',')

  $elf1 = $split[0].split('-')
  $elf2 = $split[1].split('-')

  # compare the elf cleaning zones between eachother
  Write-Host "
  Elf1 : $elf1
  Elf2 : $elf2
  "
  if (([int]$elf1[0] -le [int]$elf2[0]) -and ([int]$elf1[1] -ge [int]$elf2[1])) {
    $overlapping += 1
  } else {
    if (([int]$elf1[0] -ge [int]$elf2[0]) -and ([int]$elf1[1] -le [int]$elf2[1])) {
      $overlapping += 1
    }
  }

  

}

return $overlapping