#!/usr/bin/env zsh
p=1
for id in 4; do
    [ $id = 10 ] && j=1000 || j=$((2**$id))
    od=$(( ($id+5)/3 ))
    trial=0
    for infra in gg-local thread; do
        for n in 2_7 2_9 3_7 4_8 5_8; do
            ./runner.py run --specific \
               --initial-divides $id \
               --trial $trial \
               --jobs $j \
               --online-divides $od \
               --initial-timeout 30 \
               --timeout-factor 1.5 \
               --infra $infra \
               --timeout 7200 \
               --divide-strategy largest-interval \
               --acas \
               --max-depth 5 \
               $n \
               $p
       done
   done
done
