import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(S3PublishPluginTests.allTests),
    ]
}
#endif
