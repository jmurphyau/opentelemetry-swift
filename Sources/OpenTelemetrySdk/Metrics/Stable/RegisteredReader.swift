//
// Copyright The OpenTelemetry Authors
// SPDX-License-Identifier: Apache-2.0
// 

import Foundation
import OpenTelemetryApi
import Atomics

public class RegisteredReader : Equatable, Hashable {
    private(set) static var id_counter = ManagedAtomic<Int32>(0)
    public let id : Int32
    public let reader : StableMetricReader
    public let registry : StableViewRegistry
    public var lastCollectedEpochNanos : UInt64 = 0
    
    internal init(reader: StableMetricReader, registry: StableViewRegistry) {
        id = RegisteredReader.id_counter.wrappingIncrementThenLoad(ordering: .relaxed)
        self.reader = reader
        self.registry = registry
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: RegisteredReader, rhs: RegisteredReader) -> Bool {
        if lhs === rhs {
            return true
        }
        return lhs.id == rhs.id
    }
}
