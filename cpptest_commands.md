# Static Analysis
```
cpptestcli -compiler gcc_13-64 -config "builtin://MISRA C 2025" -module . -input .build/compile_commands.json
```
# Code Coverage
## CMake Integration
In CMakeLists.txt:
```
set(CMAKE_EXPORT_COMPILE_COMMANDS 1)

if(CPPTEST_COVERAGE)
  include(cpptest-coverage.cmake) # copied from C/C++test CT install folder
endif()
```
## Manual Instrumentation (Make)
```
cpptestcc -compiler gcc_13-64 -line-coverage -statement-coverage -block-coverage -decision-coverage -simple-condition-coverage -mcdc-coverage -function-coverage -call-coverage -workspace .coverage -- <call to compiler + flags>
```

## Bazel Instrumentation
Add load() call to WORKSPACE.bazel to load C/C++test CT integration files:
```
local_repository(name = "cpptest", path = "/opt/parasoft/cpptest/2025.1.0/ct")
```

Add the following to your BUILD.bazel:
```
load("@cpptest//:integration/bazel/cpptest.bzl",
    "cpptest_generate_bdf",
    "cpptest_code_coverage_executable"
)
targets = [ "Timer" ]

# Generate Timer.bdf file (parameters set in .bazelrc):
# > bazel run --config=cpptest_bdf
# Run analysis with Timer.bdf file:
# > cpptestcli -config "builtin://Recommended Rules" -module . -input Timer.bdf -compiler gcc_10-64
cpptest_generate_bdf(
    name = "cpptest_bdf",
    deps = targets,
)

# Build test-binary with code coverage instrumentation (parameters set in .bazelrc):
# > bazel run --config=cpptest_coverage
# Execute test-binary:
# > bazel-bin/Timer.elf
# Generate coverage report:
# > cpptestcov compute -map .cpptest -clog cpptest_results.clog -out .coverage
# > cpptestcov report text .coverage
cpptest_code_coverage_executable(
    name = "cpptest_coverage",
    deps = targets, 
)
```

## Computing Coverage
```
cpptestcov compute -map=.build/cpptest-coverage -clog=.build/cpptest-coverage/Timer/Timer.clog -out=.coverage
```

## Generating Reports
```
cpptestcov report html .coverage
cpptestcov report html -code -coverage LC,SC,SCC,DC,MCDC -out report/coverage.html .coverage
cpptestcov report json .coverage
```

## Indexing for VS Code
```
cpptestcov index .coverage
```