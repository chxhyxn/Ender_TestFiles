//
//  StackPanicView.swift
//  TestApp
//
//  Created by SeanCho on 5/8/25.
//

import SwiftUI

struct StackPanicView: View {
    @State private var count = 0

    var body: some View {
        NavigationStack {
            VStack(alignment: .trailing, spacing: 1) {
                NavigationStack {
                    ZStack(alignment: .topLeading) {
                        Color(.systemBackground)
                        VStack(spacing: 2) {
                            HStack {
                                AnyView(
                                    ZStack {
                                        Color.clear
                                        Text("Depth 1")
                                    }
                                )
                                Spacer(minLength: 0)
                                NavigationStack {
                                    VStack {
                                        Text("Depth 2")
                                        ZStack {
                                            Color.green.opacity(0.2)
                                            VStack {
                                                HStack {
                                                    Text("Depth 3")
                                                    Spacer()
                                                    Image(
                                                        systemName: "star.fill"
                                                    )
                                                    .foregroundStyle(.white)
                                                    .background(
                                                        Circle()
                                                    )
                                                    .overlay(
                                                        Circle()
                                                            .stroke(
                                                                .red,
                                                                lineWidth: 2)
                                                    )
                                                }
                                                ZStack {
                                                    Color.red.opacity(0.15)
                                                    VStack {
                                                        HStack {
                                                            Spacer()
                                                            Text("Depth 4")
                                                                .foregroundStyle(
                                                                    .secondary)
                                                        }
                                                        Button("🔄 Tap") {
                                                            count += 1
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                Text("Tap count: \(count)")
                    .font(.caption)
                    .padding(.top, 20)
                    .toolbar {

                        ToolbarItem(
                            placement: .topBarLeading,
                            content: {

                                Button("Cancel", role: .cancel) {

                                }})

                        ToolbarItem(
                            placement: .topBarTrailing,
                            content: {

                                Button("Add") {

                                }})

                    }

            }
        }
    }
}
