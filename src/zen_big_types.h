#ifndef __ZEN_BIG_TYPES_H__
#define __ZEN_BIG_TYPES_H__
#include <arch.h>

#if BIGSIZE == 384
#if CHUNK == 64
#pragma message "BIGnum CHUNK size: 64bit"
#include <big_384_58.h>
#define BIG BIG_384_58
#define modbytes MODBYTES_384_58
#define BIG_zero(b) BIG_384_58_zero(b)
#define BIG_fromBytesLen(b,v,l) BIG_384_58_fromBytesLen(b,v,l)
#define BIG_inc(b,n) BIG_384_58_inc(b,n)
#define BIG_norm(b) BIG_384_58_norm(b)
#define BIG_nbits(b) BIG_384_58_nbits(b)
#define BIG_copy(b,a) BIG_384_58_copy(b,a)
#define BIG_rcopy(b,a) BIG_384_58_rcopy(b,a)
#define BIG_shr(b,a) BIG_384_58_shr(b,a)
#define BIG_toBytes(b,a) BIG_384_58_toBytes(b,a)
#define BIG_comp(l,r) BIG_384_58_comp(l,r)
#define BIG_add(d,l,r) BIG_384_58_add(d,l,r)
#define BIG_sub(d,l,r) BIG_384_58_sub(d,l,r)
#define BIG_mul(d,l,r) BIG_384_58_smul(d,l,r)
#define BIG_mod(x,n) BIG_384_58_mod(x,n)
#define BIG_div(x,n) BIG_384_58_sdiv(x,n)
#define BIG_modmul(x,y,z,n) BIG_384_58_modmul(x,y,z,n)
#define BIG_moddiv(x,y,z,n) BIG_384_58_moddiv(x,y,z,n)
#define BIG_modsqr(x,y,n) BIG_384_58_modsqr(x,y,n)
#define BIG_modneg(x,y,n) BIG_384_58_modneg(x,y,n)
#define BIG_jacobi(x,y) BIG_384_58_jacobi(x,y)

#elif CHUNK == 32
#pragma message "BIGnum CHUNK size: 32bit"
#include <big_384_29.h>
#define BIG BIG_384_29
#define modbytes MODBYTES_384_29
#define BIG_zero(b) BIG_384_29_zero(b)
#define BIG_fromBytesLen(b,v,l) BIG_384_29_fromBytesLen(b,v,l)
#define BIG_inc(b,n) BIG_384_29_inc(b,n)
#define BIG_norm(b) BIG_384_29_norm(b)
#define BIG_nbits(b) BIG_384_29_nbits(b)
#define BIG_copy(b,a) BIG_384_29_copy(b,a)
#define BIG_rcopy(b,a) BIG_384_29_rcopy(b,a)
#define BIG_shr(b,a) BIG_384_29_shr(b,a)
#define BIG_toBytes(b,a) BIG_384_29_toBytes(b,a)
#define BIG_comp(l,r) BIG_384_29_comp(l,r)
#define BIG_add(d,l,r) BIG_384_29_add(d,l,r)
#define BIG_sub(d,l,r) BIG_384_29_sub(d,l,r)
#define BIG_mul(d,l,r) BIG_384_29_smul(d,l,r)
#define BIG_mod(x,n) BIG_384_29_mod(x,n)
#define BIG_div(x,n) BIG_384_29_sdiv(x,n)
#define BIG_modmul(x,y,z,n) BIG_384_29_modmul(x,y,z,n)
#define BIG_moddiv(x,y,z,n) BIG_384_29_moddiv(x,y,z,n)
#define BIG_modsqr(x,y,n) BIG_384_29_modsqr(x,y,n)
#define BIG_modneg(x,y,n) BIG_384_29_modneg(x,y,n)
#define BIG_jacobi(x,y) BIG_384_29_jacobi(x,y)

#elif CHUNK == 16
#error "BIGnum CHUNK size: 16bit PLATFORM NOT SUPPORTED"
#endif // CHUNK
#endif // BIGSIZE

#endif // _H_