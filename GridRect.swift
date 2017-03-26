//
//  GridRect.swift
//  Pods
//
//  Created by Daniel Clelland on 11/03/17.
//

struct Grid {
    
    struct Rect {
        
        struct Point {
            let x: Int
            let y: Int
        }
        
        struct Size {
            let columns: Int
            let rows: Int
        }
        
        let origin: Point
        let size: Size
        
        init(origin: Point, size: Size) {
            self.origin = origin
            self.size = size
        }
        
        init(x: Int, y: Int, columns: Int = 1, rows: Int = 1) {
            self.init(origin: Point(x: x, y: y), size: Size(columns: columns, rows: rows))
        }
    }
    
    let bounds: CGRect
    
    let gutter: CGSize
    
    let size: Rect.Size
    
    init(bounds: CGRect, gutter: CGSize = .zero, size: Rect.Size) {
        self.bounds = bounds
        self.gutter = gutter
        self.size = size
    }
    
    func bounds(for rect: Rect) -> CGRect {
        let scale = UIScreen.main.scale
        
        let width = (gutter.width + bounds.width) / CGFloat(size.columns)
        let height = (gutter.height + bounds.height) / CGFloat(size.rows)
        
        let left = round((CGFloat(rect.origin.x) * width + bounds.minX) * scale) / scale;
        let top = round((CGFloat(rect.origin.y) * height + bounds.minY) * scale) / scale;
        
        let right = round((CGFloat(rect.origin.x + rect.size.columns) * width + bounds.minX - gutter.width) * scale) / scale;
        let bottom = round((CGFloat(rect.origin.y + rect.size.rows) * height + bounds.minY - gutter.height) * scale) / scale;
        
        return CGRect(x: left, y: top, width: right - left, height: bottom - top)
    }
    
    func bounds(for index: Int) -> CGRect {
        return bounds(for: Rect(x: index % size.columns, y: index / size.columns))
    }
    
}
