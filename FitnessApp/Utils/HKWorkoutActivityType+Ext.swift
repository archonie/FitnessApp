//
//  HKWorkoutActivityType+Ext.swift
//  FitnessApp
//
//  Created by Doğan Ensar Papuçcuoğlu on 5.01.2025.
//

import SwiftUI
import HealthKit

extension HKWorkoutActivityType {

    /*
     Simple mapping of available workout types to a human readable name.
     */
    var name: String {
        switch self {
        case .americanFootball:             return "American Football"
        case .archery:                      return "Archery"
        case .australianFootball:           return "Australian Football"
        case .badminton:                    return "Badminton"
        case .baseball:                     return "Baseball"
        case .basketball:                   return "Basketball"
        case .bowling:                      return "Bowling"
        case .boxing:                       return "Boxing"
        case .climbing:                     return "Climbing"
        case .crossTraining:                return "Cross Training"
        case .curling:                      return "Curling"
        case .cycling:                      return "Cycling"
        case .dance:                        return "Dance"
        case .danceInspiredTraining:        return "Dance Inspired Training"
        case .elliptical:                   return "Elliptical"
        case .equestrianSports:             return "Equestrian Sports"
        case .fencing:                      return "Fencing"
        case .fishing:                      return "Fishing"
        case .functionalStrengthTraining:   return "Functional Strength Training"
        case .golf:                         return "Golf"
        case .gymnastics:                   return "Gymnastics"
        case .handball:                     return "Handball"
        case .hiking:                       return "Hiking"
        case .hockey:                       return "Hockey"
        case .hunting:                      return "Hunting"
        case .lacrosse:                     return "Lacrosse"
        case .martialArts:                  return "Martial Arts"
        case .mindAndBody:                  return "Mind and Body"
        case .mixedMetabolicCardioTraining: return "Mixed Metabolic Cardio Training"
        case .paddleSports:                 return "Paddle Sports"
        case .play:                         return "Play"
        case .preparationAndRecovery:       return "Preparation and Recovery"
        case .racquetball:                  return "Racquetball"
        case .rowing:                       return "Rowing"
        case .rugby:                        return "Rugby"
        case .running:                      return "Running"
        case .sailing:                      return "Sailing"
        case .skatingSports:                return "Skating Sports"
        case .snowSports:                   return "Snow Sports"
        case .soccer:                       return "Soccer"
        case .softball:                     return "Softball"
        case .squash:                       return "Squash"
        case .stairClimbing:                return "Stair Climbing"
        case .surfingSports:                return "Surfing Sports"
        case .swimming:                     return "Swimming"
        case .tableTennis:                  return "Table Tennis"
        case .tennis:                       return "Tennis"
        case .trackAndField:                return "Track and Field"
        case .traditionalStrengthTraining:  return "Traditional Strength Training"
        case .volleyball:                   return "Volleyball"
        case .walking:                      return "Walking"
        case .waterFitness:                 return "Water Fitness"
        case .waterPolo:                    return "Water Polo"
        case .waterSports:                  return "Water Sports"
        case .wrestling:                    return "Wrestling"
        case .yoga:                         return "Yoga"

        // iOS 10
        case .barre:                        return "Barre"
        case .coreTraining:                 return "Core Training"
        case .crossCountrySkiing:           return "Cross Country Skiing"
        case .downhillSkiing:               return "Downhill Skiing"
        case .flexibility:                  return "Flexibility"
        case .highIntensityIntervalTraining:    return "High Intensity Interval Training"
        case .jumpRope:                     return "Jump Rope"
        case .kickboxing:                   return "Kickboxing"
        case .pilates:                      return "Pilates"
        case .snowboarding:                 return "Snowboarding"
        case .stairs:                       return "Stairs"
        case .stepTraining:                 return "Step Training"
        case .wheelchairWalkPace:           return "Wheelchair Walk Pace"
        case .wheelchairRunPace:            return "Wheelchair Run Pace"

        // iOS 11
        case .taiChi:                       return "Tai Chi"
        case .mixedCardio:                  return "Mixed Cardio"
        case .handCycling:                  return "Hand Cycling"

        // iOS 13
        case .discSports:                   return "Disc Sports"
        case .fitnessGaming:                return "Fitness Gaming"

        // Catch-all
        default:                            return "Other"
        }
    }

    var imageName: String {
        switch self {
        case .americanFootball:             return "football.fill"
        case .archery:                      return "arrow.up.right"
        case .australianFootball:           return "football.fill"
        case .badminton:                    return "figure.badminton"
        case .baseball:                     return "sportscourt"
        case .basketball:                   return "sportscourt"
        case .bowling:                      return "circle.dashed"
        case .boxing:                       return "figure.boxing"
        case .climbing:                     return "figure.rock.climbing"
        case .crossTraining:                return "figure.strengthtraining.traditional"
        case .curling:                      return "sportscourt"
        case .cycling:                      return "bicycle"
        case .dance:                        return "figure.dance"
        case .danceInspiredTraining:        return "figure.dance"
        case .elliptical:                   return "figure.elliptical"
        case .equestrianSports:             return "horse"
        case .fencing:                      return "sword"
        case .fishing:                      return "figure.wave"
        case .functionalStrengthTraining:   return "figure.strengthtraining.functional"
        case .golf:                         return "sportscourt"
        case .gymnastics:                   return "figure.gymnastics"
        case .handball:                     return "sportscourt"
        case .hiking:                       return "figure.hiking"
        case .hockey:                       return "sportscourt"
        case .hunting:                      return "scope"
        case .lacrosse:                     return "sportscourt"
        case .martialArts:                  return "figure.martial.arts"
        case .mindAndBody:                  return "figure.mind.and.body"
        case .mixedMetabolicCardioTraining: return "figure.strengthtraining.traditional"
        case .paddleSports:                 return "figure.rowing"
        case .play:                         return "figure.play"
        case .preparationAndRecovery:       return "figure.walk"
        case .racquetball:                  return "sportscourt"
        case .rowing:                       return "figure.rowing"
        case .rugby:                        return "sportscourt"
        case .running:                      return "figure.run"
        case .sailing:                      return "sailboat"
        case .skatingSports:                return "figure.skating"
        case .snowSports:                   return "snowflake"
        case .soccer:                       return "soccerball"
        case .softball:                     return "sportscourt"
        case .squash:                       return "sportscourt"
        case .stairClimbing:                return "figure.stairs"
        case .surfingSports:                return "waveform.path"
        case .swimming:                     return "figure.swimming"
        case .tableTennis:                  return "sportscourt"
        case .tennis:                       return "sportscourt"
        case .trackAndField:                return "figure.track.and.field"
        case .traditionalStrengthTraining:  return "figure.strengthtraining.traditional"
        case .volleyball:                   return "sportscourt"
        case .walking:                      return "figure.walk"
        case .waterFitness:                 return "drop"
        case .waterPolo:                    return "sportscourt"
        case .waterSports:                  return "drop"
        case .wrestling:                    return "figure.wrestling"
        case .yoga:                         return "figure.yoga"

        // iOS 10
        case .barre:                        return "figure.dance"
        case .coreTraining:                 return "figure.strengthtraining.functional"
        case .crossCountrySkiing:           return "figure.cross.country.skiing"
        case .downhillSkiing:               return "figure.downhill.skiing"
        case .flexibility:                  return "figure.mind.and.body"
        case .highIntensityIntervalTraining:return "figure.strengthtraining.traditional"
        case .jumpRope:                     return "figure.jump.rope"
        case .kickboxing:                   return "figure.martial.arts"
        case .pilates:                      return "figure.yoga"
        case .snowboarding:                 return "figure.snowboarding"
        case .stairs:                       return "figure.stairs"
        case .stepTraining:                 return "figure.step.training"
        case .wheelchairWalkPace:           return "figure.wheelchair"
        case .wheelchairRunPace:            return "figure.wheelchair"

        // iOS 11
        case .taiChi:                       return "figure.mind.and.body"
        case .mixedCardio:                  return "figure.strengthtraining.traditional"
        case .handCycling:                  return "hand.raised"

        // iOS 13
        case .discSports:                   return "sportscourt"
        case .fitnessGaming:                return "gamecontroller"

        // Catch-all
        default:                            return "questionmark"
        }
    }

    var color: Color {
        switch self {
        case .americanFootball:             return .brown
        case .archery:                      return .green
        case .australianFootball:           return .blue
        case .badminton:                    return .yellow
        case .baseball:                     return .red
        case .basketball:                   return .orange
        case .bowling:                      return .gray
        case .boxing:                       return .red
        case .climbing:                     return .purple
        case .crossTraining:                return .blue
        case .curling:                      return .gray
        case .cycling:                      return .yellow
        case .dance:                        return .pink
        case .danceInspiredTraining:        return .pink
        case .elliptical:                   return .teal
        case .equestrianSports:             return .brown
        case .fencing:                      return .white
        case .fishing:                      return .blue
        case .functionalStrengthTraining:   return .blue
        case .golf:                         return .green
        case .gymnastics:                   return .purple
        case .handball:                     return .orange
        case .hiking:                       return .green
        case .hockey:                       return .blue
        case .hunting:                      return .brown
        case .lacrosse:                     return .blue
        case .martialArts:                  return .red
        case .mindAndBody:                  return .mint
        case .mixedMetabolicCardioTraining: return .purple
        case .paddleSports:                 return .blue
        case .play:                         return .yellow
        case .preparationAndRecovery:       return .gray
        case .racquetball:                  return .blue
        case .rowing:                       return .teal
        case .rugby:                        return .green
        case .running:                      return .orange
        case .sailing:                      return .cyan
        case .skatingSports:                return .blue
        case .snowSports:                   return .white
        case .soccer:                       return .green
        case .softball:                     return .yellow
        case .squash:                       return .yellow
        case .stairClimbing:                return .gray
        case .surfingSports:                return .cyan
        case .swimming:                     return .blue
        case .tableTennis:                  return .green
        case .tennis:                       return .green
        case .trackAndField:                return .orange
        case .traditionalStrengthTraining:  return .blue
        case .volleyball:                   return .orange
        case .walking:                      return .teal
        case .waterFitness:                 return .blue
        case .waterPolo:                    return .cyan
        case .waterSports:                  return .blue
        case .wrestling:                    return .red
        case .yoga:                         return .mint

        // iOS 10
        case .barre:                        return .pink
        case .coreTraining:                 return .purple
        case .crossCountrySkiing:           return .white
        case .downhillSkiing:               return .white
        case .flexibility:                  return .mint
        case .highIntensityIntervalTraining:return .red
        case .jumpRope:                     return .orange
        case .kickboxing:                   return .red
        case .pilates:                      return .mint
        case .snowboarding:                 return .white
        case .stairs:                       return .gray
        case .stepTraining:                 return .blue
        case .wheelchairWalkPace:           return .gray
        case .wheelchairRunPace:            return .blue

        // iOS 11
        case .taiChi:                       return .mint
        case .mixedCardio:                  return .purple
        case .handCycling:                  return .teal

        // iOS 13
        case .discSports:                   return .yellow
        case .fitnessGaming:                return .orange

        // Catch-all
        default:                            return .gray
        }
    }

    
}
