/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * averaging_filter.h
 *
 * Code generation for function 'averaging_filter'
 *
 */

#ifndef AVERAGING_FILTER_H
#define AVERAGING_FILTER_H

/* Include files */
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "tmwtypes.h"
#include "mex.h"
#include "emlrt.h"
#include "rtwtypes.h"
#include "averaging_filter_types.h"

/* Function Declarations */
extern void averaging_filter(const emlrtStack *sp, const emxArray_real_T *x,
  emxArray_real_T *y);
extern void averaging_filter_init(void);

#endif

/* End of code generation (averaging_filter.h) */
