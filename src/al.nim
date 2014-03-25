when defined(Linux):
  const
    dll_image = "liballegro_image.so.5.0.10"
    dll_main = "liballegro.so.5.0.10"
    dll_font = "liballegro_font.so.5.0.10"
    dll_ttf = "liballegro_ttf.so.5.0.10"
    dll_primitives = "liballegro_primitives.so.5.0.10"
elif defined(Windows):
  const
    dll_main = "allegro-5.0.10-mt.dll"

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

 PEventQueue* = ptr object

# altime.h
type TTimeout* = object
  pad: array[2,uint64]

# bitmap.h
type
  TBitmapFlag* {.size:sizeof(cint).} = enum
    ALLEGRO_MEMORY_BITMAP            = 0x0001,
    ALLEGRO_KEEP_BITMAP_FORMAT       = 0x0002,
    ALLEGRO_FORCE_LOCKING            = 0x0004,
    ALLEGRO_NO_PRESERVE_TEXTURE      = 0x0008,
    ALLEGRO_ALPHA_TEST               = 0x0010,
    ALLEGRO_INTERNAL_OPENGL          = 0x0020,
    ALLEGRO_MIN_LINEAR               = 0x0040,
    ALLEGRO_MAG_LINEAR               = 0x0080,
    ALLEGRO_MIPMAP                   = 0x0100,
    ALLEGRO_NO_PREMULTIPLIED_ALPHA   = 0x0200,
    ALLEGRO_VIDEO_BITMAP             = 0x0400
# bitmap_draw.h
const
  FlipHorizontal* = cint(1 shl 0)
  FlipVertical* = cint(1 shl 1) 
# color.h
type
  TColor* = object{.pure.}
    r*,g*,b*,a*: cfloat

# file.h
type PFile* = ptr object

# transformations.h
type 
 PTransform* = var TTransform
 TTransform* = object
  m*: array[4, array[4, cfloat]]

# utf8.h
type  
  UStr* = ptr object

# allegro_font.h
type
  PFont* = ptr object
  TFontLoader* = proc(filename:cstring, size,flags:cint): PFont
const
  FontAlignLeft* = 0.cint
  FontAlignCenter* = 1.cint
  FontAlignRight* = 2.cint
  FontAlignInteger* = 4.cint

# allegro_ttf.h
const
  TTF_NoKerning* = 1.cint
  TTF_Monochrome* = 2.cint
  TTF_NoAutohint* = 4.cint

# allegro_primitives.h
type
  TPrimitiveType* {.size:sizeof(cint).} = enum
    LineList, LineStrip, LineLoop, TriangleList, TriangleStrip, TriangleFan,
    PointList


{.pragma: importAL, importc: "al_$1".}
{.push callconv: cdecl.}
{.push dynlib: dllMain.}

# conflicts with KEY_DOWN, so this is al_key_down (aliased as is_key_down())
proc al_key_down* (state: var TKeyboardState; keycode: cint): bool {.importc.}
proc emit_user_event* (
    source: PEventSource; 
    event: ptr TEvent; 
    destructor: proc(userEvent: ptr TUserEvent){.cdecl.} ):bool{.importAL.}
# system.h
proc install_system* (version: cint, atExitPTR: proc: cint{.cdecl.}): bool {.importAL, discardable.}

{.push importc: "al_$1".}

# bitmap.h
proc set_new_bitmap_format*(format:cint)
proc set_new_bitmap_flags*(flags:cint)
proc get_new_bitmap_format*:cint
proc get_new_bitmap_flags*:cint
proc add_new_bitmap_flag*(flag:TBitmapFlag)

proc get_bitmap_width* (bitmap:PBitmap): cint
proc get_bitmap_height* (bitmap:PBitmap): cint
proc get_bitmap_format* (bitmap:PBitmap): cint
proc get_bitmap_flags* (bitmap:PBitmap): cint

proc create_bitmap*(w,h: cint): PBitmap
proc destroy_bitmap* (bitmap:PBitmap)

proc put_pixel* (x,y:cint, color:TColor)
proc put_blended_pixel*(x,y:cint, color:TColor)
proc get_pixel* (bitmap:PBitmap, x,y:cint):TColor

proc convert_mask_to_alpha*(bitmap:PBitmap, maskColor: TColor)

proc set_clipping_rectangle* (x,y,w,h:cint) 
proc reset_clipping_rectangle*
proc get_clipping_rectangle* (x,y,w,h:var cint)

proc create_sub_bitmap* (parent:PBitmap; x,y,w,h:cint): PBitmap
proc is_sub_bitmap*(bitmap:PBitmap): bool
proc get_parent_bitmap*(bitmap:PBitmap):PBitmap

proc clone_bitmap*(bitmap:PBitmap):PBitmap

# bitmap_draw.h
proc draw_bitmap* (bmp:PBitmap; dx,dy:cfloat; flags:cint)
proc draw_bitmap_region*(bmp:PBitmap; sx,sy,sw,sh, dx,dy: cfloat; flags:cint)
proc draw_scaled_bitmap*(bmp:PBitmap; sx,sy,sw,sh, dx,dy,dw,dh:cfloat; flags:cint)
proc draw_rotated_bitmap*(bmp:PBitmap; cx,cy, dx,dy, angle: cfloat; flags:cint)
proc draw_scaled_rotated_bitmap*(bmp:PBitmap; cx,cy,dx,dy,xscale,yscale,angle:cfloat; flags:cint)

proc draw_tinted_bitmap* (bmp:PBitmap; tint:TColor; dx,dy:cfloat; flags:cint)
proc draw_tinted_bitmap_region*(bmp:PBitmap; tint:TColor; 
    sx,sy,sw,sh, dx,dy: cfloat; flags:cint)
proc draw_tinted_scaled_bitmap* (bmp:PBitmap; tint:TColor;
    sx,sy,sw,sh, dx,dy,dw,dh:cfloat; flags:cint)
proc draw_tinted_rotated_bitmap*(bmp:PBitmap;tint:TColor;
    cx,cy,dx,dy,angle:cfloat; flags:cint)
proc draw_tinted_scaled_rotated_bitmap*(bmp:PBitmap; tint:TColor;
    cx,cy,dx,dy,xscale,yscale,angle:cfloat; flags:cint)
proc draw_tinted_scaled_rotated_bitmap_region*(bmp:PBitmap;
    sx,sy,sw,sh:cfloat; tint:TColor;
    cx,cy,dx,dy,xscale,yscale,angle:cfloat; flags:cint)

# bitmap_io.h
{.pop.}
#typedef ALLEGRO_BITMAP *(*ALLEGRO_IIO_LOADER_FUNCTION)(const char *filename);
type IIO_LoaderFunction* = proc(filename: cstring): PBitmap {.cdecl.}
#typedef ALLEGRO_BITMAP *(*ALLEGRO_IIO_FS_LOADER_FUNCTION)(ALLEGRO_FILE *fp);
type IIO_FS_LoaderFunction* = proc (fp: al.PFile): PBitmap {.cdecl.}
#typedef bool (*ALLEGRO_IIO_SAVER_FUNCTION)(const char *filename, ALLEGRO_BITMAP *bitmap);
type IIO_SaverFunction* = proc(filename:cstring, bitmap:PBitmap): bool{.cdecl.}
#typedef bool (*ALLEGRO_IIO_FS_SAVER_FUNCTION)(ALLEGRO_FILE *fp, ALLEGRO_BITMAP *bitmap);

{.push importc:"al_$1".}
proc register_bitmap_loader*(ext:cstring, f:IIOLoaderFunction):bool
proc register_bitmap_saver*(ext:cstring, f:IIOSaverFunction):bool

discard """
AL_FUNC(bool, al_register_bitmap_loader, (const char *ext, ALLEGRO_IIO_LOADER_FUNCTION loader));
AL_FUNC(bool, al_register_bitmap_saver, (const char *ext, ALLEGRO_IIO_SAVER_FUNCTION saver));
"""


discard """AL_FUNC(bool, al_register_bitmap_loader_f, (const char *ext, ALLEGRO_IIO_FS_LOADER_FUNCTION fs_loader));
AL_FUNC(bool, al_register_bitmap_saver_f, (const char *ext, ALLEGRO_IIO_FS_SAVER_FUNCTION fs_saver));
AL_FUNC(ALLEGRO_BITMAP *, al_load_bitmap, (const char *filename));
AL_FUNC(ALLEGRO_BITMAP *, al_load_bitmap_f, (ALLEGRO_FILE *fp, const char *ident));
AL_FUNC(bool, al_save_bitmap, (const char *filename, ALLEGRO_BITMAP *bitmap));
AL_FUNC(bool, al_save_bitmap_f, (ALLEGRO_FILE *fp, const char *ident, ALLEGRO_BITMAP *bitmap));
"""
proc load_bitmap* (filename:cstring): PBitmap
proc save_bitmap* (filename:string,bitmap:PBitmap): bool


# bitmap_lock.h
type
 TLockMode* = enum
  Lock_RW, Lock_RO, Lock_WO
 TLockedRegion* = object
  data*:pointer
  format*,pitch*,pixelSize*:cint

proc lock_bitmap* (BMP:PBitmap; format:cint; flags:TLockMode): PLockedRegion
proc lock_bitmap_region* (BMP:PBitmap; x,y,w,h,format:cint; flags:TLockMode): PLockedRegion
proc unlock_bitmap* (BMP:PBitmap)
proc is_bitmap_locked*(BMP:PBitmap):bool

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

proc set_new_display_refresh_rate* (refreshRate:cint) 
proc set_new_display_flags* (flags:cint)
proc get_new_display_refresh_rate* : cint
proc get_new_display_flags* : cint

proc get_display_width* (D:PDisplay):cint
proc get_display_height*(D:PDisplay):cint
proc get_display_format*(D:PDisplay):cint
proc get_display_refresh_rate*(D:PDisplay):cint
proc get_display_flags*(D:PDisplay):cint
proc set_display_flag* (D:PDisplay; flag:cint; state:bool):bool
proc toggle_display_flag*(D:PDisplay; flag:cint; state:bool):bool

proc acknowledge_resize* (D:PDisplay): bool
proc update_display_region*(x,y,w,h:cint)
proc is_compatible_bitmap*(B:PBitmap): bool

proc set_display_icon* (D:PDisplay; icon:PBitmap)
proc set_display_icons*(D:PDisplay; num:cint; bmps:ptr PBitmap)

proc get_new_display_adapter* : cint
proc set_new_display_adapter* (adapter:cint)
proc set_new_window_position* (x,y:cint)
proc get_new_window_position* (x,y:var cint)

proc set_new_display_option*(option,value,importance:cint)
proc get_new_display_option*(option:cint; importance:var cint):cint
proc reset_new_display_options()
proc get_display_option*(D:PDisplay; option:cint):cint

proc hold_bitmap_drawing*(hold:bool)
proc is_bitmap_drawing_held*:bool

# drawing.h
proc clear_to_color* (color: TColor)  
proc draw_pixel* (x,y:cfloat; color:TColor)

# color.h
proc map_rgb* (r,g,b: uint8): TColor
proc map_rgba*(r,g,b,a:uint8):TColor
proc map_rgb_f*(r,g,b:cfloat):TColor
proc map_rgba_f*(r,g,b,a:cfloat):TColor

proc unmap_rgb*(color:TColor; r,g,b:var uint8)
proc unmap_rgba*(color:TColor; r,g,b,a:var uint8)
proc unmap_rgb_f*(color:TColor; r,g,b:var cfloat)
proc unmap_rgba_f*(color:TColor; r,g,b,a:var cfloat)

proc get_pixel_size*(format:cint):cint
proc get_pixel_format_bits*(format:cint):cint 


# events.h
proc init_user_event_source* (source: PEventSource)
proc destroy_user_event_source*(source:PEventSource)
#emit_user_event

proc unref_user_event* (userEvent:ptr TUserEvent)
proc set_event_source_data* (src:PEventSource; data:pointer)
proc get_event_source_data* (src:PEventSource): pointer

proc create_event_queue* : PEventQueue
proc destroy_event_queue* (Q:PEventQueue)
proc register_event_source*(Q:PEventQueue; src:PEventSource)
proc is_event_queue_empty*(Q:PEventQueue): bool
proc get_next_event*(Q:PEventQueue; result:var TEvent): bool
proc peek_next_event*(Q:PEventQueue; result:var TEvent):bool
proc drop_next_event*(Q:PEventQueue):bool
proc flush_event_queue*(Q:PEventQueue)
proc wait_for_event*(Q:PEventQueue; result:var TEvent)

proc wait_for_event_timed*(Q:PEventQueue; result:var TEvent; secs:cfloat): bool
proc wait_for_event_until*(Q:PEventQueue; result:var TEvent; timeout:var TTimeout):bool



# keyboard.h
proc is_keyboard_installed*:bool
proc install_keyboard*: bool
proc uninstall_keyboard*

proc set_keyboard_leds* (leds: cint): bool
proc keycode_to_name* (keycode: cint): cstring

proc get_keyboard_state* (result: var TKeyboardState)

proc get_keyboard_event_source* : PEventSource

# mouse.h
proc is_mouse_installed* : bool
proc install_mouse*: bool
proc uninstall_mouse*:void
proc get_mouse_num_buttons* : cint #cuint
proc get_mouse_num_axes*: cint #cuint
proc set_mouse_xy * (D:PDisplay; x,y:cint): bool
proc set_mouse_z* (z: cint): bool
proc set_mouse_w* (w: cint): bool
proc set_mouse_axis*(axis,value: cint): bool
proc get_mouse_state*(state:var TMouseState):void
proc mouse_button_down*(state:var TMouseState; button:cint): bool
proc get_mouse_state_axis*(state:var TMouseState;axis:cint): cint
proc get_mouse_cursor_position*(resultX,resultY: var cint):bool
proc grab_mouse*(D:PDisplay):bool
proc ungrab_mouse*: bool

proc get_mouse_event_source* : PEventSource

# joystick.h
proc install_joystick* : bool {.discardable.}
proc uninstall_joystick* 
proc is_joystick_installed*: bool
proc reconfigure_joysticks*: bool

proc get_num_joysticks* : cint 
proc get_joystick* (id: cint): PJoystick
proc release_joystick* (J:PJoystick) 
proc get_joystick_active* (J:PJoystick): bool
proc get_joystick_name* (J:PJoystick): cstring

proc get_joystick_num_sticks* (J:PJoystick): cint
proc get_joystick_stick_flags*(J:PJoystick; stick:cint): cint
proc get_joystick_stick_name* (J:PJoystick; stick:cint): cstring

proc get_joystick_num_axes* (J:PJoystick; stick:cint): cint
proc get_joystick_axis_name*(J:PJoystick; stick,axis:cint):cstring

proc get_joystick_num_buttons*(J:PJoystick):cint
proc get_joystick_button_name*(J:PJoystick; button:cint): cint

proc get_joystick_state* (J:PJoystick; result:var TJoystickState)

proc get_joystick_event_source* : PEventSource

# transformations.h
proc use_transform* (trans:PTransform)
proc copy_transform*(dest, src:PTransform)
proc identity_transform*(trans:PTransform)
proc build_transform* (trans:PTransform; x,y,sw,sy,theta:cfloat)
proc translate_transform*(trans:PTransform; x,y:cfloat)
proc rotate_transform*(trans:PTransform; theta:cfloat)
proc scale_transform*(trans:PTransform; sx,sy:cfloat)
proc transform_coordinates* (tran:PTransform; x,y:var cfloat)
proc compose_transform* (trans,other:PTransform)
proc get_current_transform* : PTransform
proc invert_transform* (trans:PTransform)
proc check_inverse* (trans:PTransform; tol:cfloat): cint

# timer.h
proc create_timer* (seconds: cdouble) : PTimer
proc destroy_timer*(T:PTimer)
proc start_timer* (T:PTimer)
proc stop_timer* (T:PTimer)
proc get_timer_started* (T:PTimer): bool
proc get_timer_speed* (T:PTimer): cdouble
proc set_timer_speed* (T:PTimer; seconds: cdouble)
proc get_timer_count* (T:PTimer): int64
proc set_timer_count* (T:PTimer; count:int64)
proc add_timer_count* (T:PTimer; diff:int64)
proc get_timer_event_source*(T:PTimer):PEventSource

# altime.h
proc get_time* : cdouble
proc rest* (seconds: cdouble)
proc init_timeout* (timeout: ptr TTimeout; seconds: cdouble)  

{.pop.}
{.pop.}

# allegro_image.h
{.push importc: "al_$1", dynlib: dllImage.} 
proc init_image_addon* :bool
proc shutdown_image_addon*: void
proc get_allegro_image_version*: uint32

{.pop.}

# allegro_font.h
{.push importc:"al_$1",dynlib: dllFont.}

proc register_font_loader* (ext:cstring; loader: TFontLoader): bool

  
proc load_bitmap_font* (filename:cstring): PFont
proc load_font* (filename:cstring; size,flags:cint): PFont

proc grab_font_from_bitmap* (bmp:PBitmap; num: cint, ranges: ptr array[int.high, cint])
proc create_builtin_font* : PFont

proc draw_ustr* (font:PFont; color:TColor; x, y: cfloat, flags: cint, ustr: USTR): void
proc draw_text* (font:PFont; color:TColor; x,y:cfloat; flags:cint; text:cstring): void
proc draw_justified_text* (font:PFont; color:TColor; x1,x2,y,diff:cfloat; flags:cint; text:cstring): void
proc draw_justified_ustr* (font:PFont; color:TColor; x1,x2,y,diff:cfloat; flags:cint; text:USTR): void

proc draw_textf* (F:PFont; color:TColor; x,y:cfloat; flags:cint; format:cstring){.varargs.}
proc draw_justified_textf* (F:PFont; color:TColor; x1,x2,y,diff:cfloat; flags:cint; format:cstring) {.varargs.}
proc get_text_width* (F:PFont; str:cstring): cint
proc get_ustr_width* (F:PFont; ustr:USTR): cint
proc get_font_line_height* (F:PFont): cint
proc get_font_ascent* (F:PFont):cint
proc get_font_descent*(F:PFont):cint
proc destroy_font* (F:PFont)
proc get_ustr_dimensions* (F:PFont; text:USTR; bbx,bby,bbw,bbh:var cint)
proc get_text_dimensions* (F:PFont; text:cstring; bbx,bby,bbw,bbh:var cint)

proc init_font_addon*:bool
proc shutdown_font_addon*:void
proc get_allegro_font_version*:uint32
{.pop.}

# allegro_ttf.h
{.push importc:"al_$1",dynlib:dllTTF.}
proc load_ttf_font* (filename:cstring; size,flags:cint): PFont
proc load_ttf_font_f*(file:PFile; filename:cstring; size,flags:cint): PFont
proc load_ttf_font_stretch*(filename:cstring; w,h,flags:cint): PFont
proc load_ttf_font_stretch_f* (file:PFile; filename:cstring; w,h,flags:cint): PFont
proc init_ttf_addon*:bool
proc shutdown_ttf_addon*:void
proc get_allegro_ttf_version*:uint32
{.pop.}

# allegro_primitives.h
type
 PVertexDecl* = ptr object 
 TVertexElement* = object
  attribute*,storage*,offset*: cint
 TVertex* = object
  x*,y*,z*, u*,v*: cfloat
  color*:TColor
{.push importc:"al_$1",dynlib:dllPrimitives.}
proc get_allegro_primitives_version*: uint32
proc init_primitives_addon*:bool
proc shutdown_primitives_addon*:void
proc draw_prim* (vertices: pointer; decl: PVertexDecl; texture:PBitmap; start,fin,kind:cint): cint
proc draw_indexed_prim*(vertices:pointer; decl:PVertexDecl; 
  texture:PBitmap; indices:pointer; numVertices, kind: cint ): cint

proc create_vertex_decl* (elements:ptr TVertexElement; stride:cint): PVertexDecl
proc destroy_vertex_decl*(decl:PVertexDecl): void

#proc draw_soft_triangle* (v1,v2,v3: ptr TVertex; state: pointer; 


proc draw_line* (x1,y1,x2,y2:cfloat; color:TColor; thickness:cfloat)
proc draw_triangle*(x1,y1,x2,y2,x3,y3:cfloat; color:TColor; thickness:cfloat)
proc draw_rectangle*(x1,y1,x2,y2:cfloat; color:TColor; thickness:cfloat)
proc draw_rounded_rectangle*(x1,y1,x2,y2,rx,ry: cfloat; color:TColor; thickness:cfloat)

proc calculate_arc* (dest:var cfloat; stride:cint; cx,cy,rx,ry,startTheta,deltaTheta,thickness:cfloat; numSegments:cint)
proc draw_circle* (cx,cy,r:cfloat; color:TColor; thickness:cfloat)
proc draw_ellipse*(cx,cy,rx,ry:cfloat; color:TColor; thickness:cfloat)
proc draw_arc* (cx,cy,r,startTheta,deltaTheta:cfloat; color:TColor; thickness:cfloat)
proc draw_elliptical_arc* (cx,cy,rx,ry,startTheta,deltaTheta:cfloat; color:TColor; thickness:cfloat)
proc draw_pieslice*(cx,cy,r,startTheta,deltaTheta:cfloat; color:TColor; thickness:cfloat)

proc calculate_spline* (dest:var cfloat; stride:cint; points:array[8,cfloat]; thickness:cfloat; numSegments:cint) 
proc draw_spline* (points:array[8,cfloat]; color:TColor; thickness:cfloat)

proc calculate_ribbon*(
    dest:var cfloat; destStride:cint; points:ptr cfloat; pointsStride:cint,
    thickness:cfloat; numSegments:cint)
proc draw_ribbon* (points:ptr cfloat; pointsStride:cint; color:TColor; thickness:cfloat; numSegments:cint)

proc draw_filled_triangle* (x1,y1,x2,y2,x3,y3:cfloat; color:TColor)
proc draw_filled_rectangle* (x1,y1,x2,y2:cfloat; color:TColor)
proc draw_filled_ellipse* (cx,cy,rx,ry:cfloat; color:TColor)
proc draw_filled_circle* (cx,cy,r:cfloat; color:TColor)
proc draw_filled_pieslice* (cx,cy,r,startTheta,deltaTheta:cfloat; color:TColor)
proc draw_filled_rounded_rectangle* (x1,y1,x2,y2,rx,ry:cfloat; color:TColor)
   

{.pop.}

{.pop.}

## aliases


proc init* (timeout: var TTimeout; seconds: cdouble) {.inline.} =
  init_timeout(timeout.addr, seconds)

discard """ proc isNil* (D: PDisplay): bool {.borrow.}
 """
proc destroy* (some: PDisplay) {.inline.} =
  some.destroy_display
proc destroy* (Q:PEventQueue) {.inline.} =
  q.destroy_eventqueue
proc destroy* (B:PBitmap) {.inline.}=
  b.destroyBitmap

proc get_size* (D:PDisplay): tuple[w,h:cint] =
  result.w = d.get_display_width
  result.h = d.get_display_height

proc get_width* (B:PBitmap):cint {.inline.} =
  b.getBitmapWidth
proc get_height*(B:PBitmap):cint{.inline.}=
 b.getBitmapHeight
proc get_size* (B:PBitmap): tuple[w,h: cint] {.inline.} =
  (b.getWidth, b.getHeight)


proc is_key_down* (state: var TKeyboardState; keycode: cint): bool {.inline.} =
  al_key_down(state, keycode)

proc eventSource* (D:PDisplay): PEventSource {.inline.} = 
  D.getDisplayEventSource

proc start*(T:PTimer){.inline.}=T.startTimer
proc eventSource*(T:PTimer):PEventSource{.inline.}=T.getTimerEventSource

proc register*(Q:PEventQueue; SRC:PEventSource){.inline.}=Q.registerEventSource(SRC)

## higher level helper functions

proc init* (): bool {.discardable.} =
  proc atexit : cint {.importc, header: "stdlib.h", cdecl.}
  install_system(VERSION_INT, atexit)

template pushTarget* (B:PBitmap; body:stmt):stmt =
  let old = getTargetBitmap()
  setTargetBitmap(B)
  body
  setTargetBitmap(old)


import os

proc findFile (f: string; dirs: seq[string]): string =
  block foo:
    for d in dirs:
      for file in walkFiles(d/f):
        result = file #d / file
        break foo

proc systemFontDirectories* : seq[string] =
  when defined(Linux):
    result = @[ "/usr/share/fonts/TTF" ]
  elif defined(Windows):
    result = @[ "/Windows/Fonts" ]  
  else:
    result = @[ "/Libraries/Fonts" ]
  
proc systemFont* (f: string, size: cint; flags = 0.cint): PFont =
  let f = find_file(f, systemFontDirectories())
  if not f.isNil:
    result = loadFont(f, size,flags)

proc initBaseAddons* : bool =
  template i (f): stmt =
    if not f(): result = false
  result = true
  i initImageAddon
  i initFontAddon
  i initTTFAddon
  i initPrimitivesAddon

when isMainModule:
  
  if not al.init():
    quit "Failed to initialize allegro!"
  
  let display = al.createDisplay(640, 480)
  if display.isNil:
    quit "Failed to create display!"
  
  let timer = createTimer(1.0/60.0)
  
  let queue = createEventQueue()
  discard al.installKeyboard()
  discard al.installMouse()
  discard initBaseAddons()
  
  let font = systemFont("VeraMono.ttf", 46)
  
  #queue.register display.getEventSource
  queue.registerEventSource display.EventSource
  queue.registerEventSource timer.eventSource
  queue.registerEventSource getMouseEventSource()
  queue.register getKeyboardEventSource()
  
  timer.start
  
  al.clearToColor(al.mapRGB(0,0,0))
  al.flipDisplay()
  
  var ev: TEvent
  while true:
    queue.waitForEvent ev
    
    case ev.kind
    of eventTimer:
      # draw
      pushTarget(display.getBackbuffer):
        clearToColor(mapRGB(0,0,0))
        
        font.drawText mapRGB(255,255,255), 10,10, FontAlignLeft, "Hello, Nimrods."
        
        flipDisplay()
    
    of eventDisplayClose:
      break
    
    else:
      echo "Unhandled event ", ev.kind
  
  queue.destroy
  al.destroy(display)

