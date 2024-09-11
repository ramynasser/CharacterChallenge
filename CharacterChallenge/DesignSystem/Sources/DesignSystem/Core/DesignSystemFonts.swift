//
//  File.swift
//  
//
//  Created by Ramy Nasser on 10/09/2024.
//

import SwiftUI

public class DesignSystemFonts {
    public enum Heading {
        public static let sm = Font.custom("NotoSans-Bold", size: 12)
        public static let md = Font.custom("NotoSans-Bold", size: 14)
        public static let lg = Font.custom("NotoSans-Bold", size: 16)
        public static let xl = Font.custom("NotoSans-Bold", size: 18)
        public static let xl2 = Font.custom("NotoSans-Bold", size: 20)
        public static let xl3 = Font.custom("NotoSans-Bold", size: 24)
        public static let xl4 = Font.custom("NotoSans-Bold", size: 28)
        public static let xl5 = Font.custom("NotoSans-Bold", size: 32)
        public static let xl8 = Font.custom("NotoSans-Bold", size: 48)
    }

    public enum Body {
        public static let sm = Font.custom("NotoSans-Regular", size: 12)
        public static let md = Font.custom("NotoSans-Regular", size: 14)
        public static let lg = Font.custom("NotoSans-Regular", size: 16)
        public static let xl = Font.custom("NotoSans-Regular", size: 18)
    }

    public enum Utility {
        public static let sm = Font.custom("NotoSans-SemiBold", size: 12)
        public static let md = Font.custom("NotoSans-SemiBold", size: 14)
        public static let lg = Font.custom("NotoSans-SemiBold", size: 16)
        public static let xl = Font.custom("NotoSans-SemiBold", size: 18)
        public static let xl2 = Font.custom("NotoSans-SemiBold", size: 20)
    }

    public enum Display {
        public static let md = Font.custom("NotoSans-Bold", size: 60)
    }
}
