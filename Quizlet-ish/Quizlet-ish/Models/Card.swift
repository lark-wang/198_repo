//
//  Card.swift
//  Quizlet-ish
//
//  Created by Ellen Zheng on 4/15/22.
//

import Foundation
import FirebaseFirestoreSwift

struct Card: Identifiable, Codable {
  @DocumentID var id: String?
  var question: String
  var answer: String
  var successful: Bool = true
  var userId: String?
}
