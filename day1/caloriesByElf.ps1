$data = Get-Content -Path '/Users/tkennedy/REPOS/adventofcode2022/day1/calories.txt'

$fattestElf = 0
$caloriesCnt = 0

foreach ($row in $data) {
  if ($row -ne "") {
    $caloriesCnt += $row
  } else {
    if ($caloriesCnt -gt $fattestElf) {
      $fattestElf = $caloriesCnt
      $caloriesCnt = 0
    } else {
      $caloriesCnt = 0
    }
  }
}
return "Total Calories carried by the Fattest Elf: $fattestElf"