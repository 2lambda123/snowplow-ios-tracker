//
// DeepLinkReceived.swift
// Snowplow
//
// Copyright (c) 2013-2022 Snowplow Analytics Ltd. All rights reserved.
//
// This program is licensed to you under the Apache License Version 2.0,
// and you may not use this file except in compliance with the Apache License
// Version 2.0. You may obtain a copy of the Apache License Version 2.0 at
// http://www.apache.org/licenses/LICENSE-2.0.
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the Apache License Version 2.0 is distributed on
// an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the Apache License Version 2.0 for the specific
// language governing permissions and limitations there under.
//
// License: Apache License Version 2.0
//

import Foundation

/// A deep-link received in the app.
@objc(SPDeepLinkReceived)
public class DeepLinkReceived: SelfDescribingAbstract {
    /// Referrer URL, source of this deep-link.
    @objc
    public var referrer: String?
    /// URL in the received deep-link.
    @objc
    public var url: String

    /// Creates a deep-link received event.
    /// @param url URL in the received deep-link.
    @objc
    public init(url: String) {
        self.url = url
    }
    
    @objc
    public class var schema: String {
        return "iglu:com.snowplowanalytics.mobile/deep_link_received/jsonschema/1-0-0"
    }

    @objc
    public class var paramUrl: String {
        return "url"
    }

    @objc
    public class var paramReferrer: String {
        return "referrer"
    }

    public override var schema: String {
        return DeepLinkReceived.schema
    }

    public override var payload: [String : NSObject] {
        var payload: [String : NSObject] = [:]
        if let referrer = referrer {
            payload[DeepLinkReceived.paramReferrer] = referrer as NSObject
        }
        payload[DeepLinkReceived.paramUrl] = url as NSObject
        return payload
    }
}
