
$data = Get-Content -Path '/Users/tkennedy/REPOS/adventofcode2022/day 2/input.txt'

$score    = 0

$rock     = 1
$paper    = 2
$scissors = 3
$loss     = 0
$draw     = 3
$win      = 6

function Start-RockPaperScissors {
  param (
    # Option1
    [Parameter(mandatory=$true)]
    [string]
    $left,

    # Option2
    [Parameter(mandatory=$true)]
    [string]
    $right
  )
  
  if (($left -eq 'rock') -and ($right -eq 'rock')) {
    return "draw"
  }

  if (($left -eq 'rock') -and ($right -eq 'paper')) {
    return "right"
  }

  if (($left -eq 'rock') -and ($right -eq 'scissors')) {
    return "left"
  }

  if (($left -eq 'paper') -and ($right -eq 'rock')) {
    return "left"
  }
  
  if (($left -eq 'paper') -and ($right -eq 'paper')) {
    return "draw"
  }

  if (($left -eq 'paper') -and ($right -eq 'scissors')) {
    return "right"
  }

  if (($left -eq 'scissors') -and ($right -eq 'rock')) {
    return "right"
  }

  if (($left -eq 'scissors') -and ($right -eq 'paper')) {
    return "left"
  }

  if (($left -eq 'scissors') -and ($right -eq 'scissors')) {
    return "draw"
  }
}

foreach ($row in $data) {
  # Process points here
  $split = $row.split(" ")
  $elf = $split[0].trim()
  $me = $split[1].trim()

  # Set vars...
  if ($me -eq 'X') {
    $me = 'rock'
  }
  if ($me -eq 'Y') {
    $me = 'paper'
  }
  if ($me -eq 'Z') {
    $me = 'scissors'
  }
  if ($elf -eq 'A') {
    $elf = 'rock'
  }
  if ($elf -eq 'B') {
    $elf = 'paper'
  }
  if ($elf -eq 'C') {
    $elf = 'scissors'
  }

  $winner = Start-RockPaperScissors -left $elf -right $me

  if ($winner -eq 'right'){
    $score += 6
  }  

  if ($winner -eq 'draw'){
    $score += 3
  }  
  
  if($me -eq 'rock'){
    $score += 1
  }
  if($me -eq 'paper'){
    $score += 2
  }
  if($me -eq 'scissors'){
    $score += 3
  }
}

return $score