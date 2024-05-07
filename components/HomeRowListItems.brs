' Find the nodes used in Home programs row list
sub Init()
    m.homeGamesCardPoster = m.top.findNode("homeGamesCardPoster")
    m.homeGamesCardWhiteRectangle = m.top.findNode("homeGamesCardWhiteRectangle")
end sub

' Changed the item content on focus move
sub itemContentChanged()
    m.homeGamesCardPoster.uri = m.top.itemContent.HDPOSTERURL
    m.homeGamesCardWhiteRectangle.visible = true
    m.homeGamesCardPoster.visible = true
end sub

' Changed the item focus
sub listFocusChanged()
    if m.top.rowListHasFocus = false
    end if
end sub

' Changed the item opacity according to the focus
sub onFocusPercentChanged()
    if m.top.rowListHasFocus = true and m.top.focusPercent = 1 and type(m.top.itemContent) <> "roInvalid"

    else

    end if
end sub

' Changed the row opacity according to the focus
sub onRowFocusPercentChanged()
    if m.top.rowFocusPercent <> 1
    end if
end sub