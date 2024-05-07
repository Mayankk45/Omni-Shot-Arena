sub Main()
    print "in showChannelSGScreen"
    'Indicate this is a Roku SceneGraph application'
    screen = CreateObject("roSGScreen")
    m.port = CreateObject("roMessagePort")
    screen.setMessagePort(m.port)

    ' parsing description file
    JString = ReadAsciiFile("pkg:/local/text.json")
    local = ParseJSON(JString)

    'creating global node
    m.global = screen.getGlobalNode()
    m.global.id = "GLobalNode"
    m.global.addFields({
        local:local, red: &hFF0000FF,
        yellow: &hFFFF00FF,
        green: &h008000FF,
        pink: &hFFC0CBFF,
        blue: &h0000FFFF,
        orange: &hFFA500FF,
        purple: &h8F00FFFF,
        brown: &h964B00FF,
        grey: &h808080FF,
        skin: &hc58c85FF,
        maroon: &h800000FF,
        navyblue: &h000080FF,
        gold: &hFFD700FF
        silver: &hC0C0C0FF,
        bronze: &hb08d57FF,
        platinum: &hE5E4E2FF})

    'Create a scene and load /components/helloworld.xml'
    scene = screen.CreateScene("OmniShotArena")
    scene.signalBeacon("AppLaunchComplete")
    screen.show()

    m.DemoQuitLabel = scene.findNode("DemoQuitLabel")
    m.DemoQuitLabel.ObserveField("color", m.port)

    while(true)
        msg = wait(0, m.port)
        msgType = type(msg)
        if msgType = "roSGScreenEvent"
            if msg.isScreenClosed() then return
        else if(msgType = "roSGNodeEvent")
            if (msg.GetField() = "color")
                if m.DemoQuitLabel.color = m.global.red
                    screen.Close()
                else if m.DemoQuitLabel.color = m.global.yellow
                    print "current color = ",str(m.DemoQuitLabel.color)
                    appManager = CreateObject("roAppManager")
                    appManager.ShowChannelStoreSpringboard("761120")
                else if m.DemoQuitLabel.color = m.global.green
                    appManager = CreateObject("roAppManager")
                    appManager.ShowChannelStoreSpringboard("761066")
                else if m.DemoQuitLabel.color = m.global.pink
                    appManager = CreateObject("roAppManager")
                    appManager.ShowChannelStoreSpringboard("761169")
                else if m.DemoQuitLabel.color = m.global.blue
                    appManager = CreateObject("roAppManager")
                    appManager.ShowChannelStoreSpringboard("752398")
                else if m.DemoQuitLabel.color = m.global.purple
                    appManager = CreateObject("roAppManager")
                    appManager.ShowChannelStoreSpringboard("752429")
                else if m.DemoQuitLabel.color = m.global.brown
                    appManager = CreateObject("roAppManager")
                    appManager.ShowChannelStoreSpringboard("752500")
                else if m.DemoQuitLabel.color = m.global.grey
                    appManager = CreateObject("roAppManager")
                    appManager.ShowChannelStoreSpringboard("752226")
                else if m.DemoQuitLabel.color = m.global.skin
                    appManager = CreateObject("roAppManager")
                    appManager.ShowChannelStoreSpringboard("749173")
                else if m.DemoQuitLabel.color = m.global.maroon
                    appManager = CreateObject("roAppManager")
                    appManager.ShowChannelStoreSpringboard("208144")
                else if m.DemoQuitLabel.color = m.global.navyblue
                    appManager = CreateObject("roAppManager")
                    appManager.ShowChannelStoreSpringboard("282571")
                else if m.DemoQuitLabel.color = m.global.gold
                    appManager = CreateObject("roAppManager")
                    appManager.ShowChannelStoreSpringboard("245206")
                else if m.DemoQuitLabel.color = m.global.silver
                    appManager = CreateObject("roAppManager")
                    appManager.ShowChannelStoreSpringboard("228252")
                else if m.DemoQuitLabel.color = m.global.bronze
                    appManager = CreateObject("roAppManager")
                    appManager.ShowChannelStoreSpringboard("557356")
                else if m.DemoQuitLabel.color = m.global.platinum
                    appManager = CreateObject("roAppManager")
                    appManager.ShowChannelStoreSpringboard("742370")
                end if
            end if
        end if
        if msgType = "roInputEvent"
            if msg.IsInput()
                info = msg.GetInfo()
                if info.DoesExist("mediaType") and info.DoesExist("contentID")
                    mediaType = info.mediaType
                    contentId = info.contentID
                end if
            end if
        end if
    end while
end sub


