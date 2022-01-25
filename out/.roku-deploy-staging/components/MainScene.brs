' ********** Copyright 2016 Roku Corp.  All Rights Reserved. **********  

sub init()
    m.top.SetFocus(true)
    appInfo = CreateObject("roAppInfo")

    m.getDataTask = createObject("roSGNode", "GetDataTask")
    m.getDataTask.contentUrl = "https://api.npoint.io/b096a65d709fbe682348"
    m.getDataTask.observeField("rowListDataContent", "onContentReady")
    m.getDataTask.control = "RUN"
    
    m.rowlist = m.top.findNode("exampleRowList")    

End sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    result = false
    
    return result 
end function

sub onContentReady(event)
    print event.getData()
     m.rowlist.content = m.getDataTask.rowListDataContent
End sub
