//
//  SelectBasalProfilePumpEvent.swift
//  RileyLink
//
//  Created by Nate Racklyeft on 6/15/16.
//  Copyright © 2016 Pete Schwamb. All rights reserved.
//

import Foundation

public struct SelectBasalProfilePumpEvent: TimestampedPumpEvent {
    public let length: Int
    public let rawData: NSData
    public let timestamp: NSDateComponents

    public init?(availableData: NSData, pumpModel: PumpModel) {
        length = 7

        guard length <= availableData.length else {
            return nil
        }

        rawData = availableData[0..<length]

        timestamp = NSDateComponents(pumpEventData: availableData, offset: 2)
    }

    public var dictionaryRepresentation: [String: AnyObject] {
        return [
            "_type": "SelectBasalProfile",
        ]
    }
}
