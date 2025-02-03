#!/bin/bash
CPPTEST_VERSION=2024.2.0

echo "Configuring Terminal Session to Utilize C/C++test Professional Edition ${CPPTEST_VERSION}"
export PARASOFT_CONTEXT="C/C++test Professional Edition ${CPPTEST_VERSION}"
export PATH="${PATH}:/opt/parasoft/cpptest/${CPPTEST_VERSION}/pro:/opt/parasoft/cpptest/${CPPTEST_VERSION}/pro/bin/"