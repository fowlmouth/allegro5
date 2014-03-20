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

template `<<` (a,b: int{lit}): expr = a shl b
# display.h
#/* Possible bit combinations for the flags parameter of al_create_display. */
const
   ALLEGRO_WINDOWED                    = 1 << 0#,
   ALLEGRO_FULLSCREEN                  = 1 << 1#,
   ALLEGRO_OPENGL                      = 1 << 2#,
   ALLEGRO_DIRECT3D_INTERNAL           = 1 << 3#,
   ALLEGRO_RESIZABLE                   = 1 << 4#,
   ALLEGRO_FRAMELESS                   = 1 << 5#,
   ALLEGRO_NOFRAME                     = ALLEGRO_FRAMELESS#, /* older synonym */
   ALLEGRO_GENERATE_EXPOSE_EVENTS      = 1 << 6#,
   ALLEGRO_OPENGL_3_0                  = 1 << 7#,
   ALLEGRO_OPENGL_FORWARD_COMPATIBLE   = 1 << 8#,
   ALLEGRO_FULLSCREEN_WINDOW           = 1 << 9#,
   ALLEGRO_MINIMIZED                   = 1 << 10

#/* Possible parameters for al_set_display_option.
# * Make sure to update ALLEGRO_EXTRA_DISPLAY_SETTINGS if you modify
# * anything here.
# */
type
  TDisplayOptions* = enum 
   ALLEGRO_RED_SIZE,
   ALLEGRO_GREEN_SIZE,
   ALLEGRO_BLUE_SIZE,
   ALLEGRO_ALPHA_SIZE,
   ALLEGRO_RED_SHIFT,
   ALLEGRO_GREEN_SHIFT,
   ALLEGRO_BLUE_SHIFT,
   ALLEGRO_ALPHA_SHIFT,
   ALLEGRO_ACC_RED_SIZE,
   ALLEGRO_ACC_GREEN_SIZE,
   ALLEGRO_ACC_BLUE_SIZE,
   ALLEGRO_ACC_ALPHA_SIZE,
   ALLEGRO_STEREO,
   ALLEGRO_AUX_BUFFERS,
   ALLEGRO_COLOR_SIZE,
   ALLEGRO_DEPTH_SIZE,
   ALLEGRO_STENCIL_SIZE,
   ALLEGRO_SAMPLE_BUFFERS,
   ALLEGRO_SAMPLES,
   ALLEGRO_RENDER_METHOD,
   ALLEGRO_FLOAT_COLOR,
   ALLEGRO_FLOAT_DEPTH,
   ALLEGRO_SINGLE_BUFFER,
   ALLEGRO_SWAP_METHOD,
   ALLEGRO_COMPATIBLE_DISPLAY,
   ALLEGRO_UPDATE_DISPLAY_REGION,
   ALLEGRO_VSYNC,
   ALLEGRO_MAX_BITMAP_SIZE,
   ALLEGRO_SUPPORT_NPOT_BITMAP,
   ALLEGRO_CAN_DRAW_INTO_BITMAP,
   ALLEGRO_SUPPORT_SEPARATE_ALPHA,
   ALLEGRO_DISPLAY_OPTIONS_COUNT

const
   ALLEGRO_DONTCARE = 0
   ALLEGRO_REQUIRE = 1
   ALLEGRO_SUGGEST = 2

type ALLEGRO_DISPLAY_ORIENTATION* = enum
   ALLEGRO_DISPLAY_ORIENTATION_0_DEGREES,
   ALLEGRO_DISPLAY_ORIENTATION_90_DEGREES,
   ALLEGRO_DISPLAY_ORIENTATION_180_DEGREES,
   ALLEGRO_DISPLAY_ORIENTATION_270_DEGREES,
   ALLEGRO_DISPLAY_ORIENTATION_FACE_UP,
   ALLEGRO_DISPLAY_ORIENTATION_FACE_DOWN

type 
  PDisplay* = ptr object
  PBitmap* = ptr object

# keycodes.h
const 
  KEY_A* = 1
  KEY_B* = 2
  KEY_C* = 3
  KEY_D* = 4
  KEY_E* = 5
  KEY_F* = 6
  KEY_G* = 7
  KEY_H* = 8
  KEY_I* = 9
  KEY_J* = 10
  KEY_K* = 11
  KEY_L* = 12
  KEY_M* = 13
  KEY_N* = 14
  KEY_O* = 15
  KEY_P* = 16
  KEY_Q* = 17
  KEY_R* = 18
  KEY_S* = 19
  KEY_T* = 20
  KEY_U* = 21
  KEY_V* = 22
  KEY_W* = 23
  KEY_X* = 24
  KEY_Y* = 25
  KEY_Z* = 26
  KEY_0* = 27
  KEY_1* = 28
  KEY_2* = 29
  KEY_3* = 30
  KEY_4* = 31
  KEY_5* = 32
  KEY_6* = 33
  KEY_7* = 34
  KEY_8* = 35
  KEY_9* = 36
  KEY_PAD_0* = 37
  KEY_PAD_1* = 38
  KEY_PAD_2* = 39
  KEY_PAD_3* = 40
  KEY_PAD_4* = 41
  KEY_PAD_5* = 42
  KEY_PAD_6* = 43
  KEY_PAD_7* = 44
  KEY_PAD_8* = 45
  KEY_PAD_9* = 46
  KEY_F1* = 47
  KEY_F2* = 48
  KEY_F3* = 49
  KEY_F4* = 50
  KEY_F5* = 51
  KEY_F6* = 52
  KEY_F7* = 53
  KEY_F8* = 54
  KEY_F9* = 55
  KEY_F10* = 56
  KEY_F11* = 57
  KEY_F12* = 58
  KEY_ESCAPE* = 59
  KEY_TILDE* = 60
  KEY_MINUS* = 61
  KEY_EQUALS* = 62
  KEY_BACKSPACE* = 63
  KEY_TAB* = 64
  KEY_OPENBRACE* = 65
  KEY_CLOSEBRACE* = 66
  KEY_ENTER* = 67
  KEY_SEMICOLON* = 68
  KEY_QUOTE* = 69
  KEY_BACKSLASH* = 70
  KEY_BACKSLASH2* = 71 # DirectInput calls this DIK_OEM_102: "< > | on UK/Germany keyboards" 
  KEY_COMMA* = 72
  KEY_FULLSTOP* = 73
  KEY_SLASH* = 74
  KEY_SPACE* = 75
  KEY_INSERT* = 76
  KEY_DELETE* = 77
  KEY_HOME* = 78
  KEY_END* = 79
  KEY_PGUP* = 80
  KEY_PGDN* = 81
  KEY_LEFT* = 82
  KEY_RIGHT* = 83
  KEY_UP* = 84
  KEY_DOWN* = 85
  KEY_PAD_SLASH* = 86
  KEY_PAD_ASTERISK* = 87
  KEY_PAD_MINUS* = 88
  KEY_PAD_PLUS* = 89
  KEY_PAD_DELETE* = 90
  KEY_PAD_ENTER* = 91
  KEY_PRINTSCREEN* = 92
  KEY_PAUSE* = 93
  KEY_ABNT_C1* = 94
  KEY_YEN* = 95
  KEY_KANA* = 96
  KEY_CONVERT* = 97
  KEY_NOCONVERT* = 98
  KEY_AT* = 99
  KEY_CIRCUMFLEX* = 100
  KEY_COLON2* = 101
  KEY_KANJI* = 102
  KEY_PAD_EQUALS* = 103 # MacOS X 
  KEY_BACKQUOTE* = 104 # MacOS X 
  KEY_SEMICOLON2* = 105 # MacOS X -- TODO: ask lillo what this should be 
  KEY_COMMAND* = 106 # MacOS X 
  KEY_UNKNOWN* = 107 # All codes up to before ALLEGRO_KEY_MODIFIERS can be freely\
                     #     assignedas additional unknown keys, like various multimedia
                     #     and application keys keyboards may have.
                     #    
  KEY_MODIFIERS* = 215
  KEY_LSHIFT* = 215
  KEY_RSHIFT* = 216
  KEY_LCTRL* = 217
  KEY_RCTRL* = 218
  KEY_ALT* = 219
  KEY_ALTGR* = 220
  KEY_LWIN* = 221
  KEY_RWIN* = 222
  KEY_MENU* = 223
  KEY_SCROLLLOCK* = 224
  KEY_NUMLOCK* = 225
  KEY_CAPSLOCK* = 226
  KEY_MAX* = 227
const 
  KEYMOD_SHIFT* = 0x00000001
  KEYMOD_CTRL* = 0x00000002
  KEYMOD_ALT* = 0x00000004
  KEYMOD_LWIN* = 0x00000008
  KEYMOD_RWIN* = 0x00000010
  KEYMOD_MENU* = 0x00000020
  KEYMOD_ALTGR* = 0x00000040
  KEYMOD_COMMAND* = 0x00000080
  KEYMOD_SCROLLLOCK* = 0x00000100
  KEYMOD_NUMLOCK* = 0x00000200
  KEYMOD_CAPSLOCK* = 0x00000400
  KEYMOD_INALTSEQ* = 0x00000800
  KEYMOD_ACCENT1* = 0x00001000
  KEYMOD_ACCENT2* = 0x00002000
  KEYMOD_ACCENT3* = 0x00004000
  KEYMOD_ACCENT4* = 0x00008000

# keyboard.h
type 
  PKeyboard* = ptr object
  TKeyboardState* = object
    display*: PDisplay
    internal: array[int((KeyMax + 31)/32), cuint]

# mouse.h
const MouseMaxExtraAxes * = 4
type
  PMouse* = ptr object
  TMouseState* = object
    x*,y*,z*,w*: cint
    moreAxes*: array[MouseMaxExtraAxes, cint]
    buttons*: cint
    pressure*: cfloat
    display*: PDisplay

# joystick.h
const
  MaxJoystickAxes = 3
  MaxJoystickSticks = 8
  MaxJoystickButtons = 32
type
  TJoystickState* = object
    stick*: array[MaxJoystickSticks, tuple[axis: array[MaxJoystickAxes, cfloat]]]
    button*: array[MaxJoystickButtons, cint] 
  TJoyFlags* = enum JoyFlag_Digital = 0x01, JoyFlag_Analogue = 0x02

  PJoystick* = ptr object

# timer.h
type PTimer* = ptr object


#events.h
type 
 TEventType* {.size:sizeof(cuint).} = enum
  EVENT_JOYSTICK_AXIS               =  1,
  EVENT_JOYSTICK_BUTTON_DOWN        =  2,
  EVENT_JOYSTICK_BUTTON_UP          =  3,
  EVENT_JOYSTICK_CONFIGURATION      =  4,

  EVENT_KEY_DOWN                    = 10,
  EVENT_KEY_CHAR                    = 11,
  EVENT_KEY_UP                      = 12,

  EVENT_MOUSE_AXES                  = 20,
  EVENT_MOUSE_BUTTON_DOWN           = 21,
  EVENT_MOUSE_BUTTON_UP             = 22,
  EVENT_MOUSE_ENTER_DISPLAY         = 23,
  EVENT_MOUSE_LEAVE_DISPLAY         = 24,
  EVENT_MOUSE_WARPED                = 25,

  EVENT_TIMER                       = 30,

  EVENT_DISPLAY_EXPOSE              = 40,
  EVENT_DISPLAY_RESIZE              = 41,
  EVENT_DISPLAY_CLOSE               = 42,
  EVENT_DISPLAY_LOST                = 43,
  EVENT_DISPLAY_FOUND               = 44,
  EVENT_DISPLAY_SWITCH_IN           = 45,
  EVENT_DISPLAY_SWITCH_OUT          = 46,
  EVENT_DISPLAY_ORIENTATION         = 47

 TEventSource* = distinct array[32, cint]
 PEventSource* = ptr TEventSource

import macros, strutils
macro al_evt (name, srcType): stmt {.immediate.} =
  
  let cs = callsite()
  cs.expectKind nnkCommand
  
  echo lispRepr(cs)
  
  var fields = ""
  fields.add " kind*: TEventType\L"
  fields.add " source*: "
  fields.add( $srcType )
  fields.add "\L timestamp*: cdouble\L"
  
  if cs.len == 4:
    assert cs[3].kind in {nnkTupleTy,nnkStaticTy},
      "\LInvalid 3rd arg: $#" % lispRepr(cs[3])
    
    for idd in children(cs[3]):
      var thisField = " "
      for i in 0 .. len(idd) - 3:
        if i > 0: thisField.add ", "
        thisField.add($idd[i])
        thisField.add "*"
      thisField.add ": "
      thisField.add( $ idd[len(idd)-2] )
      thisField.add '\L'
      fields.add thisField
    
  
  const s = "type T$1Event * = object\L$2"
  
  result = parseStmt(s.format( 
    $name, fields))
  echo repr (result)
  
al_evt Any, PEventSource
al_evt Display, PDisplay, tuple[x,y,width,height,orientation: cint] 
al_evt Joystick, PJoystick, tuple[
  id:PJoystick, stick,axis:cint, pos:cfloat, button:cint ]
al_evt Keyboard, PKeyboard, tuple[
  display:PDisplay, keycode,unichar:cint, modifiers:cuint, repeat:bool]
al_evt Mouse, PMouse, tuple[
  display:PDisplay, x,y,z,w:cint, dx,dy,dz,dw:cint, button:cuint, pressure:cfloat]
al_evt Timer, PTimer, tuple[
  count: int64, error: cdouble]
al_evt User, PEventSource, tuple[
  internal_descr: pointer, data1,data2,data3,data4: pointer ]


type 

 TEvent* {.union.} = object
  kind*: TEventType
  any*: TAnyEvent
  display*:TDisplayEvent
  joystick*:TJoystickEvent
  keyboard*:TKeyboardEvent
  mouse*:TMouseEvent
  timer*:TTimerEvent
  user*:TUserEvent

 TEvent2* = object #variant version
   case kind*: TEventType
   of EVENT_KEY_DOWN, EVENT_KEY_CHAR, EVENT_KEY_UP:
     keyboard*: TKeyboardEvent
   else:
     nil
  
  
#color.h
type
  TColor* = object{.pure.}
    r*,g*,b*,a*: cfloat

{.pragma: importAL, importc: "al_$1".}
{.push dynlib: LIB_NAME, callconv: cdecl.}


# conflicts with KEY_DOWN, so this is al_key_down (aliased as is_key_down())
proc al_key_down* (state: var TKeyboardState; keycode: cint): bool {.importc.}

# system.h
proc install_system* (version: cint, atExitPTR: proc: cint{.cdecl.}): bool {.importAL, discardable.}

{.push importc: "al_$1".}

# display.h
proc create_display* (w, h: cint): PDisplay 
proc destroy_display* (display: PDisplay)
proc flip_display* 

proc get_current_display* : PDisplay 

proc set_target_bitmap* (bitmap: PBitmap) 
proc set_target_backbuffer* (display:PDisplay)
proc get_backbuffer* (display:PDisplay):PBitmap
proc get_target_bitmap* :PBitmap

proc resize_display* (display:PDisplay; width,height: cint): bool 
proc wait_for_vsync* : bool 

proc get_display_event_source* (D:PDisplay): PEventSource 

proc set_window_position* (D:PDisplay; x,y: cint)
proc get_window_position(D:PDisplay; x,y: var cint) 
proc set_window_title* (D:PDisplay; title:cstring) 

discard """
AL_FUNC(void, al_set_new_display_refresh_rate, (int refresh_rate));
AL_FUNC(void, al_set_new_display_flags, (int flags));
AL_FUNC(int,  al_get_new_display_refresh_rate, (void));
AL_FUNC(int,  al_get_new_display_flags, (void));

AL_FUNC(int, al_get_display_width,  (ALLEGRO_DISPLAY *display));
AL_FUNC(int, al_get_display_height, (ALLEGRO_DISPLAY *display));
AL_FUNC(int, al_get_display_format, (ALLEGRO_DISPLAY *display));
AL_FUNC(int, al_get_display_refresh_rate, (ALLEGRO_DISPLAY *display));
AL_FUNC(int, al_get_display_flags,  (ALLEGRO_DISPLAY *display));
AL_FUNC(bool, al_set_display_flag, (ALLEGRO_DISPLAY *display, int flag, bool onoff));
AL_FUNC(bool, al_toggle_display_flag, (ALLEGRO_DISPLAY *display, int flag, bool onoff));


AL_FUNC(bool, al_acknowledge_resize, (ALLEGRO_DISPLAY *display));
AL_FUNC(void, al_update_display_region, (int x, int y, int width, int height));
AL_FUNC(bool, al_is_compatible_bitmap, (ALLEGRO_BITMAP *bitmap));

AL_FUNC(void, al_set_display_icon, (ALLEGRO_DISPLAY *display, ALLEGRO_BITMAP *icon));
AL_FUNC(void, al_set_display_icons, (ALLEGRO_DISPLAY *display, int num_icons, ALLEGRO_BITMAP *icons[]));

/* Stuff for multihead/window management */
AL_FUNC(int, al_get_new_display_adapter, (void));
AL_FUNC(void, al_set_new_display_adapter, (int adapter));
AL_FUNC(void, al_set_new_window_position, (int x, int y));
AL_FUNC(void, al_get_new_window_position, (int *x, int *y));

/* Defined in display_settings.c */
AL_FUNC(void, al_set_new_display_option, (int option, int value, int importance));
AL_FUNC(int, al_get_new_display_option, (int option, int *importance));
AL_FUNC(void, al_reset_new_display_options, (void));
AL_FUNC(int, al_get_display_option, (ALLEGRO_DISPLAY *display, int option));

/*Deferred drawing*/
AL_FUNC(void, al_hold_bitmap_drawing, (bool hold));
AL_FUNC(bool, al_is_bitmap_drawing_held, (void));

"""


# drawing.h
proc clear_to_color* (color: TColor)  


# color.h
proc map_rgb* (r,g,b: uint8): TColor 


# keyboard.h
proc is_keyboard_installed*:bool
proc install_keyboard*: bool
proc uninstall_keyboard*

proc set_keyboard_leds* (leds: cint): bool
proc keycode_to_name* (keycode: cint): cstring

proc get_keyboard_state* (result: var TKeyboardState)

proc get_keyboard_event_source* : PEventSource
  

# joystick.h
proc install_joystick* : bool 
proc uninstall_joystick* 
proc is_joystick_installed*: bool
proc reconfigure_joysticks*: bool

discard """

AL_FUNC(int,            al_get_num_joysticks,   (void));
AL_FUNC(ALLEGRO_JOYSTICK *, al_get_joystick,    (int joyn));
AL_FUNC(void,           al_release_joystick,    (ALLEGRO_JOYSTICK *));
AL_FUNC(bool,           al_get_joystick_active, (ALLEGRO_JOYSTICK *));
AL_FUNC(const char*,    al_get_joystick_name,   (ALLEGRO_JOYSTICK *));

AL_FUNC(int,            al_get_joystick_num_sticks, (ALLEGRO_JOYSTICK *));
AL_FUNC(int, al_get_joystick_stick_flags, (ALLEGRO_JOYSTICK *, int stick)); /* junk? */
AL_FUNC(const char*,    al_get_joystick_stick_name, (ALLEGRO_JOYSTICK *, int stick));

AL_FUNC(int,            al_get_joystick_num_axes,   (ALLEGRO_JOYSTICK *, int stick));
AL_FUNC(const char*,    al_get_joystick_axis_name,  (ALLEGRO_JOYSTICK *, int stick, int axis));

AL_FUNC(int,            al_get_joystick_num_buttons,  (ALLEGRO_JOYSTICK *));
AL_FUNC(const char*,    al_get_joystick_button_name,  (ALLEGRO_JOYSTICK *, int buttonn));

AL_FUNC(void,           al_get_joystick_state,  (ALLEGRO_JOYSTICK *, ALLEGRO_JOYSTICK_STATE *ret_state));

AL_FUNC(ALLEGRO_EVENT_SOURCE *, al_get_joystick_event_source, (void));
"""


# altime.h
proc rest* (seconds: cdouble)  
{.pop.}
{.pop.}

proc init* (): bool {.discardable.} =
  proc atexit : cint {.importc, header: "stdlib.h", cdecl.}
  install_system(VERSION_INT, atexit)


discard """ proc isNil* (D: PDisplay): bool {.borrow.}
 """
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

