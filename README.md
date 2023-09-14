# Timer

# Usage with C/C++test Standard Edition
## Overview

# Usage with C/C++test Coverage (Next Gen) Edition

### Make
```
make clean all
```
### CMake
```
mkdir .build
cd .build
cmake -DCPPTEST_COVERAGE=ON ..
make
```
### BAZEL
Basic compilation
```
bazel clean
bazel build //:Timer
```
Instrumentation
```
bazel clean
bazel run --config=cpptest_coverage
```

## Building with C/C++test Coverage (Next Gen) Edition
### Make
```
make clean all
```
### CMake
```
mkdir .build
cd .build
cmake -DCPPTEST_COVERAGE=ON ..
make
```
### BAZEL
Basic compilation
```
bazel clean
bazel build //:Timer
```
Instrumentation
```
bazel clean
bazel run --config=cpptest_coverage
```