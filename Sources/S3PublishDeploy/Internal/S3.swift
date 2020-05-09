//
//  S3
//  Created by John Behnke on 5/9/20.
//  Copyright (c) John Behnke 2020
//  MIT license, see LICENSE file for details
//

import ShellOut
import Publish

struct S3<Site: Website> {
  let context: PublishingContext<Site>
  let binPath: String
  let bucket: String
  let sourcePath: String
  let sync: Bool

  /// Upload to AWS S3
  /// - Throws: ShelloutError if an error happens during the upload process
  /// - Throws: AWSError if the AWS Binary file couldn't be located
  func upload() throws {
    try checkAWSBinaryLocation()

    do {
      try shellOut(
        to: "\(self.binPath) s3 sync . s3://\(self.bucket)",
        at: self.sourcePath
      )
    } catch let error as ShellOutError {
      throw PublishingError(infoMessage: error.message)
    } catch {
      throw error
    }
  }
}

private extension S3 {
  func checkAWSBinaryLocation() throws {
    do {
      let binPath = try shellOut(
        to: "which aws"
      )
      if binPath.isEmpty {
        throw AWSError.noBinaryFound
      }
    } catch let error as ShellOutError {
      throw error
    }
  }
}


