//******************************************************************************
// Copyright 2020 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    https://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import Foundation

//==============================================================================
/// array
/// Return a new tensor of given shape and type, without initializing entries.
/// - Parameters:
///  - elements: a collection of elements used to initialize storage
///  - shape: Int or tuple of Int describing the dimensions of the array
///  - dtype: data-type, optional
///    Desired output data-type for the array, e.g, Int8. Default is DType.
///  - order: { .C, .F }, optional, default .C
///    Whether to store multi-dimensional data in row-major (C-style)
///    or column-major (Fortran-style) order in memory.
/// - Returns: Dense of uninitialized (arbitrary) data of the given shape,
///   dtype, and order. Elements will not be initialized.

/// create tensor from 3D array
@inlinable public func array<Element>(
    _ elements: [[[Element]]],
    dtype: Element.Type,
    order: StorageOrder = .C
) -> Dense3<Element>
{
    let shape = Shape3(elements.count,
                       elements.first!.count,
                       elements.first!.first!.count)
    return Dense3<Element>(elements.joined().joined(), shape)
}

//------------------------------------------------------------------------------
// Rank1
// same type
@inlinable public func array<C>(_ elements: C)
    -> Dense1<C.Element> where C: Collection
{
    Dense1(elements, Shape1(elements.count))
}

/// implicitly casts from C.Element integer -> Element
@inlinable public func array<C>(_ elements: C)
    -> Dense1<DType> where C: Collection, C.Element: BinaryInteger
{
    Dense1(elements, Shape1(elements.count))
}

/// implicitly casts from C.Element integer -> Element
@inlinable public func array<C, Element>(
    _ elements: C,
    dtype: Element.Type
) -> Dense1<Element>
    where C: Collection, C.Element: BinaryInteger, Element: Numeric
{
    Dense1<Element>(elements, Shape1(elements.count))
}

/// implicitly casts from C.Element float -> Element integer
@inlinable public func array<C, Element>(
    _ elements: C,
    dtype: Element.Type
) -> Dense1<Element>
    where C: Collection, C.Element: BinaryFloatingPoint, Element: BinaryInteger
{
    Dense1<Element>(elements, Shape1(elements.count))
}

/// implicitly casts from C.Element float -> Element float
@inlinable public func array<C, Element>(
    _ elements: C,
    dtype: Element.Type
) -> Dense1<Element>
    where C: Collection, C.Element: BinaryFloatingPoint, Element: BinaryFloatingPoint
{
    Dense1<Element>(elements, Shape1(elements.count))
}

//==============================================================================
// Rank2 from flat collection
// same type
@inlinable public func array<C>(
    _ elements: C,
    _ shape: Shape2.Tuple,
    order: StorageOrder = .C
) -> Dense2<C.Element> where C: Collection
{
    Dense2(elements, Shape2(shape), order: order)
}

/// implicitly casts from C.Element integer -> Element
@inlinable public func array<C>(
    _ elements: C,
    _ shape: Shape2.Tuple,
    order: StorageOrder = .C
) -> Dense2<DType> where C: Collection, C.Element: BinaryInteger
{
    Dense2(elements, Shape2(shape), order: order)
}

/// implicitly casts from C.Element integer -> Element
@inlinable public func array<C, Element>(
    _ elements: C,
    _ shape: Shape2.Tuple,
    dtype: Element.Type,
    order: StorageOrder = .C
) -> Dense2<Element>
    where C: Collection, C.Element: BinaryInteger, Element: Numeric
{
    Dense2<Element>(elements, Shape2(shape), order: order)
}

/// implicitly casts from C.Element float -> Element integer
@inlinable public func array<C, Element>(
    _ elements: C,
    _ shape: Shape2.Tuple,
    dtype: Element.Type,
    order: StorageOrder = .C
) -> Dense2<Element>
    where C: Collection, C.Element: BinaryFloatingPoint, Element: BinaryInteger
{
    Dense2<Element>(elements, Shape2(shape), order: order)
}

/// implicitly casts from C.Element float -> Element float
@inlinable public func array<C, Element>(
    _ elements: C,
    _ shape: Shape2.Tuple,
    dtype: Element.Type,
    order: StorageOrder = .C
) -> Dense2<Element>
    where C: Collection, C.Element: BinaryFloatingPoint, Element: BinaryFloatingPoint
{
    Dense2<Element>(elements, Shape2(shape), order: order)
}

//==============================================================================
// Rank2 from swift array

// same type
@inlinable public func array<Element>(
    _ elements: [[Element]],
    dtype: Element.Type,
    order: StorageOrder = .C
) -> Dense2<Element>
{
    let shape = Shape2(elements.count, elements.first!.count)
    return Dense2<Element>(elements.joined(), shape, order: order)
}

/// implicitly casts from C.Element integer -> Element
@inlinable public func array<ArrayElement>(
    _ elements: [[ArrayElement]],
    _ shape: Shape2.Tuple,
    order: StorageOrder = .C
) -> Dense2<DType> where ArrayElement: BinaryInteger
{
    let shape = Shape2(elements.count, elements.first!.count)
    return Dense2<DType>(elements.joined(), shape, order: order)
}

/// implicitly casts from C.Element integer -> Element
@inlinable public func array<ArrayElement, Element>(
    _ elements: [[ArrayElement]],
    _ shape: Shape2.Tuple,
    dtype: Element.Type,
    order: StorageOrder = .C
) -> Dense2<Element>
    where ArrayElement: BinaryInteger, Element: Numeric
{
    let shape = Shape2(elements.count, elements.first!.count)
    return Dense2<Element>(elements.joined(), shape, order: order)
}

/// implicitly casts from C.Element float -> Element integer
@inlinable public func array<ArrayElement, Element>(
    _ elements: [[ArrayElement]],
    _ shape: Shape2.Tuple,
    dtype: Element.Type,
    order: StorageOrder = .C
) -> Dense2<Element>
    where ArrayElement: BinaryFloatingPoint, Element: BinaryInteger
{
    let shape = Shape2(elements.count, elements.first!.count)
    return Dense2<Element>(elements.joined(), shape, order: order)
}

/// implicitly casts from C.Element float -> Element float
@inlinable public func array<ArrayElement, Element>(
    _ elements: [[ArrayElement]],
    _ shape: Shape2.Tuple,
    dtype: Element.Type,
    order: StorageOrder = .C
) -> Dense2<Element>
    where ArrayElement: BinaryFloatingPoint, Element: BinaryFloatingPoint
{
    let shape = Shape2(elements.count, elements.first!.count)
    return Dense2<Element>(elements.joined(), shape, order: order)
}