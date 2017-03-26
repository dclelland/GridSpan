//
//  GridSpan.swift
//  Pods
//
//  Created by Daniel Clelland on 11/03/17.
//

import UIKit

/// A span object representing a rectangular range of cells in a grid.
public struct Span {
    
    /// A closed range of columns in the grid.
    /// For example, a value of `0...0` would indicate just the first column.
    public var columns: ClosedRange<Int>
    
    /// A closed range of rows in the grid.
    /// For example, a value of `0...0` would indicate just the first row.
    public var rows: ClosedRange<Int>
    
    /// Initialize the span with two ranges.
    public init(columns: ClosedRange<Int>, rows: ClosedRange<Int>) {
        self.columns = columns
        self.rows = rows
    }
    
    /// Convenience initializer for initializing the span with for separate components, not unlike CGRect's primary initializer.
    public init(column: Int, row: Int, columns: Int = 1, rows: Int = 1) {
        self.init(
            columns: column...(column + columns - 1),
            rows: row...(row + rows - 1)
        )
    }
    
}

/// A grid struct used to create CGRects aligned to a pixel grid with gutter.
public struct Grid {
    
    /// The grid's number of columns.
    public var columns: Int
    
    /// The grid's number of rows.
    public var rows: Int
    
    /// The grid's bounds: the frame of reference for all calculations.
    public var bounds: CGRect
    
    /// The grid's gutter: defines the spacing between cells on the grid.
    public var gutter: CGSize
    
    /// Initializes a grid with columns, rows, bounds, and a default gutter.
    public init(columns: Int, rows: Int, bounds: CGRect, gutter: CGSize = .zero) {
        self.columns = columns
        self.rows = rows
        self.bounds = bounds
        self.gutter = gutter
    }
    
    /// Calculates a rect for a given span on the grid.
    /// Rects are aligned to a pixel scale which rounds the output value so that a constant gutter is displayed.
    ///
    /// The pixel scale defaults to `UIScreen.main.scale`.
    public func bounds(for span: Span, scale: CGFloat = UIScreen.main.scale) -> CGRect {
        let width = (gutter.width + bounds.width) / CGFloat(columns)
        let height = (gutter.height + bounds.height) / CGFloat(rows)
        
        let left = round((CGFloat(span.columns.lowerBound) * width + bounds.minX) * scale) / scale;
        let top = round((CGFloat(span.rows.lowerBound) * height + bounds.minY) * scale) / scale;
        
        let right = round((CGFloat(span.columns.upperBound + 1) * width + bounds.minX - gutter.width) * scale) / scale;
        let bottom = round((CGFloat(span.rows.upperBound + 1) * height + bounds.minY - gutter.height) * scale) / scale;
        
        return CGRect(x: left, y: top, width: right - left, height: bottom - top)
    }
    
    /// Calculates the rect for a given index in the grid, reading left to right and top to bottom.
    ///
    /// For example, index 6 on a 4 by 4 grid means the cell at column 2, row 1.
    public func bounds(for index: Int, scale: CGFloat = UIScreen.main.scale) -> CGRect {
        return bounds(for: Span(column: index % columns, row: index / columns), scale: scale)
    }
    
}
