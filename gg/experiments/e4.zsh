#!/usr/bin/env zsh
for n in 2_7 2_9 3_7 4_8 5_8; do
    p=1
    for trial in 0 1 2; do
            for id in 9 8 7; do
                j=$((2**$id))
                od=$(( ($id-1)/2+1 ))
               ./runner.py run --specific \
                   --initial-divides $id \
                   --jobs $j \
                   --online-divides $od \
                   --initial-timeout 30 \
                   --timeout-factor 1.5 \
                   --trial $trial \
                   --infra gg-lambda \
                   --timeout 7200 \
                   --divide-strategy largest-interval \
                   --acas \
                   --max-depth 5 \
                   $n \
                   $p
           done
   done
done
