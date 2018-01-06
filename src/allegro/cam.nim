import allegro,basic2d

type
  PCamera* = ref TCamera
  TCamera* = object
    transform: TTransform
    pos: TPoint2d
    scal, sz: TVector2d
    rot: float
    needsUpdate: bool

proc `size=`* (cam:PCamera; sz:TVector2d) 
proc `scale=`*(cam:PCamera; scale:TVector2d)

proc newCamera* (size: TVector2d): PCamera =
  new result
  result.size = size
  result.scale = vector2d(1,1)
proc newCamera* (D:PDisplay): PCamera =
  newCamera(vector2d(D.get_width.float, D.get_height.float))

proc use* (cam: PCamera) =
  if cam.needsUpdate:
    cam.transform.identityTransform
    cam.transform.translateTransform(- cam.pos.x, - cam.pos.y)
    cam.transform.rotateTransform(- cam.rot)
    cam.transform.scaleTransform cam.scal.x, cam.scal.y
    cam.transform.translateTransform(cam.sz.x/2, cam.sz.y/2)
    cam.needsUpdate = false
  cam.transform.useTransform

proc size* (cam:PCamera): TVector2d =
  cam.sz
proc `size=` (cam:PCamera; sz:TVector2d) =
  cam.sz = sz
  cam.needsUpdate = true
  
proc center* (cam:PCamera): TPoint2d =
  cam.pos
proc `center=`*(cam:PCamera; pos:TPoint2d) = 
  cam.pos = pos
  cam.needsUpdate = true
proc move* (cam: PCamera; offs: TVector2d) =
  cam.center = cam.center + offs

proc scale* (cam:PCamera): TVector2d =
  cam.scal
proc `scale=` (cam:PCamera; scale:TVector2d) =
  cam.scal = scale
  cam.needsUpdate = true
proc zoom* (cam: PCamera; by: float) =
  cam.scale = cam.scale * by

proc rotation* (cam:PCamera): float = 
  cam.rot
proc `rotation=`*(cam:PCamera; R:float) =
  cam.rot = R
  cam.needsUpdate = true
proc rotate* (cam:PCamera; by:float) =
  cam.rotation = cam.rotation + by

when isMainModule:
  al_main:
    discard al.init()
    
    let D = createDisplay(800,640)
    discard al.initBaseAddons()
    discard al.installEverything()
    
    let
      drawTimer = createTimer(1/60) # 60 fps
      Q = createEventQueue()
    
    Q.register D.eventSource
    Q.register drawTimer.eventSource
    Q.register getMouseEventSource()
    Q.register getKeyboardEventSource()
    
    clearToColor mapRGB(0,0,0)
    flipDisplay()
    
    var 
      ev: TEvent
      last = al.getTime()
      ks: TKeyboardState
      ms: TMouseState
      
      cam = newCamera(D)
    
    cam.center = point2d(400,320)
    drawTimer.start
    
    while true:
      Q.waitForEvent ev
      case ev.kind
      of EventDisplayClose:
        # quit
        break

      of EventKeydown:
        case ev.keyboard.keycode
        of keyEscape:
          # quit
          break
        else:
          discard

      of EventMouseButtonDown:
        echo "Mouse button down: ", ev.mouse.button

      of EventTimer:
        if ev.timer.source == drawTimer:
          # redraw
          let 
            cur = al.getTime()
            dt = cur - last
          last = cur
          
          block:
            get_keyboard_state ks
            get_mouse_state ms
            
            var move: TVector2d
            if ks.is_key_down(keyLeft):
              move.x -= 10
            elif ks.is_key_down(keyRight):
              move.x += 10
            if ks.is_key_down(keyDown):
              move.y += 10
            elif ks.is_key_down(keyUp):
              move.y -= 10
            cam.move move
            
            if ms.is_mouse_button_down(1):
              # left (ccw)
              cam.rotate(deg360/360)
            elif ms.is_mouse_button_down(2):
              # right (cw)
              cam.rotate(-deg360/360)
          
          clearToColor mapRGB(0,0,0)
          cam.use
          
          # 0,0
          drawCircle 0,0, 10, mapRGB(255,255,255), 1
          drawCircle 400,320,10, mapRGB(120,120,120),1
          
          drawFilledCircle 100,100,10, mapRGB(0,255,0)
          drawFilledCircle 200,100,10, mapRGB(0,0,255)
          
          flipDisplay()
      
      of EventMouseAxes:
        
        let dz = ev.mouse.dz
        if dz > 0:
          cam.zoom 1.1
        elif dz < 0:
          cam.zoom 0.9
          
      else:
        discard
    
    drawTimer.destroy
    D.destroy
