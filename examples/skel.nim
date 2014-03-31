import al

al_main:
  if not al.init():
    quit "Failed to initialize allegro!"
  
  let display = al.createDisplay(640, 480)
  if display.isNil:
    quit "Failed to create display!"
  
  discard al.installEverything()
  discard al.initBaseAddons()
  
  let 
    drawTimer = createTimer(1.0/60.0)
    queue = createEventQueue()
    font = systemFont("VeraMono.ttf", 46)
  
  queue.registerEventSource display.EventSource
  queue.registerEventSource drawTimer.eventSource
  queue.registerEventSource getMouseEventSource()
  queue.register getKeyboardEventSource()
  
  drawTimer.start
  
  proc reDraw =
    # draw
    pushTarget(display.getBackbuffer):
      clearToColor mapRGB(0,0,0)
      
      font.drawText mapRGB(255,255,255), 10,10, FontAlignLeft, "Hello, Nimrods."
      
      flipDisplay()
  
  al.clearToColor al.mapRGB(0,0,0)
  al.flipDisplay()
  
  var ev: TEvent
  while true:
    queue.waitForEvent ev
    
    case ev.kind
    of eventTimer:
      if ev.timer.source == drawTimer.eventSource:
        redraw()
        
    
    of eventDisplayClose:
      break
    
    of eventKeyDown:
      
      if ev.keyboard.keycode == keyEscape:
        break

    else:
      echo "Unhandled event ", ev.kind
  
  queue.destroy
  display.destroy
