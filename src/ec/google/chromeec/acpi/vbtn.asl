/*
 * This file is part of the coreboot project.
 *
 * Copyright 2018 Google Inc.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 2 of the License.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 */

/* VGBS reports 0x40 when NOT in tablet mode. */
/* Sent event 0xCB/0xCC for tablet mode, 0xCA/0xCD for laptop */
/* Linux driver expects SMBIOS_ENCLOSURE_TYPE=SMBIOS_ENCLOSURE_CONVERTIBLE */
Device (VBTN)
{
	Name (_HID, "INT33D6")
	Name (_DDN, "Tablet Virtual Buttons")

	Method (VBDL, 0)
	{
	}

	Method (VGBS)
	{
		If (LEqual (^^RCTM, One)) {
			Return (0x0)
		} Else {
			Return (0x40)
		}
	}
	Method(_STA, 0)
	{
		Return (0xF)
	}
}

Device (VBTO)
{
	Name (_HID, "INT33D3")
	Name (_CID, "PNP0C60")
	Method (_STA, 0)
	{
		Return (0xF)
	}
}
