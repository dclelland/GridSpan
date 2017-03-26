//
//  GridRect.swift
//  Pods
//
//  Created by Daniel Clelland on 11/03/17.
//

public struct Grid {
    
    public struct Point {
        public let x: Int
        public let y: Int
        
        public init(x: Int, y: Int) {
            self.x = x
            self.y = y
        }
    }
    
    public struct Size {
        public let columns: Int
        public let rows: Int
        
        public init(columns: Int, rows: Int) {
            self.columns = columns
            self.rows = rows
        }
    }
    
    public struct Rect {
        
        public let origin: Point
        public let size: Size
        
        public init(origin: Point, size: Size) {
            self.origin = origin
            self.size = size
        }
        
        public init(x: Int, y: Int, columns: Int = 1, rows: Int = 1) {
            self.init(origin: Point(x: x, y: y), size: Size(columns: columns, rows: rows))
        }
    }
    
    public let bounds: CGRect
    
    public let gutter: CGSize
    
    public let size: Size
    
    public init(bounds: CGRect, gutter: CGSize = .zero, size: Size) {
        self.bounds = bounds
        self.gutter = gutter
        self.size = size
    }
    
    public func bounds(for rect: Rect, scale: CGFloat = UIScreen.main.scale) -> CGRect {
//        let scale = UIScreen.main.scale
        
        let width = (gutter.width + bounds.width) / CGFloat(size.columns)
        let height = (gutter.height + bounds.height) / CGFloat(size.rows)
        
        let left = round((CGFloat(rect.origin.x) * width + bounds.minX) * scale) / scale;
        let top = round((CGFloat(rect.origin.y) * height + bounds.minY) * scale) / scale;
        
        let right = round((CGFloat(rect.origin.x + rect.size.columns) * width + bounds.minX - gutter.width) * scale) / scale;
        let bottom = round((CGFloat(rect.origin.y + rect.size.rows) * height + bounds.minY - gutter.height) * scale) / scale;
        
        return CGRect(x: left, y: top, width: right - left, height: bottom - top)
    }
    
    public func bounds(for index: Int) -> CGRect {
        return bounds(for: Rect(x: index % size.columns, y: index / size.columns))
    }
    
}
