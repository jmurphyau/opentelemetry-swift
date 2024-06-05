/*
 * Copyright The OpenTelemetry Authors
 * SPDX-License-Identifier: Apache-2.0
 */

import Foundation

public class ApplicationDataSource: IApplicationDataSource {
    public init() {}
    
    public var name: String? {
        Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String
    }

    public var identifier: String? {
        Bundle.main.object(forInfoDictionaryKey: "CFBundleIdentifier") as? String
    }

    public var version: String? {
        Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }

    public var build: String? {
        Bundle.main.object(forInfoDictionaryKey: "CFBundleVersionKey") as? String
    }
}
