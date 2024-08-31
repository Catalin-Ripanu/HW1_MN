# HW1_MN

An Image Processing Project.

## Timeline and Overview

The project was completed in 3 weeks and 2 days. Implementation ideas came to me successively.

### Week 1: Nearest-Neighbor Interpolation

- Developed simple functions using nearest-neighbor interpolation.
- Used the `round()` function to find the nearest neighbor (also worked with `floor()/ceil()`).
- Added 1 to obtain a correct result.
- Implemented `nn_resize`:
  - Found valid scaling factors.
  - Used `round()` again for correct results.
- RGB functions were straightforward, based on the other functions.

### Week 2: Bilinear Interpolation

- Spent 3-4 days correcting `bilinear_resize` and `bilinear_rotate` functions.
- The more permissive checker was helpful.
- Faced most obstacles in the optimization part.
- Additional 2-3 days were necessary for debugging.

#### Key Functions:
1. **bilinear_2x2**:
   - Used the relation presented in the PDF document.
   - Introduced valid values in corners.

2. **bilinear_coef**:
   - Similar to `bilinear_2x2`.
   - Swapped x and y (f(y,x)) due to matrix representation.

3. **bilinear_resize** and **bilinear_rotate**:
   - Experience from Week 1 was helpful.
   - Found interpolation coefficients by calculating I values at corresponding points.
   - Used the relation from the document to find the final value.
   - `bilinear_rotate` was similar to `bilinear_resize`, with an additional check for point existence in the image.

4. RGB functions were quickly implemented, based on other functions.

### Week 3: Bicubic Interpolation

- Spent 2 more days debugging.

#### Key Functions:
1. **precal_d**:
   - Required much attention due to many conditions.
   - Used pen and paper for implementation.

2. **Auxiliary functions** (fx, fy, fxy):
   - Simple, relations were in the document.

3. **bicubic_resize**:
   - Took a long time to write.
   - Used parts of `bilinear_resize` for the first part.
   - Performed Matrix = Matrix' operation for correct element order:
     ```
     a b  T  a c
         -->       (To avoid errors)
     c d     b d
     ```
   - Used `mod` and `floor` to stay within 0-3 range (as per document's sum indices).
   - Saved interpolated value in matrix R at the end.

4. RGB function was straightforward, dependent on `resize_bicubic`.

## Conclusion

This project was complex but interesting. The provided document and skeleton were helpful.
