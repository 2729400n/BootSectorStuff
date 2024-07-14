#pragma once
#include <types/types.h>
#include <regs.h>
#define VIDEO_FIRST_MENU 0x0000

void store_screen(void);
struct mode_info {
	u16 mode;		/* Mode number (vga= style) */
	u16 x, y;		/* Width, height */
	u16 depth;		/* Bits per pixel, 0 for text mode */
};
struct card_info {
	const char *card_name;
	int (*set_mode)(struct mode_info *mode);
	int (*probe)(void);
	struct mode_info *modes;
	int nmodes;		/* Number of probed modes so far */
	int unsafe;		/* Probing is unsafe, only do after "scan" */
	u16 xmode_first;	/* Unprobed modes to try to call anyway */
	u16 xmode_n;		/* Size of unprobed mode range */
};
int mode_defined(u16 mode);	/* video.c */

/* Get the I/O port of the VGA CRTC */
u16 vga_crtc(void);		/* video-vga.c */