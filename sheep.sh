
SHEEP_INTERPRETER="sh -c"

function it() {
  local testdesc="$@"
  local testbody="$(cat)"
  printf "$testdesc"
  run="set -x; eval '$testbody'"
  out="$($SHEEP_INTERPRETER "$run" 2>&1 )"
  if [ "$?" != 0 ]; then
    printf "\t Fail\n"
    echo "$out"
  else
    printf "\t Succeed\n"
  fi
}
