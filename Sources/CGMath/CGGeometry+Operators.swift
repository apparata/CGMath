//
// Copyright © 2021 Apparata AB. All rights reserved.
//

/// # CGGeometry Operators
///
/// This file provides mathematical operators for Core Graphics geometry types.
/// It extends `CGPoint`, `CGSize`, `CGRect`, and `CGVector` with arithmetic operations
/// including addition, subtraction, multiplication, and division with scalars and vectors.
///
/// ## Overview
///
/// The operators allow for intuitive mathematical operations on geometry types:
///
/// ```swift
/// let point = CGPoint(x: 10, y: 20)
/// let scaledPoint = point * 2.0  // CGPoint(x: 20, y: 40)
/// let translatedPoint = point + CGPoint(x: 5, y: 5)  // CGPoint(x: 15, y: 25)
/// ```

import Foundation
import CoreGraphics

// MARK: - Addition

/// Adds a scalar value to both x and y components of a point.
/// - Parameters:
///   - point: The point to add to
///   - scalar: The scalar value to add to both components
/// - Returns: A new point with the scalar added to both components
public func +(point: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(x: point.x + scalar, y: point.y + scalar)
}

/// Adds a scalar value to both x and y components of a point.
/// - Parameters:
///   - point: The point to add to
///   - scalar: The scalar value to add to both components
/// - Returns: A new point with the scalar added to both components
public func +(point: CGPoint, scalar: Double) -> CGPoint {
    return CGPoint(x: point.x + CGFloat(scalar), y: point.y + CGFloat(scalar))
}

/// Adds two points component-wise.
/// - Parameters:
///   - p1: The first point
///   - p2: The second point
/// - Returns: A new point with components added together
public func +(p1: CGPoint, p2: CGPoint) -> CGPoint {
    return CGPoint(x: p1.x + p2.x, y: p1.y + p2.y)
}

/// Adds a size to a point, treating the size as an offset.
/// - Parameters:
///   - point: The point to add to
///   - size: The size to add as an offset
/// - Returns: A new point offset by the size
public func +(point: CGPoint, size: CGSize) -> CGPoint {
    return CGPoint(x: point.x + size.width, y: point.y + size.height)
}

/// Adds a vector to a point, translating the point by the vector.
/// - Parameters:
///   - point: The point to translate
///   - vector: The vector to add
/// - Returns: A new point translated by the vector
public func +(point: CGPoint, vector: CGVector) -> CGPoint {
    return CGPoint(x: point.x + vector.dx, y: point.y + vector.dy)
}

/// Adds a scalar value to both width and height of a size.
/// - Parameters:
///   - size: The size to add to
///   - scalar: The scalar value to add to both dimensions
/// - Returns: A new size with the scalar added to both dimensions
public func +(size: CGSize, scalar: CGFloat) -> CGSize {
    return CGSize(width: size.width + scalar, height: size.height + scalar)
}

/// Adds a scalar value to both width and height of a size.
/// - Parameters:
///   - size: The size to add to
///   - scalar: The scalar value to add to both dimensions
/// - Returns: A new size with the scalar added to both dimensions
public func +(size: CGSize, scalar: Double) -> CGSize {
    return CGSize(width: size.width + CGFloat(scalar), height: size.height + CGFloat(scalar))
}

/// Adds two sizes component-wise.
/// - Parameters:
///   - s1: The first size
///   - s2: The second size
/// - Returns: A new size with dimensions added together
public func +(s1: CGSize, s2: CGSize) -> CGSize {
    return CGSize(width: s1.width + s2.width, height: s1.height + s2.height)
}

/// Adds a vector to a size, treating the vector as dimension adjustments.
/// - Parameters:
///   - size: The size to add to
///   - vector: The vector to add
/// - Returns: A new size adjusted by the vector components
public func +(size: CGSize, vector: CGVector) -> CGSize {
    return CGSize(width: size.width + vector.dx, height: size.height + vector.dy)
}

/// Translates a rectangle by adding a point to its origin.
/// - Parameters:
///   - rect: The rectangle to translate
///   - point: The point to add to the origin
/// - Returns: A new rectangle translated by the point
public func +(rect: CGRect, point: CGPoint) -> CGRect {
    return CGRect(x: rect.origin.x + point.x, y: rect.origin.y + point.y, width: rect.size.width, height: rect.size.height)
}

/// Expands a rectangle by adding a size to its dimensions.
/// - Parameters:
///   - rect: The rectangle to expand
///   - size: The size to add to the rectangle's dimensions
/// - Returns: A new rectangle with expanded dimensions
public func +(rect: CGRect, size: CGSize) -> CGRect {
    return CGRect(x: rect.origin.x, y: rect.origin.y, width: rect.size.width + size.width, height: rect.size.height + size.height)
}

// MARK: - Incrementing Assignment

/// Compound assignment operators that modify the left operand in place.

/// Adds a scalar value to both components of a point in place.
/// - Parameters:
///   - point: The point to modify
///   - scalar: The scalar value to add
public func +=(point: inout CGPoint, scalar: CGFloat) {
    point.x += scalar
    point.y += scalar
}

/// Adds a scalar value to both components of a point in place.
/// - Parameters:
///   - point: The point to modify.
///   - scalar: The scalar (Double) to add to both `x` and `y` components.
public func +=(point: inout CGPoint, scalar: Double) {
    point.x += CGFloat(scalar)
    point.y += CGFloat(scalar)
}

/// Adds another point component-wise to this point in place.
/// - Parameters:
///   - p1: The point to modify.
///   - p2: The point whose components are added to `p1`.
public func +=(p1: inout CGPoint, p2: CGPoint) {
    p1.x += p2.x
    p1.y += p2.y
}

/// Offsets a point by a size in place.
/// - Parameters:
///   - point: The point to modify.
///   - size: The size whose `width` and `height` are added to `x` and `y`.
public func +=(point: inout CGPoint, size: CGSize) {
    point.x += size.width
    point.y += size.height
}

/// Translates a point by a vector in place.
/// - Parameters:
///   - point: The point to modify.
///   - vector: The vector whose `dx` and `dy` are added to `x` and `y`.
public func +=(point: inout CGPoint, vector: CGVector) {
    point.x += vector.dx
    point.y += vector.dy
}

/// Increases both dimensions of a size by a scalar in place.
/// - Parameters:
///   - size: The size to modify.
///   - scalar: The scalar (CGFloat) to add to `width` and `height`.
public func +=(size: inout CGSize, scalar: CGFloat) {
    size.width += scalar
    size.height += scalar
}

/// Increases both dimensions of a size by a scalar in place.
/// - Parameters:
///   - size: The size to modify.
///   - scalar: The scalar (Double) to add to `width` and `height`.
public func +=(size: inout CGSize, scalar: Double) {
    size.width += CGFloat(scalar)
    size.height += CGFloat(scalar)
}

/// Adds another size component-wise to this size in place.
/// - Parameters:
///   - s1: The size to modify.
///   - s2: The size whose `width` and `height` are added to `s1`.
public func +=(s1: inout CGSize, s2: CGSize) {
    s1.width += s2.width
    s1.height += s2.height
}

/// Adjusts a size by a vector's components in place.
/// - Parameters:
///   - size: The size to modify.
///   - vector: The vector whose `dx` and `dy` are added to `width` and `height`.
public func +=(size: inout CGSize, vector: CGVector) {
    size.width += vector.dx
    size.height += vector.dy
}

/// Translates a rectangle's origin by a point in place.
/// - Parameters:
///   - rect: The rectangle whose origin to modify.
///   - point: The point whose `x` and `y` are added to the origin.
public func +=(rect: inout CGRect, point: CGPoint) {
    rect.origin = CGPoint(x: rect.origin.x + point.x, y: rect.origin.y + point.y)
}

/// Expands a rectangle's size by adding another size in place.
/// - Parameters:
///   - rect: The rectangle whose size to modify.
///   - size: The size whose `width` and `height` are added to the rectangle's size.
public func +=(rect: inout CGRect, size: CGSize) {
    rect.size = CGSize(width: rect.size.width + size.width, height: rect.size.height + size.height)
}

// MARK: - Subtraction

/// Subtraction operators for geometry types.

/// Subtracts a scalar value from both x and y components of a point.
/// - Parameters:
///   - point: The point to subtract from
///   - scalar: The scalar value to subtract
/// - Returns: A new point with the scalar subtracted from both components
public func -(point: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(x: point.x - scalar, y: point.y - scalar)
}

/// Subtracts a scalar value from both x and y components of a point.
/// - Parameters:
///   - point: The point to subtract from.
///   - scalar: The scalar (Double) to subtract from both components.
/// - Returns: A new point with the scalar subtracted from both components.
public func -(point: CGPoint, scalar: Double) -> CGPoint {
    return CGPoint(x: point.x - CGFloat(scalar), y: point.y - CGFloat(scalar))
}

/// Subtracts one point from another component-wise.
/// - Parameters:
///   - p1: The minuend point.
///   - p2: The subtrahend point to subtract from `p1`.
/// - Returns: A new point where `x = p1.x - p2.x` and `y = p1.y - p2.y`.
public func -(p1: CGPoint, p2: CGPoint) -> CGPoint {
    return CGPoint(x: p1.x - p2.x, y: p1.y - p2.y)
}

/// Subtracts a size from a point, treating the size as an offset.
/// - Parameters:
///   - point: The point to subtract from.
///   - size: The size whose `width` and `height` are subtracted from `x` and `y`.
/// - Returns: A new point offset negatively by the size.
public func -(point: CGPoint, size: CGSize) -> CGPoint {
    return CGPoint(x: point.x - size.width, y: point.y - size.height)
}

/// Translates a point negatively by a vector.
/// - Parameters:
///   - point: The point to translate.
///   - vector: The vector whose `dx` and `dy` are subtracted from `x` and `y`.
/// - Returns: A new point translated by the negative of the vector.
public func -(point: CGPoint, vector: CGVector) -> CGPoint {
    return CGPoint(x: point.x - vector.dx, y: point.y - vector.dy)
}

/// Decreases both dimensions of a size by a scalar.
/// - Parameters:
///   - size: The size to subtract from.
///   - scalar: The scalar (CGFloat) to subtract from `width` and `height`.
/// - Returns: A new size with the scalar subtracted from both dimensions.
public func -(size: CGSize, scalar: CGFloat) -> CGSize {
    return CGSize(width: size.width - scalar, height: size.height - scalar)
}

/// Decreases both dimensions of a size by a scalar.
/// - Parameters:
///   - size: The size to subtract from.
///   - scalar: The scalar (Double) to subtract from `width` and `height`.
/// - Returns: A new size with the scalar subtracted from both dimensions.
public func -(size: CGSize, scalar: Double) -> CGSize {
    return CGSize(width: size.width - CGFloat(scalar), height: size.height - CGFloat(scalar))
}

/// Subtracts one size from another component-wise.
/// - Parameters:
///   - s1: The minuend size.
///   - s2: The subtrahend size whose components are subtracted from `s1`.
/// - Returns: A new size where `width = s1.width - s2.width` and `height = s1.height - s2.height`.
public func -(s1: CGSize, s2: CGSize) -> CGSize {
    return CGSize(width: s1.width - s2.width, height: s1.height - s2.height)
}

/// Adjusts a size by subtracting a vector's components.
/// - Parameters:
///   - size: The size to subtract from.
///   - vector: The vector whose `dx` and `dy` are subtracted from `width` and `height`.
/// - Returns: A new size decreased by the vector components.
public func -(size: CGSize, vector: CGVector) -> CGSize {
    return CGSize(width: size.width - vector.dx, height: size.height - vector.dy)
}

/// Translates a rectangle by subtracting a point from its origin.
/// - Parameters:
///   - rect: The rectangle to translate.
///   - point: The point whose `x` and `y` are subtracted from the origin.
/// - Returns: A new rectangle translated by the negative of the point.
public func -(rect: CGRect, point: CGPoint) -> CGRect {
    return CGRect(x: rect.origin.x - point.x, y: rect.origin.y - point.y, width: rect.size.width, height: rect.size.height)
}

/// Shrinks a rectangle by subtracting a size from its dimensions.
/// - Parameters:
///   - rect: The rectangle whose size to reduce.
///   - size: The size whose `width` and `height` are subtracted from the rectangle's size.
/// - Returns: A new rectangle with reduced dimensions.
public func -(rect: CGRect, size: CGSize) -> CGRect {
    return CGRect(x: rect.origin.x, y: rect.origin.y, width: rect.size.width - size.width, height: rect.size.height - size.height)
}

// MARK: - Decrementing assignment

/// Subtracts a scalar from both components of a point in place.
/// - Parameters:
///   - point: The point to modify.
///   - scalar: The scalar (CGFloat) to subtract from `x` and `y`.
public func -=(point: inout CGPoint, scalar: CGFloat) {
    point.x -= scalar
    point.y -= scalar
}

/// Subtracts a scalar from both components of a point in place.
/// - Parameters:
///   - point: The point to modify.
///   - scalar: The scalar (Double) to subtract from `x` and `y`.
public func -=(point: inout CGPoint, scalar: Double) {
    point.x -= CGFloat(scalar)
    point.y -= CGFloat(scalar)
}

/// Subtracts another point from this point component-wise in place.
/// - Parameters:
///   - p1: The point to modify (minuend).
///   - p2: The point to subtract (subtrahend).
public func -=(p1: inout CGPoint, p2: CGPoint) {
    p1.x -= p2.x
    p1.y -= p2.y
}

/// Offsets a point negatively by a size in place.
/// - Parameters:
///   - point: The point to modify.
///   - size: The size whose `width` and `height` are subtracted from `x` and `y`.
public func -=(point: inout CGPoint, size: CGSize) {
    point.x -= size.width
    point.y -= size.height
}

/// Translates a point by subtracting a vector in place.
/// - Parameters:
///   - point: The point to modify.
///   - vector: The vector whose `dx` and `dy` are subtracted from `x` and `y`.
public func -=(point: inout CGPoint, vector: CGVector) {
    point.x -= vector.dx
    point.y -= vector.dy
}

/// Decreases both dimensions of a size by a scalar in place.
/// - Parameters:
///   - size: The size to modify.
///   - scalar: The scalar (CGFloat) to subtract from `width` and `height`.
public func -=(size: inout CGSize, scalar: CGFloat) {
    size.width -= scalar
    size.height -= scalar
}

/// Decreases both dimensions of a size by a scalar in place.
/// - Parameters:
///   - size: The size to modify.
///   - scalar: The scalar (Double) to subtract from `width` and `height`.
public func -=(size: inout CGSize, scalar: Double) {
    size.width -= CGFloat(scalar)
    size.height -= CGFloat(scalar)
}

/// Subtracts another size from this size component-wise in place.
/// - Parameters:
///   - s1: The size to modify (minuend).
///   - s2: The size to subtract (subtrahend).
public func -=(s1: inout CGSize, s2: CGSize) {
    s1.width -= s2.width
    s1.height -= s2.height
}

/// Adjusts a size by subtracting a vector's components in place.
/// - Parameters:
///   - size: The size to modify.
///   - vector: The vector whose `dx` and `dy` are subtracted from `width` and `height`.
public func -=(size: inout CGSize, vector: CGVector) {
    size.width -= vector.dx
    size.height -= vector.dy
}

/// Translates a rectangle's origin negatively by a point in place.
/// - Parameters:
///   - rect: The rectangle whose origin to modify.
///   - point: The point whose `x` and `y` are subtracted from the origin.
public func -=(rect: inout CGRect, point: CGPoint) {
    rect.origin = CGPoint(x: rect.origin.x - point.x, y: rect.origin.y - point.y)
}

/// Shrinks a rectangle by subtracting a size from its dimensions in place.
/// - Parameters:
///   - rect: The rectangle whose size to modify.
///   - size: The size whose `width` and `height` are subtracted from the rectangle's size.
public func -=(rect: inout CGRect, size: CGSize) {
    rect.size = CGSize(width: rect.size.width - size.width, height: rect.size.height - size.height)
}

// MARK: - Scalar Multiplication

/// Multiplication operators for scaling geometry types by scalar values.

/// Scales a point by multiplying both components by a scalar.
/// - Parameters:
///   - point: The point to scale
///   - scalar: The scaling factor
/// - Returns: A new point scaled by the factor
public func *(point: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(x: point.x * scalar, y: point.y * scalar)
}

/// Scales a size by multiplying both dimensions by a scalar.
/// - Parameters:
///   - size: The size to scale
///   - scalar: The scaling factor
/// - Returns: A new size scaled by the factor
public func *(size: CGSize, scalar: CGFloat) -> CGSize {
    return CGSize(width: size.width * scalar, height: size.height * scalar)
}

/// Scales a vector by multiplying both components by a scalar.
/// - Parameters:
///   - vector: The vector to scale
///   - scalar: The scaling factor
/// - Returns: A new vector scaled by the factor
public func *(vector: CGVector, scalar: CGFloat) -> CGVector {
    return CGVector(dx: vector.dx * scalar, dy: vector.dy * scalar)
}

/// Scales a rectangle by multiplying both origin and size by a scalar.
/// - Parameters:
///   - rect: The rectangle to scale
///   - scalar: The scaling factor
/// - Returns: A new rectangle scaled by the factor
public func *(rect: CGRect, scalar: CGFloat) -> CGRect {
    return CGRect(x: rect.origin.x * scalar, y: rect.origin.y * scalar, width: rect.size.width * scalar, height: rect.size.height * scalar)
}

/// Scales a point by multiplying both components by a scalar.
/// - Parameters:
///   - point: The point to scale.
///   - scalar: The scaling factor (Double).
/// - Returns: A new point scaled by the factor.
public func *(point: CGPoint, scalar: Double) -> CGPoint {
    return CGPoint(x: point.x * CGFloat(scalar), y: point.y * CGFloat(scalar))
}

/// Scales a size by multiplying both dimensions by a scalar.
/// - Parameters:
///   - size: The size to scale.
///   - scalar: The scaling factor (Double).
/// - Returns: A new size scaled by the factor.
public func *(size: CGSize, scalar: Double) -> CGSize {
    return CGSize(width: size.width * CGFloat(scalar), height: size.height * CGFloat(scalar))
}

/// Scales a vector by multiplying both components by a scalar.
/// - Parameters:
///   - vector: The vector to scale.
///   - scalar: The scaling factor (Double).
/// - Returns: A new vector scaled by the factor.
public func *(vector: CGVector, scalar: Double) -> CGVector {
    return CGVector(dx: vector.dx * CGFloat(scalar), dy: vector.dy * CGFloat(scalar))
}

/// Scales a rectangle by multiplying both origin and size by a scalar.
/// - Parameters:
///   - rect: The rectangle to scale.
///   - scalar: The scaling factor (Double).
/// - Returns: A new rectangle scaled by the factor.
public func *(rect: CGRect, scalar: Double) -> CGRect {
    let scalar = CGFloat(scalar)
    return CGRect(x: rect.origin.x * scalar, y: rect.origin.y * scalar, width: rect.size.width * scalar, height: rect.size.height * scalar)
}

// MARK: - Multiplication with scalar assignment

/// Scales a point in place by a scalar.
/// - Parameters:
///   - point: The point to modify.
///   - scalar: The scaling factor (CGFloat).
public func *=(point: inout CGPoint, scalar: CGFloat) {
    point.x *= scalar
    point.y *= scalar
}

/// Scales a size in place by a scalar.
/// - Parameters:
///   - size: The size to modify.
///   - scalar: The scaling factor (CGFloat).
public func *=(size: inout CGSize, scalar: CGFloat) {
    size.width *= scalar
    size.height *= scalar
}

/// Scales a vector in place by a scalar.
/// - Parameters:
///   - vector: The vector to modify.
///   - scalar: The scaling factor (CGFloat).
public func *=(vector: inout CGVector, scalar: CGFloat) {
    vector.dx *= scalar
    vector.dy *= scalar
}

/// Scales a point in place by a scalar.
/// - Parameters:
///   - point: The point to modify.
///   - scalar: The scaling factor (Double).
public func *=(point: inout CGPoint, scalar: Double) {
    point.x *= CGFloat(scalar)
    point.y *= CGFloat(scalar)
}

/// Scales a size in place by a scalar.
/// - Parameters:
///   - size: The size to modify.
///   - scalar: The scaling factor (Double).
public func *=(size: inout CGSize, scalar: Double) {
    size.width *= CGFloat(scalar)
    size.height *= CGFloat(scalar)
}

/// Scales a vector in place by a scalar.
/// - Parameters:
///   - vector: The vector to modify.
///   - scalar: The scaling factor (Double).
public func *=(vector: inout CGVector, scalar: Double) {
    vector.dx *= CGFloat(scalar)
    vector.dy *= CGFloat(scalar)
}

// MARK: - Scalar Division

/// Division operators for scaling geometry types by dividing by scalar values.

/// Divides a point by a scalar, scaling it down.
/// - Parameters:
///   - point: The point to divide
///   - scalar: The divisor
/// - Returns: A new point scaled down by dividing by the scalar
public func /(point: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(x: point.x / scalar, y: point.y / scalar)
}

/// Divides a size by a scalar, scaling it down.
/// - Parameters:
///   - size: The size to divide.
///   - scalar: The divisor (CGFloat).
/// - Returns: A new size with both dimensions divided by the scalar.
public func /(size: CGSize, scalar: CGFloat) -> CGSize {
    return CGSize(width: size.width / scalar, height: size.height / scalar)
}

/// Divides a vector by a scalar, scaling it down.
/// - Parameters:
///   - vector: The vector to divide.
///   - scalar: The divisor (CGFloat).
/// - Returns: A new vector with both components divided by the scalar.
public func /(vector: CGVector, scalar: CGFloat) -> CGVector {
    return CGVector(dx: vector.dx / scalar, dy: vector.dy / scalar)
}

/// Divides a point by a scalar, scaling it down.
/// - Parameters:
///   - point: The point to divide.
///   - scalar: The divisor (Double).
/// - Returns: A new point with both components divided by the scalar.
public func /(point: CGPoint, scalar: Double) -> CGPoint {
    return CGPoint(x: point.x / CGFloat(scalar), y: point.y / CGFloat(scalar))
}

/// Divides a size by a scalar, scaling it down.
/// - Parameters:
///   - size: The size to divide.
///   - scalar: The divisor (Double).
/// - Returns: A new size with both dimensions divided by the scalar.
public func /(size: CGSize, scalar: Double) -> CGSize {
    return CGSize(width: size.width / CGFloat(scalar), height: size.height / CGFloat(scalar))
}

/// Divides a vector by a scalar, scaling it down.
/// - Parameters:
///   - vector: The vector to divide.
///   - scalar: The divisor (Double).
/// - Returns: A new vector with both components divided by the scalar.
public func /(vector: CGVector, scalar: Double) -> CGVector {
    return CGVector(dx: vector.dx / CGFloat(scalar), dy: vector.dy / CGFloat(scalar))
}

// MARK: - Division with scalar assignment

/// Divides a point's components by a scalar in place.
/// - Parameters:
///   - point: The point to modify.
///   - scalar: The divisor (CGFloat).
public func /=(point: inout CGPoint, scalar: CGFloat) {
    point.x /= scalar
    point.y /= scalar
}

/// Divides a size's dimensions by a scalar in place.
/// - Parameters:
///   - size: The size to modify.
///   - scalar: The divisor (CGFloat).
public func /=(size: inout CGSize, scalar: CGFloat) {
    size.width /= scalar
    size.height /= scalar
}

/// Divides a vector's components by a scalar in place.
/// - Parameters:
///   - vector: The vector to modify.
///   - scalar: The divisor (CGFloat).
public func /=(vector: inout CGVector, scalar: CGFloat) {
    vector.dx /= scalar
    vector.dy /= scalar
}

/// Divides a point's components by a scalar in place.
/// - Parameters:
///   - point: The point to modify.
///   - scalar: The divisor (Double).
public func /=(point: inout CGPoint, scalar: Double) {
    point.x /= CGFloat(scalar)
    point.y /= CGFloat(scalar)
}

/// Divides a size's dimensions by a scalar in place.
/// - Parameters:
///   - size: The size to modify.
///   - scalar: The divisor (Double).
public func /=(size: inout CGSize, scalar: Double) {
    size.width /= CGFloat(scalar)
    size.height /= CGFloat(scalar)
}

/// Divides a vector's components by a scalar in place.
/// - Parameters:
///   - vector: The vector to modify.
///   - scalar: The divisor (Double).
public func /=(vector: inout CGVector, scalar: Double) {
    vector.dx /= CGFloat(scalar)
    vector.dy /= CGFloat(scalar)
}

// MARK: - Vector Multiplication

/// Component-wise multiplication operators for geometry types with vectors.

/// Multiplies a point by a vector component-wise.
/// - Parameters:
///   - point: The point to multiply
///   - vector: The vector to multiply by
/// - Returns: A new point with components multiplied by corresponding vector components
public func *(point: CGPoint, vector: CGVector) -> CGPoint {
    return CGPoint(x: point.x * vector.dx, y: point.y * vector.dy)
}

/// Multiplies a size by a vector component-wise.
/// - Parameters:
///   - size: The size whose dimensions to scale.
///   - vector: The vector providing scale factors (`dx` for width, `dy` for height`).
/// - Returns: A new size with `width = size.width * vector.dx` and `height = size.height * vector.dy`.
public func *(size: CGSize, vector: CGVector) -> CGSize {
    return CGSize(width: size.width * vector.dx, height: size.height * vector.dy)
}

/// Multiplies two vectors component-wise.
/// - Parameters:
///   - v1: The first vector.
///   - v2: The second vector.
/// - Returns: A new vector with `dx = v1.dx * v2.dx` and `dy = v1.dy * v2.dy`.
public func *(v1: CGVector, v2: CGVector) -> CGVector {
    return CGVector(dx: v1.dx * v2.dx, dy: v1.dy * v2.dy)
}

// MARK: - Multiplication with vector assignment

/// Multiplies a point's components by a vector's components in place.
/// - Parameters:
///   - point: The point to modify.
///   - vector: The vector providing scale factors for `x` and `y`.
public func *=(point: inout CGPoint, vector: CGVector) {
    point.x *= vector.dx
    point.y *= vector.dy
}

/// Multiplies a size's dimensions by a vector's components in place.
/// - Parameters:
///   - size: The size to modify.
///   - vector: The vector providing scale factors for `width` and `height`.
public func *=(size: inout CGSize, vector: CGVector) {
    size.width *= vector.dx
    size.height *= vector.dy
}

/// Multiplies a vector by another vector component-wise in place.
/// - Parameters:
///   - v1: The vector to modify.
///   - v2: The vector providing scale factors for `dx` and `dy`.
public func *=(v1: inout CGVector, v2: CGVector) {
    v1.dx *= v2.dx
    v1.dy *= v2.dy
}

// MARK: Division with vector

/// Divides a point by a vector component-wise.
/// - Parameters:
///   - point: The point whose components to divide.
///   - vector: The vector providing divisors for `x` and `y`.
/// - Returns: A new point with `x = point.x / vector.dx` and `y = point.y / vector.dy`.
public func /(point: CGPoint, vector: CGVector) -> CGPoint {
    return CGPoint(x: point.x / vector.dx, y: point.y / vector.dy)
}

/// Divides a size by a vector component-wise.
/// - Parameters:
///   - size: The size whose dimensions to divide.
///   - vector: The vector providing divisors for `width` and `height`.
/// - Returns: A new size with `width = size.width / vector.dx` and `height = size.height / vector.dy`.
public func /(size: CGSize, vector: CGVector) -> CGSize {
    return CGSize(width: size.width / vector.dx, height: size.height / vector.dy)
}

/// Divides one vector by another component-wise.
/// - Parameters:
///   - v1: The dividend vector.
///   - v2: The divisor vector.
/// - Returns: A new vector with `dx = v1.dx / v2.dx` and `dy = v1.dy / v2.dy`.
public func /(v1: CGVector, v2: CGVector) -> CGVector {
    return CGVector(dx: v1.dx / v2.dx, dy: v1.dy / v2.dy)
}

// MARK: - Division with vector assignment

/// Divides a point's components by a vector's components in place.
/// - Parameters:
///   - point: The point to modify.
///   - vector: The vector providing divisors for `x` and `y`.
public func /=(point: inout CGPoint, vector: CGVector) {
    point.x /= vector.dx
    point.y /= vector.dy
}

/// Divides a size's dimensions by a vector's components in place.
/// - Parameters:
///   - size: The size to modify.
///   - vector: The vector providing divisors for `width` and `height`.
public func /=(size: inout CGSize, vector: CGVector) {
    size.width /= vector.dx
    size.height /= vector.dy
}

/// Divides a vector by another vector component-wise in place.
/// - Parameters:
///   - v1: The vector to modify (dividend).
///   - v2: The vector providing divisors for `dx` and `dy`.
public func /=(v1: inout CGVector, v2: CGVector) {
    v1.dx /= v2.dx
    v1.dy /= v2.dy
}

