#!/usr/bin/env zsh
for n in 2_7 2_9 3_7 4_8 5_8; do
    p=1
    id=10
    j=1000
    for trial in 0 1 2; do
        for od in 4 5; do
            for it in 5 15 30; do
                ./runner.py run --specific \
                   --initial-divides $id \
                   --jobs $j \
                   --online-divides $od \
                   --initial-timeout $it \
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
done
