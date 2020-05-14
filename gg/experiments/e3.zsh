#!/usr/bin/env zsh
for n in 2_7 2_9 3_7 4_8 5_8; do
    p=1
    for trial in 0; do
            for id in 2; do
                j=$((2**$id))
               ./runner.py run --specific \
                   --initial-divides $id \
                   --jobs $j \
                   --online-divides 2 \
                   --initial-timeout 30 \
                   --timeout-factor 1.5 \
                   --trial $trial \
                   --infra thread \
                   --timeout 7200 \
                   --divide-strategy largest-interval \
                   --acas \
                   --max-depth 5 \
                   $n \
                   $p &
               PS1=$!
               ./runner.py run --specific \
                   --initial-divides $id \
                   --jobs $j \
                   --online-divides 2 \
                   --initial-timeout 30 \
                   --timeout-factor 1.5 \
                   --trial $trial \
                   --infra gg-local \
                   --timeout 7200 \
                   --divide-strategy largest-interval \
                   --acas \
                   --max-depth 5 \
                   $n \
                   $p &
               PS2=$!

               wait $PS1 $PS2

           done
   done
done

for n in 2_7 2_9 3_7 4_8 5_8; do
    p=1
    for trial in 0; do
        for infra in gg-local thread; do
            for id in 3 4; do
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
                   --max-depth 5 \
                   $n \
                   $p
           done
       done
   done
done
