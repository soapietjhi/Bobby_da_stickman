//
//  ContentView.swift
//  stick-figure
//
//  Created by YJ Soon on 1/8/25.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            StickMan()
                .stroke(lineWidth: 4)
                .foregroundColor(.black)

            // Add more EmojiViews to decorate your Bobby
            EmojiView(symbol: "👩🏼‍🦱", size: 80, x: 1,  y: -140)
            EmojiView(symbol: "🥚", size: 66, x: 0,  y: -130)
            EmojiView(symbol: "👄", size: 35, x: 0,  y: -120)
            EmojiView(symbol: "🔴", size: 10, x: -18,  y: -128)
            EmojiView(symbol: "🔴", size: 10, x: 18,  y: -128)
            EmojiView(symbol: "👁️", size:15 , x: 12, y:-140)
            EmojiView(symbol: "👁️", size:15 , x: -12, y:-140)
            EmojiView(symbol: "👠", size: 25, x: 40,  y: 70)
            EmojiView(symbol: "👠", size: 25, x: -40,  y: 70)
            EmojiView(symbol: "👜", size: 35, x: -50,  y: -50)
            EmojiView(symbol: "🌫️", size: 20, x: 0,  y: -90)
            EmojiView(symbol: "👗", size: 100, x: 0,  y: -50)
            EmojiView(symbol: "💵", size: 35, x: 55,  y: -50)
            EmojiView(symbol: "💸", size: 35, x: 60,  y: -180)
            EmojiView(symbol: "💸", size: 35, x: 75,  y: -185)
            EmojiView(symbol: "🎀", size: 25, x: -25,  y: -158)
            EmojiView(symbol: "🛍️", size: 70, x: -100,  y: 60)
            EmojiView(symbol: "🛍️", size: 70, x: 110,  y: 60)
            
            
        }
        .frame(width: 200, height: 320)
    }
}

/// Basic stickman
struct StickMan: Shape {
    func path(in rect: CGRect) -> Path {
        var p = Path()

        // Head
        let headRadius: CGFloat = 30
        let headCentre = CGPoint(x: rect.midX, y: rect.minY + headRadius)
        p.addEllipse(in: CGRect(
            x: headCentre.x - headRadius,
            y: headCentre.y - headRadius,
            width: headRadius * 2,
            height: headRadius * 2))

        // Body line
        let neck = CGPoint(x: headCentre.x, y: headCentre.y + headRadius)
        let hip = CGPoint(x: headCentre.x, y: neck.y + 90)
        p.move(to: neck); p.addLine(to: hip)

        // Arms
        let leftHand  = CGPoint(x: neck.x - 60, y: neck.y + 40)
        let rightHand = CGPoint(x: neck.x + 60, y: neck.y + 40)
        p.move(to: CGPoint(x: neck.x, y: neck.y + 30))
        p.addLine(to: leftHand)
        p.move(to: CGPoint(x: neck.x, y: neck.y + 30))
        p.addLine(to: rightHand)

        // Legs
        let leftFoot  = CGPoint(x: hip.x - 45, y: hip.y + 90)
        let rightFoot = CGPoint(x: hip.x + 45, y: hip.y + 90)
        p.move(to: hip); p.addLine(to: leftFoot)
        p.move(to: hip); p.addLine(to: rightFoot)

        return p
    }
}

/// Reusable emoji decorator
struct EmojiView: View {
    let symbol: String
    let size: CGFloat
    let x: CGFloat
    let y: CGFloat
    var body: some View {
        Text(symbol)
            .font(.system(size: size))
            .offset(x: x, y: y)
    }
}


#Preview {
    ContentView()
}
