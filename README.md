# Image Processing Project

## Overview

This project implements various image interpolation algorithms for resizing and rotating operations. The system supports three different interpolation methods: nearest-neighbor, bilinear, and bicubic interpolation, each offering different quality-performance trade-offs.

**Development Time:** 3 weeks and 2 days

## Features

- **Nearest-Neighbor Interpolation**: Fast, pixel-perfect scaling for simple operations
- **Bilinear Interpolation**: Smooth scaling with linear interpolation between pixels
- **Bicubic Interpolation**: High-quality scaling using cubic polynomial interpolation
- **RGB Color Support**: Full-color image processing capabilities
- **Image Rotation**: Rotation operations with interpolation support

## Implementation Timeline

### Week 1: Nearest-Neighbor Foundation
**Focus:** Basic interpolation and core functionality

- **Algorithm Implementation:**
  - Developed nearest-neighbor interpolation using `round()` function
  - Alternative approaches tested with `floor()` and `ceil()` functions
  - Applied +1 offset correction for accurate pixel mapping

- **Core Functions:**
  - `nn_resize`: Implemented with automatic scaling factor detection
  - Applied `round()` function for precise nearest-neighbor selection
  - RGB processing functions built upon grayscale foundation

### Week 2: Bilinear Interpolation
**Focus:** Smooth interpolation and optimization challenges

- **Development Phase:** 3-4 days for core function correction
- **Debugging Phase:** Additional 2-3 days for optimization issues
- **Testing:** Utilized permissive checker for iterative improvement

#### Key Algorithm Implementations:

**1. bilinear_2x2**
- Implemented mathematical relations from project documentation
- Defined valid corner values for interpolation matrix
- Foundation for all bilinear operations

**2. bilinear_coef**
- Based on `bilinear_2x2` methodology
- **Critical Implementation Detail:** Swapped x,y coordinates to f(y,x) for proper matrix representation
- Ensures correct spatial mapping

**3. bilinear_resize & bilinear_rotate**
- Leveraged Week 1 experience for optimization
- **Process Flow:**
  1. Calculate interpolation coefficients
  2. Determine I values at corresponding points
  3. Apply documented mathematical relations
  4. Generate final interpolated values
- **bilinear_rotate**: Enhanced with boundary checking for valid pixel existence

**4. RGB Integration**
- Rapid implementation based on grayscale functions
- Maintains color fidelity across all channels

### Week 3: Bicubic Interpolation
**Focus:** High-quality interpolation with complex mathematics

- **Additional Debugging:** 2 days for algorithm refinement

#### Advanced Algorithm Components:

**1. precal_d Function**
- **Complexity Level:** High - required extensive manual calculation
- **Development Approach:** Pen-and-paper mathematical derivation
- **Implementation Challenge:** Multiple conditional branches for different scenarios

**2. Auxiliary Mathematical Functions**
- **fx, fy, fxy**: Straightforward implementations following documentation specifications
- **Purpose**: Derivative calculations for cubic polynomial fitting

**3. bicubic_resize - Core Algorithm**
- **Development Time**: Extended implementation period
- **Code Reuse**: Integrated components from `bilinear_resize` for preprocessing
- **Matrix Operations**: 
  ```
  Matrix Transpose Operation:
  [a b]ᵀ   [a c]
  [c d] -> [b d]
  ```
  Purpose: Correct element ordering to prevent computational errors

- **Index Management**: 
  - Used `mod` and `floor` operations
  - Maintained 0-3 range as specified in documentation
  - Proper sum indices handling

- **Output**: Final interpolated values stored in matrix R

**4. RGB bicubic Function**
- **Implementation**: Straightforward wrapper around `resize_bicubic`
- **Dependency**: Direct reliance on grayscale bicubic implementation

## Technical Implementation Details

### Algorithm Comparison

| Method | Quality | Performance | Use Case |
|--------|---------|-------------|----------|
| Nearest-Neighbor | Basic | Fastest | Pixel art, simple scaling |
| Bilinear | Good | Moderate | General purpose scaling |
| Bicubic | Excellent | Slowest | High-quality image processing |

### Key Mathematical Concepts

**Nearest-Neighbor**: Direct pixel mapping with rounding
**Bilinear**: Linear interpolation in 2D space using 4 neighboring pixels
**Bicubic**: Cubic polynomial fitting using 16 neighboring pixels

### Critical Implementation Notes

1. **Coordinate System**: Matrix representation requires (y,x) instead of (x,y)
2. **Boundary Conditions**: Rotation functions include existence validation
3. **Matrix Operations**: Transpose operations prevent index errors
4. **Range Management**: Modular arithmetic ensures valid array indices

## Development Challenges

### Technical Obstacles
- **Optimization Complexity**: Bilinear interpolation performance tuning
- **Mathematical Precision**: Bicubic coefficient calculations
- **Coordinate Mapping**: Matrix vs. Cartesian coordinate systems
- **Boundary Handling**: Edge case management for rotations

### Debugging Strategies
- Iterative testing with permissive checker
- Manual mathematical verification
- Systematic validation of intermediate results

## Code Architecture

### Function Hierarchy
```
RGB Functions
    ↓
Grayscale Core Functions
    ↓
Mathematical Primitives (precal_d, fx, fy, fxy)
    ↓
Basic Interpolation Operations
```

### Modular Design Benefits
- **Code Reuse**: RGB functions leverage grayscale implementations
- **Maintainability**: Clear separation of mathematical and application logic
- **Extensibility**: Foundation supports additional interpolation methods

## Project Resources

- **Documentation**: Comprehensive mathematical specifications provided
- **Code Skeleton**: Well-structured foundation accelerated development
- **Testing Framework**: Iterative validation supported development process

## Conclusion

This project successfully demonstrates advanced image processing techniques through three distinct interpolation algorithms. The implementation showcases progression from simple nearest-neighbor methods to sophisticated bicubic interpolation, providing a comprehensive foundation for digital image manipulation.

The modular architecture and mathematical rigor make this suitable for both educational purposes and practical image processing applications.
