#!/bin/bash

#!/bin/bash
echo "Configuring Terminal Session to Utilize C/C++test Standard Edition 2023.1.0"
export PARASOFT_CONTEXT="C/C++test Standard Edition 2023.1.0"
export PATH="${PATH}:/opt/parasoft/cpptest/std/2023.1.0/:/opt/parasoft/cpptest/std/2023.1.0/bin/"

code &