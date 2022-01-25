sub init()
    m.top.setFocus(true)
    print "VideoComponent - init()"
    print m.top.hasFocus()

    m.controlButtonGroup = m.top.findNode("controlButtonGroup")
    m.myVideo = m.top.findNode("myVideo")
    createContentNodeForMyVideo()
    m.controlButtonGroup.observeField("buttonSelected", "onButtonSelected")
    
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    if key = "back" and press then
        m.controlButtonGroup.setFocus(true)
        return true
    end if
    
    return false 
end function

sub onButtonSelected(event)
    selected = event.getData()
    if selected = 0 then
        m.myVideo.setFocus(true)
        if m.myVideo.state <> "playing" then
            m.myVideo.control = "play"
        end if
    else if selected = 1 then
        m.myVideo.setFocus(true)
        if m.myVideo.state <> "playing" then
            m.myVideo.control = "play"
        end if
        m.controlButtonGroup.visible = false
        m.myVideo.width = 1920
        m.myVideo.height = 1080
        m.myVideo.translation = [0, 0]
    end if
end sub

sub createContentNodeForMyVideo()
    contentNode = createObject("roSGNode", "ContentNode")
    contentNode.url = "https://roku.s.cpl.delvenetworks.com/media/59021fabe3b645968e382ac726cd6c7b/60b4a471ffb74809beb2f7d5a15b3193/roku_ep_111_segment_1_final-cc_mix_033015-a7ec8a288c4bcec001c118181c668de321108861.m3u8"
    contentNode.streamFormat = "hls"
    contentNode.title = "Random video"
    m.myVideo.content = contentNode
end sub