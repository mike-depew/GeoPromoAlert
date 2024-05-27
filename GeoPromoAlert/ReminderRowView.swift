//
//  ReminderRowView.swift
//  GeoPromoAlert
//
import SwiftUI

struct ReminderRowView: View {
    var reminder: Reminder
    
    var body: some View {
        Text(reminder.title)
    }
}
