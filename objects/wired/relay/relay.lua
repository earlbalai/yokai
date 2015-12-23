function init()
  if storage.state == nil then
    output(false)
  else
    output(storage.state)
  end
end

function output(state)
  if state ~= storage.state then
    storage.state = state
    entity.setAllOutboundNodes(state)
    if state then
      entity.setAnimationState("relayState", "on")
    else
      entity.setAnimationState("relayState", "off")
    end
  end
end

function update(dt)
  if entity.isInboundNodeConnected(0) and entity.getInboundNodeLevel(0) then
    output(true)
  else
    output(false)
  end
end
