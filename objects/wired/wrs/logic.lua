function init()
  entity.setInteractive(entity.configParameter("interactive", true))
  self.wrsPos = entity.position()

  if storage.healMode == nil then
    storage.locked = entity.configParameter("healMode", false)
  end

  if storage.liquidID == nil then
    storage.liquidID = entity.configParameter("liquidID", 1)
  end

  if storage.state == nil then
    output(false)
  else
    output(storage.state)
  end
end

-- Change Animation
function output(state)
  if state ~= storage.state then
    storage.state = state
    if state then
      entity.setAnimationState("wrsState", "on")
    else
      entity.setAnimationState("wrsState", "off")
    end
  end
end

-- Adds water at current position
function fill()
  world.spawnLiquid(self.wrsPos, storage.liquidID, 1)
end

function onInteraction(args)
  if not storage.healMode then
    entity.say("Enabling heal mode")
    storage.healMode = true
    storage.liquidID = 6
  else
    entity.say("Disabling heal mode")
    storage.healMode = false
    storage.liquidID = 1
  end
end

function update(dt)
  if entity.isInboundNodeConnected(0) and entity.getInboundNodeLevel(0) then
    output(true)
    fill()
  else
    output(false)
  end
end
