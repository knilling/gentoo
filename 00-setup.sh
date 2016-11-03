#!/bin/bash

for i in $(ls -1 *.sh | grep -Pv '^00'); do ./$i; done
