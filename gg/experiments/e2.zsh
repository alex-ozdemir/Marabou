#!/usr/bin/env zsh
for n in 2_7 2_9 3_7 4_8 5_8; do
    p=1
    for trial in 0; do
        for infra in gg-local; do
            for id in 4 3 2; do
                j=$((2**$id))
               ./runner.py run --specific \
                   --initial-divides $id \
                   --jobs $j \
                   --online-divides 2 \
                   --initial-timeout 30 \
                   --timeout-factor 1.5 \
                   --trial $trial \
                   --infra $infra \
                   --timeout 7200 \
                   --divide-strategy largest-interval \
                   --acas \
                   $n \
                   $p
           done
       done
   done
done
