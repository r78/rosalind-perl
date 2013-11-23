#!/bin/bash
find  *.pl -print0 | xargs -0 -I {} ./test.sh {}
