//
//  GridSpan.swift
//  Pods
//
//  Created by Daniel Clelland on 11/03/17.
//

public struct Span {
    public let columns: ClosedRange<Int>
    public let rows: ClosedRange<Int>
    
    public init(columns: ClosedRange<Int>, rows: ClosedRange<Int>) {
        self.columns = columns
        self.rows = rows
    }
    
    public init(column: Int, row: Int, columns: Int = 1, rows: Int = 1) {
        self.init(
            columns: column...(column + columns - 1),
            rows: row...(row + rows - 1)
        )
    }
}

/// A grid struct used to create CGRects aligned to a pixel grid.
public struct Grid {
    
    public let columns: Int
    
    public let rows: Int
    
    public let bounds: CGRect
    
    public let gutter: CGSize
    
    public init(columns: Int, rows: Int, bounds: CGRect, gutter: CGSize = .zero) {
        self.columns = columns
        self.rows = rows
        self.bounds = bounds
        self.gutter = gutter
    }
    
    public func bounds(for span: Span, scale: CGFloat = UIScreen.main.scale) -> CGRect {
        let width = (gutter.width + bounds.width) / CGFloat(columns)
        let height = (gutter.height + bounds.height) / CGFloat(rows)
        
        let left = round((CGFloat(span.columns.lowerBound) * width + bounds.minX) * scale) / scale;
        let top = round((CGFloat(span.rows.lowerBound) * height + bounds.minY) * scale) / scale;
        
        let right = round((CGFloat(span.columns.upperBound + 1) * width + bounds.minX - gutter.width) * scale) / scale;
        let bottom = round((CGFloat(span.rows.upperBound + 1) * height + bounds.minY - gutter.height) * scale) / scale;
        
        return CGRect(x: left, y: top, width: right - left, height: bottom - top)
    }
    
    public func bounds(for index: Int, scale: CGFloat = UIScreen.main.scale) -> CGRect {
        return bounds(for: Span(column: index % columns, row: index / columns), scale: scale)
    }
    
}
