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
  end
end

function update(dt)
  if entity.isInboundNodeConnected(0) and entity.getInboundNodeLevel(0) then
    output(true)
    -- entity.setAllOutboundNodes(true)
  else
    output(false)
    -- entity.setAllOutboundNodes(false)
  end
end
