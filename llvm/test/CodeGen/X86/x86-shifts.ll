; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=i686-unknown-unknown -mattr=+sse2 | FileCheck %s --check-prefix=X32
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -mattr=+sse2 | FileCheck %s --check-prefix=X64

; Splat patterns below

define <4 x i32> @shl4(<4 x i32> %A) nounwind {
; X32-LABEL: shl4:
; X32:       # %bb.0: # %entry
; X32-NEXT:    movdqa %xmm0, %xmm1
; X32-NEXT:    pslld $2, %xmm1
; X32-NEXT:    paddd %xmm0, %xmm0
; X32-NEXT:    pxor %xmm1, %xmm0
; X32-NEXT:    retl
;
; X64-LABEL: shl4:
; X64:       # %bb.0: # %entry
; X64-NEXT:    movdqa %xmm0, %xmm1
; X64-NEXT:    pslld $2, %xmm1
; X64-NEXT:    paddd %xmm0, %xmm0
; X64-NEXT:    pxor %xmm1, %xmm0
; X64-NEXT:    retq
entry:
  %B = shl <4 x i32> %A,  < i32 2, i32 2, i32 2, i32 2>
  %C = shl <4 x i32> %A,  < i32 1, i32 1, i32 1, i32 1>
  %K = xor <4 x i32> %B, %C
  ret <4 x i32> %K
}

define <4 x i32> @shr4(<4 x i32> %A) nounwind {
; X32-LABEL: shr4:
; X32:       # %bb.0: # %entry
; X32-NEXT:    movdqa %xmm0, %xmm1
; X32-NEXT:    psrld $2, %xmm1
; X32-NEXT:    psrld $1, %xmm0
; X32-NEXT:    pxor %xmm1, %xmm0
; X32-NEXT:    retl
;
; X64-LABEL: shr4:
; X64:       # %bb.0: # %entry
; X64-NEXT:    movdqa %xmm0, %xmm1
; X64-NEXT:    psrld $2, %xmm1
; X64-NEXT:    psrld $1, %xmm0
; X64-NEXT:    pxor %xmm1, %xmm0
; X64-NEXT:    retq
entry:
  %B = lshr <4 x i32> %A,  < i32 2, i32 2, i32 2, i32 2>
  %C = lshr <4 x i32> %A,  < i32 1, i32 1, i32 1, i32 1>
  %K = xor <4 x i32> %B, %C
  ret <4 x i32> %K
}

define <4 x i32> @sra4(<4 x i32> %A) nounwind {
; X32-LABEL: sra4:
; X32:       # %bb.0: # %entry
; X32-NEXT:    movdqa %xmm0, %xmm1
; X32-NEXT:    psrad $2, %xmm1
; X32-NEXT:    psrad $1, %xmm0
; X32-NEXT:    pxor %xmm1, %xmm0
; X32-NEXT:    retl
;
; X64-LABEL: sra4:
; X64:       # %bb.0: # %entry
; X64-NEXT:    movdqa %xmm0, %xmm1
; X64-NEXT:    psrad $2, %xmm1
; X64-NEXT:    psrad $1, %xmm0
; X64-NEXT:    pxor %xmm1, %xmm0
; X64-NEXT:    retq
entry:
  %B = ashr <4 x i32> %A,  < i32 2, i32 2, i32 2, i32 2>
  %C = ashr <4 x i32> %A,  < i32 1, i32 1, i32 1, i32 1>
  %K = xor <4 x i32> %B, %C
  ret <4 x i32> %K
}

define <2 x i64> @shl2(<2 x i64> %A) nounwind {
; X32-LABEL: shl2:
; X32:       # %bb.0: # %entry
; X32-NEXT:    movdqa %xmm0, %xmm1
; X32-NEXT:    psllq $2, %xmm1
; X32-NEXT:    psllq $9, %xmm0
; X32-NEXT:    pxor %xmm1, %xmm0
; X32-NEXT:    retl
;
; X64-LABEL: shl2:
; X64:       # %bb.0: # %entry
; X64-NEXT:    movdqa %xmm0, %xmm1
; X64-NEXT:    psllq $2, %xmm1
; X64-NEXT:    psllq $9, %xmm0
; X64-NEXT:    pxor %xmm1, %xmm0
; X64-NEXT:    retq
entry:
  %B = shl <2 x i64> %A,  < i64 2, i64 2>
  %C = shl <2 x i64> %A,  < i64 9, i64 9>
  %K = xor <2 x i64> %B, %C
  ret <2 x i64> %K
}

define <2 x i64> @shr2(<2 x i64> %A) nounwind {
; X32-LABEL: shr2:
; X32:       # %bb.0: # %entry
; X32-NEXT:    movdqa %xmm0, %xmm1
; X32-NEXT:    psrlq $8, %xmm1
; X32-NEXT:    psrlq $1, %xmm0
; X32-NEXT:    pxor %xmm1, %xmm0
; X32-NEXT:    retl
;
; X64-LABEL: shr2:
; X64:       # %bb.0: # %entry
; X64-NEXT:    movdqa %xmm0, %xmm1
; X64-NEXT:    psrlq $8, %xmm1
; X64-NEXT:    psrlq $1, %xmm0
; X64-NEXT:    pxor %xmm1, %xmm0
; X64-NEXT:    retq
entry:
  %B = lshr <2 x i64> %A,  < i64 8, i64 8>
  %C = lshr <2 x i64> %A,  < i64 1, i64 1>
  %K = xor <2 x i64> %B, %C
  ret <2 x i64> %K
}


define <8 x i16> @shl8(<8 x i16> %A) nounwind {
; X32-LABEL: shl8:
; X32:       # %bb.0: # %entry
; X32-NEXT:    movdqa %xmm0, %xmm1
; X32-NEXT:    psllw $2, %xmm1
; X32-NEXT:    paddw %xmm0, %xmm0
; X32-NEXT:    pxor %xmm1, %xmm0
; X32-NEXT:    retl
;
; X64-LABEL: shl8:
; X64:       # %bb.0: # %entry
; X64-NEXT:    movdqa %xmm0, %xmm1
; X64-NEXT:    psllw $2, %xmm1
; X64-NEXT:    paddw %xmm0, %xmm0
; X64-NEXT:    pxor %xmm1, %xmm0
; X64-NEXT:    retq
entry:
  %B = shl <8 x i16> %A,  < i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2>
  %C = shl <8 x i16> %A,  < i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>
  %K = xor <8 x i16> %B, %C
  ret <8 x i16> %K
}

define <8 x i16> @shr8(<8 x i16> %A) nounwind {
; X32-LABEL: shr8:
; X32:       # %bb.0: # %entry
; X32-NEXT:    movdqa %xmm0, %xmm1
; X32-NEXT:    psrlw $2, %xmm1
; X32-NEXT:    psrlw $1, %xmm0
; X32-NEXT:    pxor %xmm1, %xmm0
; X32-NEXT:    retl
;
; X64-LABEL: shr8:
; X64:       # %bb.0: # %entry
; X64-NEXT:    movdqa %xmm0, %xmm1
; X64-NEXT:    psrlw $2, %xmm1
; X64-NEXT:    psrlw $1, %xmm0
; X64-NEXT:    pxor %xmm1, %xmm0
; X64-NEXT:    retq
entry:
  %B = lshr <8 x i16> %A,  < i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2>
  %C = lshr <8 x i16> %A,  < i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>
  %K = xor <8 x i16> %B, %C
  ret <8 x i16> %K
}

define <8 x i16> @sra8(<8 x i16> %A) nounwind {
; X32-LABEL: sra8:
; X32:       # %bb.0: # %entry
; X32-NEXT:    movdqa %xmm0, %xmm1
; X32-NEXT:    psraw $2, %xmm1
; X32-NEXT:    psraw $1, %xmm0
; X32-NEXT:    pxor %xmm1, %xmm0
; X32-NEXT:    retl
;
; X64-LABEL: sra8:
; X64:       # %bb.0: # %entry
; X64-NEXT:    movdqa %xmm0, %xmm1
; X64-NEXT:    psraw $2, %xmm1
; X64-NEXT:    psraw $1, %xmm0
; X64-NEXT:    pxor %xmm1, %xmm0
; X64-NEXT:    retq
entry:
  %B = ashr <8 x i16> %A,  < i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2, i16 2>
  %C = ashr <8 x i16> %A,  < i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>
  %K = xor <8 x i16> %B, %C
  ret <8 x i16> %K
}

; non-splat test


define <8 x i16> @sll8_nosplat(<8 x i16> %A) nounwind {
; X32-LABEL: sll8_nosplat:
; X32:       # %bb.0: # %entry
; X32-NEXT:    movdqa {{.*#+}} xmm1 = [2,4,8,64,4,4,4,4]
; X32-NEXT:    pmullw %xmm0, %xmm1
; X32-NEXT:    pmullw {{\.LCPI.*}}, %xmm0
; X32-NEXT:    pxor %xmm1, %xmm0
; X32-NEXT:    retl
;
; X64-LABEL: sll8_nosplat:
; X64:       # %bb.0: # %entry
; X64-NEXT:    movdqa {{.*#+}} xmm1 = [2,4,8,64,4,4,4,4]
; X64-NEXT:    pmullw %xmm0, %xmm1
; X64-NEXT:    pmullw {{.*}}(%rip), %xmm0
; X64-NEXT:    pxor %xmm1, %xmm0
; X64-NEXT:    retq
entry:
  %B = shl <8 x i16> %A,  < i16 1, i16 2, i16 3, i16 6, i16 2, i16 2, i16 2, i16 2>
  %C = shl <8 x i16> %A,  < i16 9, i16 7, i16 5, i16 1, i16 4, i16 1, i16 1, i16 1>
  %K = xor <8 x i16> %B, %C
  ret <8 x i16> %K
}


define <2 x i64> @shr2_nosplat(<2 x i64> %A) nounwind {
; X32-LABEL: shr2_nosplat:
; X32:       # %bb.0: # %entry
; X32-NEXT:    movdqa %xmm0, %xmm2
; X32-NEXT:    psrlq $8, %xmm2
; X32-NEXT:    movdqa %xmm0, %xmm1
; X32-NEXT:    psrlq $1, %xmm1
; X32-NEXT:    shufps {{.*#+}} xmm2 = xmm2[0,1],xmm1[2,3]
; X32-NEXT:    shufps {{.*#+}} xmm1 = xmm1[0,1],xmm0[2,3]
; X32-NEXT:    xorps %xmm2, %xmm1
; X32-NEXT:    movaps %xmm1, %xmm0
; X32-NEXT:    retl
;
; X64-LABEL: shr2_nosplat:
; X64:       # %bb.0: # %entry
; X64-NEXT:    movdqa %xmm0, %xmm2
; X64-NEXT:    psrlq $8, %xmm2
; X64-NEXT:    movdqa %xmm0, %xmm1
; X64-NEXT:    psrlq $1, %xmm1
; X64-NEXT:    shufps {{.*#+}} xmm2 = xmm2[0,1],xmm1[2,3]
; X64-NEXT:    shufps {{.*#+}} xmm1 = xmm1[0,1],xmm0[2,3]
; X64-NEXT:    xorps %xmm2, %xmm1
; X64-NEXT:    movaps %xmm1, %xmm0
; X64-NEXT:    retq
entry:
  %B = lshr <2 x i64> %A,  < i64 8, i64 1>
  %C = lshr <2 x i64> %A,  < i64 1, i64 0>
  %K = xor <2 x i64> %B, %C
  ret <2 x i64> %K
}


; Other shifts

define <2 x i32> @shl2_other(<2 x i32> %A) nounwind {
; X32-LABEL: shl2_other:
; X32:       # %bb.0: # %entry
; X32-NEXT:    movdqa %xmm0, %xmm1
; X32-NEXT:    pslld $2, %xmm1
; X32-NEXT:    pslld $9, %xmm0
; X32-NEXT:    pxor %xmm1, %xmm0
; X32-NEXT:    retl
;
; X64-LABEL: shl2_other:
; X64:       # %bb.0: # %entry
; X64-NEXT:    movdqa %xmm0, %xmm1
; X64-NEXT:    pslld $2, %xmm1
; X64-NEXT:    pslld $9, %xmm0
; X64-NEXT:    pxor %xmm1, %xmm0
; X64-NEXT:    retq
entry:
  %B = shl <2 x i32> %A,  < i32 2, i32 2>
  %C = shl <2 x i32> %A,  < i32 9, i32 9>
  %K = xor <2 x i32> %B, %C
  ret <2 x i32> %K
}

define <2 x i32> @shr2_other(<2 x i32> %A) nounwind {
; X32-LABEL: shr2_other:
; X32:       # %bb.0: # %entry
; X32-NEXT:    movdqa %xmm0, %xmm1
; X32-NEXT:    psrld $8, %xmm1
; X32-NEXT:    psrld $1, %xmm0
; X32-NEXT:    pxor %xmm1, %xmm0
; X32-NEXT:    retl
;
; X64-LABEL: shr2_other:
; X64:       # %bb.0: # %entry
; X64-NEXT:    movdqa %xmm0, %xmm1
; X64-NEXT:    psrld $8, %xmm1
; X64-NEXT:    psrld $1, %xmm0
; X64-NEXT:    pxor %xmm1, %xmm0
; X64-NEXT:    retq
entry:
  %B = lshr <2 x i32> %A,  < i32 8, i32 8>
  %C = lshr <2 x i32> %A,  < i32 1, i32 1>
  %K = xor <2 x i32> %B, %C
  ret <2 x i32> %K
}

define <16 x i8> @shl9(<16 x i8> %A) nounwind {
; X32-LABEL: shl9:
; X32:       # %bb.0:
; X32-NEXT:    psllw $3, %xmm0
; X32-NEXT:    pand {{\.LCPI.*}}, %xmm0
; X32-NEXT:    retl
;
; X64-LABEL: shl9:
; X64:       # %bb.0:
; X64-NEXT:    psllw $3, %xmm0
; X64-NEXT:    pand {{.*}}(%rip), %xmm0
; X64-NEXT:    retq
  %B = shl <16 x i8> %A, <i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3>
  ret <16 x i8> %B
}

define <16 x i8> @shr9(<16 x i8> %A) nounwind {
; X32-LABEL: shr9:
; X32:       # %bb.0:
; X32-NEXT:    psrlw $3, %xmm0
; X32-NEXT:    pand {{\.LCPI.*}}, %xmm0
; X32-NEXT:    retl
;
; X64-LABEL: shr9:
; X64:       # %bb.0:
; X64-NEXT:    psrlw $3, %xmm0
; X64-NEXT:    pand {{.*}}(%rip), %xmm0
; X64-NEXT:    retq
  %B = lshr <16 x i8> %A, <i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3>
  ret <16 x i8> %B
}

define <16 x i8> @sra_v16i8_7(<16 x i8> %A) nounwind {
; X32-LABEL: sra_v16i8_7:
; X32:       # %bb.0:
; X32-NEXT:    pxor %xmm1, %xmm1
; X32-NEXT:    pcmpgtb %xmm0, %xmm1
; X32-NEXT:    movdqa %xmm1, %xmm0
; X32-NEXT:    retl
;
; X64-LABEL: sra_v16i8_7:
; X64:       # %bb.0:
; X64-NEXT:    pxor %xmm1, %xmm1
; X64-NEXT:    pcmpgtb %xmm0, %xmm1
; X64-NEXT:    movdqa %xmm1, %xmm0
; X64-NEXT:    retq
  %B = ashr <16 x i8> %A, <i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7>
  ret <16 x i8> %B
}

define <16 x i8> @sra_v16i8(<16 x i8> %A) nounwind {
; X32-LABEL: sra_v16i8:
; X32:       # %bb.0:
; X32-NEXT:    psrlw $3, %xmm0
; X32-NEXT:    pand {{\.LCPI.*}}, %xmm0
; X32-NEXT:    movdqa {{.*#+}} xmm1 = [16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16]
; X32-NEXT:    pxor %xmm1, %xmm0
; X32-NEXT:    psubb %xmm1, %xmm0
; X32-NEXT:    retl
;
; X64-LABEL: sra_v16i8:
; X64:       # %bb.0:
; X64-NEXT:    psrlw $3, %xmm0
; X64-NEXT:    pand {{.*}}(%rip), %xmm0
; X64-NEXT:    movdqa {{.*#+}} xmm1 = [16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16]
; X64-NEXT:    pxor %xmm1, %xmm0
; X64-NEXT:    psubb %xmm1, %xmm0
; X64-NEXT:    retq
  %B = ashr <16 x i8> %A, <i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3, i8 3>
  ret <16 x i8> %B
}