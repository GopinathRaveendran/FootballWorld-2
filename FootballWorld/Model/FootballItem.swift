//
//  FootballItem.swift
//  FootballWorld
//
//  Created by gopinath.raveendran on 10/09/2022.
//

import Foundation


// MARK: - FootballItem
struct FootballItem: Codable {
    let filters: Filters
    let resultSet: ResultSet
    let matches: [Match]
}

// MARK: - Filters
struct Filters: Codable {
    let dateFrom, dateTo, permission: String
}

// MARK: - Match
struct Match: Codable {
    let area: Area
    let competition: Competition
    let season: Season
    let id: Int
    let utcDate: Date
    let status: Status
    let matchday: Int
    let stage: Stage
    let group: JSONNull?
    let lastUpdated: Date
    let homeTeam, awayTeam: Team
    let score: Score
    let odds: Odds
    let referees: [Referee]
}

// MARK: - Area
struct Area: Codable {
    let id: Int
    let name, code: String
    let flag: String
}

// MARK: - Team
struct Team: Codable {
    let id: Int
    let name, shortName, tla: String
    let crest: String
}

// MARK: - Competition
struct Competition: Codable {
    let id: Int
    let name, code: String
    let type: CompetitionType
    let emblem: String
}

enum CompetitionType: String, Codable {
    case league = "LEAGUE"
}

// MARK: - Odds
struct Odds: Codable {
    let msg: Msg
}

enum Msg: String, Codable {
    case activateOddsPackageInUserPanelToRetrieveOdds = "Activate Odds-Package in User-Panel to retrieve odds."
}

// MARK: - Referee
struct Referee: Codable {
    let id: Int
    let name: String
    let type: RefereeType
    let nationality: String
}

enum RefereeType: String, Codable {
    case referee = "REFEREE"
}

// MARK: - Score
struct Score: Codable {
    let winner: Winner?
    let duration: Duration
    let fullTime, halfTime: Time
}

enum Duration: String, Codable {
    case regular = "REGULAR"
}

// MARK: - Time
struct Time: Codable {
    let home, away: Int?
}

enum Winner: String, Codable {
    case awayTeam = "AWAY_TEAM"
    case draw = "DRAW"
    case homeTeam = "HOME_TEAM"
}

// MARK: - Season
struct Season: Codable {
    let id: Int
    let startDate, endDate: String
    let currentMatchday: Int
    let winner: JSONNull?
}

enum Stage: String, Codable {
    case regularSeason = "REGULAR_SEASON"
}

enum Status: String, Codable {
    case finished = "FINISHED"
    case inPlay = "IN_PLAY"
    case postponed = "POSTPONED"
    case timed = "TIMED"
}

// MARK: - ResultSet
struct ResultSet: Codable {
    let count: Int
    let competitions, first, last: String
    let played: Int
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
