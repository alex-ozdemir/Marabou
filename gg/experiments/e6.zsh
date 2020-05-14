#!/usr/bin/env zsh
p=1
for id in $(seq 2 10); do
    [ $id = 10 ] && j=1000 || j=$((2**$id))
    od=$(( ($id+5)/3 ))
    argslist=$(
        for trial in 0 1 2; do
            for n in 2_7 2_9 3_7 4_8 5_8; do
                echo run --specific \
                   --initial-divides $id \
                   --trial $trial \
                   --jobs $j \
                   --online-divides $od \
                   --initial-timeout 30 \
                   --timeout-factor 1.5 \
                   --infra gg-lambda \
                   --timeout 7200 \
                   --divide-strategy largest-interval \
                   --acas \
                   --max-depth 5 \
                   $n \
                   $p
           done
       done
    )
   [ $j = 1000 ] && jj=1 || jj=$(( 512 / $j ))
   echo $argslist | GG_FORCE_NO_STATUS=1 parallel --colsep ' ' -j $jj ./runner.py
done
