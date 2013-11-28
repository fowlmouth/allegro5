when defined(Linux):
  const
    LIB_NAME = "liballegro.so"
elif defined(Windows):
  const
    LIB_NAME = "allegro-5.0.10-mt.dll"

const
  VERSION = 5
  SUB_VERSION = 0
  WIP_VERSION = 10
  RELEASE_NUMBER = 1
  
  VERSION_STR = $VERSION & $SUB_VERSION & $WIP_VERSION
  DATE_STR = "2013"
  DATE = 20130616 # yyyymmdd
  VERSION_INT: cint = (VERSION shl 24) or (SUB_VERSION shl 16) or
    (WIP_VERSION shl 8) or RELEASE_NUMBER


#color.h
type
  TColor* = object{.pure.}
    r*,g*,b*,a*: cfloat

type
  PDisplay* = distinct pointer

{.push dynlib: LIB_NAME, callconv: cdecl.}

# system.h
proc install_system* (version: cint, atExitPTR: proc: cint{.cdecl.}): bool {.
  discardable, importc: "al_$1".}


# display.h
proc create_display* (w, h: cint): PDisplay {.importc: "al_$1".}
proc destroy_display* (display: PDisplay) {.importc: "al_$1".}
proc flip_display* {.importc: "al_$1".}

# drawing.h
proc clear_to_color* (color: TColor) {.importc: "al_$1".} 


# color.h
proc map_rgb* (r,g,b: uint8): TColor {.importc: "al_$1".}


# altime.h
proc rest* (seconds: cdouble) {.importc: "al_$1".} 
{.pop.}


proc init* (): bool {.discardable.} =
  proc atexit : cint {.importc, header: "stdlib.h", cdecl.}
  install_system(VERSION_INT, atexit)


proc isNil* (D: PDisplay): bool {.borrow.}

proc destroy* (some: PDisplay) {.inline.} =
  some.destroy_display



when isMainModule:
  
  if not al.init():
    quit "Failed to initialize allegro!"
  
  let display = al.createDisplay(640, 480)
  if display.isNil:
    quit "Failed to create display!"
  
  al.clearToColor(al.mapRGB(0,0,0))
  al.flipDisplay()
  al.rest(2.0)
  al.destroy(display)

