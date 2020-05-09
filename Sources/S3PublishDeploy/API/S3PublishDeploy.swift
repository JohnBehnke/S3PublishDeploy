//
//  S3PublishDeploy
//  Created by John Behnke on 5/9/20.
//  Copyright (c) John Behnke 2020
//  MIT license, see LICENSE file for details
//

import Foundation
import Publish
import ShellOut

public extension DeploymentMethod {

  /// Deploy a website to a specified S3 Bucket
  /// - Parameters:
  ///   - bucket: The name of the bucket that the website should be uploaded to.
  ///   - awsBinary: Path to the AWS binary if you have a non-standard installation
  ///   - sync: Whether a sync operation is done or not. If true, any file not present in the S3 bucket that _is_ present in the output directory will be removed.
  static func s3(_ bucket: String, pathToAWSBinary awsBinary: String = "/usr/local/bin/aws", sync: Bool = true)  -> Self {

    Self(name: "S3 \(bucket)") { context in
      let deploymentFolder = try! context.createDeploymentFolder(withPrefix: "S3-") { _ in }
      let s3 = S3(context: context, binPath: awsBinary, bucket: bucket, sourcePath: deploymentFolder.path, sync: sync)
      try s3.upload()
      try deploymentFolder.empty()

    }

  }
}
