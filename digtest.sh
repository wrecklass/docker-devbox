#!/bin/bash
declare -i START=$(date +'%s')
declare -i DT=$START

declare -i END=$((START + 600))
declare -i OLD=$DT
declare -i DIFF=0
declare -i COUNT=0
declare -i itis=0
declare -i itwas=0
declare -i failed=0

printf "0) "
while (( DT < END ))
do
  #tim=$(dig esbauthuat.corp.chartercom.com  | grep Query | awk '{print $4" "$5}')
  tim=$(curl -4sS  http://esbauthuat.corp.chartercom.com:11102/ -w "%{time_namelookup}" )
  COUNT=$((COUNT + 1))
  DT=$(date +'%s')
  DIFF=$((DT-OLD))
  itis=$((END-DT))
  printf "$COUNT  "
  if [ $DIFF -gt 1 ];then
    printf "\n%d) @time: %d Name Lookup took: %3.3f\n" "${COUNT}" "${itis}" "${tim}"
    #cat digtest.data
    failed=$((failed+1))
  fi
  [[ $((COUNT % 100)) == 0 ]] && printf "\n%d) " ${COUNT}
  OLD=$DT
  #if [ $itis -ne $itwas ];then
    # printf "%d attempts, %d seconds to finish.\n" "$COUNT" "$((END - DT))"
    #printf "%d) Name Lookup: %3.3f\n" "${COUNT}" "${tim}"
    #itwas=$itis
  #fi
done
printf "%d attempts, Failures: %d\n" "$COUNT" "$failed"
# curl -s http://esbauthuat.corp.chartercom.com:11102 -w "Name Lookup: %{time_namelookup}\nConnection:  %{time_connect}\nTotal Time:  %{time_total}\n"
