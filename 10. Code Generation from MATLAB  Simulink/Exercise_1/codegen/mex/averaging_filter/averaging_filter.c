/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * averaging_filter.c
 *
 * Code generation for function 'averaging_filter'
 *
 */

/* Include files */
#include <string.h>
#include "rt_nonfinite.h"
#include "averaging_filter.h"
#include "averaging_filter_emxutil.h"
#include "averaging_filter_data.h"

/* Variable Definitions */
static real_T buffer[16];
static emlrtRTEInfo emlrtRTEI = { 11,  /* lineNo */
  1,                                   /* colNo */
  "averaging_filter",                  /* fName */
  "D:\\Studium\\Computer Aided Design\\Praktikum MATLABSimulink for Computer Aided Engineering\\10. Code Generation from MATLAB  Simuli"
  "nk\\Exercise_1\\averaging_filter.m" /* pName */
};

static emlrtBCInfo emlrtBCI = { -1,    /* iFirst */
  -1,                                  /* iLast */
  16,                                  /* lineNo */
  17,                                  /* colNo */
  "x",                                 /* aName */
  "averaging_filter",                  /* fName */
  "D:\\Studium\\Computer Aided Design\\Praktikum MATLABSimulink for Computer Aided Engineering\\10. Code Generation from MATLAB  Simuli"
  "nk\\Exercise_1\\averaging_filter.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo b_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  19,                                  /* lineNo */
  5,                                   /* colNo */
  "y",                                 /* aName */
  "averaging_filter",                  /* fName */
  "D:\\Studium\\Computer Aided Design\\Praktikum MATLABSimulink for Computer Aided Engineering\\10. Code Generation from MATLAB  Simuli"
  "nk\\Exercise_1\\averaging_filter.m",/* pName */
  0                                    /* checkKind */
};

/* Function Definitions */
void averaging_filter(const emlrtStack *sp, const emxArray_real_T *x,
                      emxArray_real_T *y)
{
  uint32_T unnamed_idx_1;
  int32_T i0;
  int32_T loop_ub;
  int32_T i;
  real_T dv0[15];
  int32_T i1;
  real_T b_y;

  /*  y = averaging_filter(x) */
  /*  Take an input vector signal 'x' and produce an output vector signal 'y' with */
  /*  same type and shape as 'x' but filtered. */
  /*  Use a persistent variable 'buffer' that represents a sliding window of */
  /*  16 samples at a time. */
  unnamed_idx_1 = (uint32_T)x->size[1];
  i0 = y->size[0] * y->size[1];
  y->size[0] = 1;
  y->size[1] = (int32_T)unnamed_idx_1;
  emxEnsureCapacity_real_T(sp, y, i0, &emlrtRTEI);
  loop_ub = (int32_T)unnamed_idx_1;
  for (i0 = 0; i0 < loop_ub; i0++) {
    y->data[i0] = 0.0;
  }

  i0 = x->size[1];
  for (i = 0; i < i0; i++) {
    /*  Scroll the buffer */
    memcpy(&dv0[0], &buffer[0], 15U * sizeof(real_T));
    memcpy(&buffer[1], &dv0[0], 15U * sizeof(real_T));

    /*  Add a new sample value to the buffer */
    loop_ub = x->size[1];
    i1 = 1 + i;
    if ((i1 < 1) || (i1 > loop_ub)) {
      emlrtDynamicBoundsCheckR2012b(i1, 1, loop_ub, &emlrtBCI, sp);
    }

    b_y = x->data[i1 - 1];
    buffer[0] = b_y;

    /*  Compute the current average value of the window and */
    /*  write result */
    for (loop_ub = 0; loop_ub < 15; loop_ub++) {
      b_y += buffer[loop_ub + 1];
    }

    loop_ub = y->size[1];
    i1 = 1 + i;
    if ((i1 < 1) || (i1 > loop_ub)) {
      emlrtDynamicBoundsCheckR2012b(i1, 1, loop_ub, &b_emlrtBCI, sp);
    }

    y->data[i1 - 1] = b_y / 16.0;
    if (*emlrtBreakCheckR2012bFlagVar != 0) {
      emlrtBreakCheckR2012b(sp);
    }
  }
}

void averaging_filter_init(void)
{
  memset(&buffer[0], 0, sizeof(real_T) << 4);
}

/* End of code generation (averaging_filter.c) */
