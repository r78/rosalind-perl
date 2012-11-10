#!/bin/bash
find  *.$1 -print0 | xargs -0 -I {} ./test.sh {}
