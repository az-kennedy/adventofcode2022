# $data = Get-Content -Path '/Users/tkennedy/REPOS/adventofcode2022/day1/calories.txt'

# $fattestElf = 0
# $caloriesCnt = 0

# foreach ($row in $data) {
#   if ($row -ne "") {
#     $caloriesCnt += $row
#   } else {
#     if ($caloriesCnt -gt $fattestElf) {
#       $fattestElf = $caloriesCnt
#       $caloriesCnt = 0
#     } else {
#       $caloriesCnt = 0
#     }
#   }
# }
# return "Total Calories carried by the Fattest Elf: $fattestElf"

$data = Get-Content -Path '/Users/tkennedy/REPOS/adventofcode2022/day1/calories.txt'

$count = 1
$fattestElfHash = @{}
$caloriesCnt = 0

foreach ($row in $data) {
  if ($row -ne "") {
    $caloriesCnt += $row
  } else {
    $fattestElfHash["Elf $count"] = $caloriesCnt
    $caloriesCnt = 0
    $count += 1
  }
}

# Top 3 elves with most calories:
$sorted = $fattestElfHash.GetEnumerator() | Sort-Object -Property Value

$sum = 0
foreach ($row in $($sorted[-1..-3])){
  $sum += $row.Value
}

return $sum