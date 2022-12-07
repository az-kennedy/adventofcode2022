$data = Get-Content -Path '/Users/tkennedy/REPOS/adventofcode2022/day 3/input.txt'

$sum = 0

$priorityHash = new-object System.Collections.Hashtable

$priorityHash['a'] = 1
$priorityHash['b'] = 2
$priorityHash['c'] = 3
$priorityHash['d'] = 4
$priorityHash['e'] = 5
$priorityHash['f'] = 6
$priorityHash['g'] = 7
$priorityHash['h'] = 8
$priorityHash['i'] = 9
$priorityHash['j'] = 10
$priorityHash['k'] = 11
$priorityHash['l'] = 12
$priorityHash['m'] = 13
$priorityHash['n'] = 14
$priorityHash['o'] = 15
$priorityHash['p'] = 16
$priorityHash['q'] = 17
$priorityHash['r'] = 18
$priorityHash['s'] = 19
$priorityHash['t'] = 20
$priorityHash['u'] = 21
$priorityHash['v'] = 22
$priorityHash['w'] = 23
$priorityHash['x'] = 24
$priorityHash['y'] = 25
$priorityHash['z'] = 26
$priorityHash['A'] = 27
$priorityHash['B'] = 28
$priorityHash['C'] = 29
$priorityHash['D'] = 30
$priorityHash['E'] = 31
$priorityHash['F'] = 32
$priorityHash['G'] = 33
$priorityHash['H'] = 34
$priorityHash['I'] = 35
$priorityHash['J'] = 36
$priorityHash['K'] = 37
$priorityHash['L'] = 38
$priorityHash['M'] = 39
$priorityHash['N'] = 40
$priorityHash['O'] = 41
$priorityHash['P'] = 42
$priorityHash['Q'] = 43
$priorityHash['R'] = 44
$priorityHash['S'] = 45
$priorityHash['T'] = 46
$priorityHash['U'] = 47
$priorityHash['V'] = 48
$priorityHash['W'] = 49
$priorityHash['X'] = 50
$priorityHash['Y'] = 51
$priorityHash['Z'] = 52


foreach ($row in $data) {
  $length = $row.length
  $half = $length / 2

  # $left = $row.Substring(0,$half)
  # $right = $row.Substring($half,$half)

  $left = ($row.Substring(0,$half)).ToCharArray() | select -Unique
  $right = ($row.Substring($half,$half)).ToCharArray() | select -Unique


  foreach ($char in $left){
    if ($right -ccontains $char) {
      $pscore = $priorityHash["$char"]
      Write-Host "Char [$char] found in both compartments with a score of [$pscore]"
      
      $sum += $pscore
    }
  }
}

return $sum