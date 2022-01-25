sub init()
    m.top.functionName = "getContent"
End sub

sub getContent()
    rowListDataContent = createObject("RoSGNode","ContentNode")
    rowListDataContentxml = createObject("roXMLElement")

    rowListRowContentNode1 = CreateObject("RoSGNode","ContentNode")
    rowListRowContentNode2  = createObject("RoSGNode","ContentNode")
    rowListRowContentNode3  = createObject("RoSGNode","ContentNode")
    rowListRowContentNode4  = createObject("RoSGNode","ContentNode")
    rowListRowContentNode5  = createObject("RoSGNode","ContentNode")

    readInternet = createObject("roUrlTransfer")
    readInternet.setUrl(m.top.contentUrl)
    readInternet.SetCertificatesFile("common:/certs/ca-bundle.crt")
    readInternet.InitClientCertificates()

    rowListDataArray = ParseJson(readInternet.GetToString())

    for each channel in rowListDataArray.channels
        itemContentNode  = createObject("RoSGNode","itemContentNode")
        itemContentNode.title = channel.title
        itemContentNode.parentalRating = channel.parentalRating
        itemContentNode.year = channel.year
        itemContentNode.length = channel.length
        itemContentNode.posterUrl = channel.posterUrl
        itemContentNode.description = channel.description
        itemContentNode.director = channel.director
        itemContentNode.bacgroundImageUrl = channel.bacgroundImageUrl
        itemContentNode.url = channel.url
        itemContentNode.cast = channel.cast
        itemContentNode.genres = channel.genres
        itemContentNode.streamFormat = channel.streamformat

        if channel.categoryid = 1 then 
            rowListRowContentNode1.appendChild(itemContentNode)
        else if channel.categoryid = 2 then
            rowListRowContentNode3.appendChild(itemContentNode)
        else if channel.categoryid = 3 then
            rowListRowContentNode2.appendChild(itemContentNode)
        else if channel.categoryid = 4 then
            rowListRowContentNode4.appendChild(itemContentNode)
        else
            rowListRowContentNode5.appendChild(itemContentNode)
        end if

    end for

    rowListRowContentNode1.title = rowListDataArray.categories[0].name
    rowListRowContentNode2.title = rowListDataArray.categories[1].name
    rowListRowContentNode3.title = rowListDataArray.categories[2].name
    rowListRowContentNode4.title = rowListDataArray.categories[3].name
    rowListRowContentNode5.title = rowListDataArray.categories[4].name

    rowListDataContent.appendChild(rowListRowContentNode1)
    rowListDataContent.appendChild(rowListRowContentNode2)
    rowListDataContent.appendChild(rowListRowContentNode3)
    rowListDataContent.appendChild(rowListRowContentNode4)
    rowListDataContent.appendChild(rowListRowContentNode5)

    m.top.rowListDataContent = rowListDataContent

  end sub
