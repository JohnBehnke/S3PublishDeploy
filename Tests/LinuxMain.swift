import XCTest

import S3PublishPluginTests

var tests = [XCTestCaseEntry]()
tests += S3PublishDeployTests.allTests()
XCTMain(tests)
