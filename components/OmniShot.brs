sub init()
    m.homeBoard = m.top.findNode("homeBoard")
    m.homeBoard.setFocus(true)
    m.gameBoard = m.top.findNode("gameBoard")
    m.backButton = m.top.findNode("backButton")
    m.gameBg = m.top.findNode("gameBg")
    m.cannonPoster = m.top.findNode("cannonPoster")
    m.levelTimerPosterLabel = m.top.findNode("levelTimerPosterLabel")
    m.cannonRotateTimer = m.top.findNode("cannonRotateTimer")
    m.cannonRotateTimer.observeField("fire","cannonRotation")
    m.cannonTimerStopFlag = 0
    m.bulletMovingTimer = m.top.findNode("bulletMovingTimer")
    m.bulletMovingTimer.observeField("fire","onBulletTimerStatus")
    m.bulletAnimation = m.top.findNode("bulletAnimation")
    m.cannonPosterPage = m.top.findNode("cannonPosterPage")
    m.popUpNextLevelPage = m.top.findNode("popUpNextLevelPage")
    m.popUpNextLevelPoster = m.top.findNode("popUpNextLevelPoster")
    m.nextLevelPoster = m.top.findNode("nextLevelPoster")
    m.quitPoster = m.top.findNode("quitPoster")
   ' m.popUpNextLevelPage.setFocus(true)
    m.lifeLabel = m.top.findNode("lifeLabel")
    m.gameOverPopUpPage = m.top.findNode("gameOverPopUpPage")
    m.playAgainPoster = m.top.findNode("playAgainPoster")
    m.quitPosterGameOver = m.top.findNode("quitPosterGameOver")
    m.levelPosterLabel = m.top.findNode("levelPosterLabel")
    m.scoreLabel = m.top.findNode("scoreLabel")
    m.transparentScreenPage = m.top.findNode("transparentScreenPage")
    m.scoreNextLevelLabel = m.top.findNode("scoreNextLevelLabel")
    m.scoreGameOverLabel = m.top.findNode("scoreGameOverLabel")
    m.showPoints = m.top.findNode("showPoints")

    m.showPointsTimer = createObject("roSGNode", "Timer")
    m.showPointsTimer.duration = "0.01"
    m.showPointsTimer.repeat = true
    m.showPointsTimer.observeField("fire","showPointsOnScreenTime")

    'Audio variables
    m.backgroundMusic = m.top.findNode("backgroundMusic")
    audioContent = createObject("roSGNode","contentNode")
    audioContent.url = "pkg:/sounds/BgSound.mp3"
    m.backgroundMusic.loop = true
    m.backgroundMusic.control = "prebuffer"
    m.backgroundMusic.content = audioContent
    m.top.appendChild(m.backgroundMusic)

    m.sound = m.top.findNode("gameSounds")

    'levels related variables
    m.levelObject = createLevels()
    m.currentLevel = 1
    m.maxLevel = 1

    m.cannonDirection = 0
    m.currentX=565
    m.currentY=285

    ' bullet related variables
    m.bulletCount = 0
    m.bulletPosterboard = []

    m.enemyCount = 1
    m.enemyStorageArray = []

    m.playerLife = 5
    m.totalTime = 20
    m.score=0
    m.levelCount=1

    m.itemBlastRemoveTimer = CreateObject("roSGNode","Timer")
    m.itemBlastRemoveTimer.repeat = false
    m.itemBlastRemoveTimer.duration = 0.2
    m.itemBlastRemoveTimer.observeField("fire","itemDisappearance")

    m.showPointsRemoveTimer = CreateObject("roSGNode","Timer")
    m.showPointsRemoveTimer.repeat = false
    m.showPointsRemoveTimer.duration = 1
    m.showPointsRemoveTimer.observeField("fire","showPointsDisappearance")

    ' For rowlist
    m.gamesRowScreen = m.top.findNode("gamesRowScreen")
    m.homeGamesRowScreen = m.top.findNode("homeGamesRowScreen")
    m.homeGamesRowList = m.homeGamesRowScreen.findNode("homeGamesRowList")
    m.gamesRowScreen.visible = true
    m.homeGamesRowList.visible = true
    m.homeGamesRowList.setFocus(true)

    m.gamesFocusPoster = m.top.findNode("gamesFocusPoster")
    m.tudip_logo = m.top.findNode("tudip_logo")
    m.gameTitleLabel = m.top.findNode("gameTitleLabel")
    m.gameDescriptionLabel = m.top.findNode("gameDescriptionLabel")
    m.aboutgameStatsScreen = m.top.findNode("aboutgameStatsScreen")
    m.gameVersion = m.top.findNode("gameVersion")
    m.aboutButton = m.top.findNode("aboutButton")
    m.copyRightFirstText = m.top.findNode("copyRightFirstText")
    m.copyRightSecondText = m.top.findNode("copyRightSecondText")
    m.privacyAndPolicy= m.top.findNode("privacyAndPolicy")
    m.aboutUsText = m.top.findNode("aboutUsText")
    m.popUpBackGround = m.top.findNode("popUpBackGround")
    m.gameTimerLabel = m.top.findNode("gameTimerLabel")

    m.tudip_logo = m.top.findNode("tudip_logo")
    m.gameTitleLabel = m.top.findNode("gameTitleLabel")
    m.gameDescriptionLabel = m.top.findNode("gameDescriptionLabel")
    m.aboutButton = m.top.findNode("aboutButton")
    createGamesCard()

    m.DemoLabel = m.top.findNode("DemoLabel")
    m.DemoQuitLabel = m.top.findNode("DemoQuitLabel")
    ' for quit game label
    m.QuitGame = m.top.findNode("QuitGame")
    m.QYesLabel = m.top.findNode("QYesLabel")
    m.QNoLabel = m.top.findNode("QNoLabel")
    m.QuitMsg = m.top.findNode("QuitMsg")
    m.QYesLabel.font.uri="pkg:/fonts/rockwell-bold.ttf"
    m.QNoLabel.font.uri="pkg:/fonts/rockwell-bold.ttf"
    m.QuitRect = m.top.findNode("QuitRect")
    m.QYes = m.top.findNode("QYes")
    m.QNo = m.top.findNode("QNo")
end sub

function showPointsOnScreenTime()
    m.showPoints.visible = true
    m.showPointsTimer.control = "stop"
    m.showPointsRemoveTimer.control = "start"
end function

function showPointsDisappearance()
    m.showPoints.visible = false
end function

' quit game
function Quit_confirm() as void
    m.QuitGame.visible = true
    m.QuitGame.setFocus(true)
    m.QuitMsg.text = "Leaving so soon ?"
    m.QuitMsg.font.size=30
    m.QuitMsg.font.uri="pkg:/fonts/rockwell-bold.ttf"
    m.QuitMsg.translation = "[530,290]"
    m.QuitMsg.color = &hFFFFFFFF
    m.QYes.opacity = 1
    m.QNo.opacity = 0.5
end function

function onKeyEvent(key as String, press as boolean) as boolean
    if (m.gamesRowScreen.visible = true AND m.aboutgameStatsScreen.visible = false AND m.homeGamesRowScreen.visible = true AND m.homeGamesRowList.visible = true AND press = true)
        if (key = "back" AND press = true)
            m.transparentScreenPage.visible = true
            m.gamesRowScreen.setFocus(false)
            m.homeGamesRowScreen.setFocus(false)
            m.homeGamesRowList.setFocus(false)
            Quit_confirm()
        end if
    end if
    if (m.QuitGame.visible = true AND m.QuitGame.hasFocus()= true)
        if(key = "OK" AND press = true )
            m.transparentScreenPage.visible = false
            if (m.QYes.opacity =1)
                m.DemoQuitLabel.color = m.global.red
            else if (m.QNo.opacity = 1)
                m.QuitGame.visible = false
                m.QuitGame.setFocus(false)
                m.gamesRowScreen.visible = true
                m.homeGamesRowScreen.visible = true
                m.homeGamesRowList.visible = true
                m.gamesRowScreen.setFocus(true)
                m.homeGamesRowScreen.setFocus(true)
                m.homeGamesRowList.setFocus(true)
            end if
        else if(key = "right" AND press = true)
            if(m.QYes.opacity = 1)
                m.QYes.opacity = 0.5
                m.QNo.opacity = 1
            end if
        else if(key = "left" AND press = true)
            if(m.QNo.opacity = 1)
                m.QYes.opacity = 1
                m.QNo.opacity = 0.5
            end if
        end if
    end if
    if (key = "options" AND m.homeGamesRowList.visible = true AND m.QuitGame.visible = false)
        m.homeGamesRowList.setFocus(false)
        m.aboutgameStatsScreen.visible = true
        m.aboutgameStatsScreen.setFocus(true)
        m.gameVersion.text = "Version: 1.0.0"
        m.copyRightFirstText.text = "Copyright"
        m.copyRightSecondText.text = "2024 by Tudip Technologies."
        m.privacyAndPolicy.text = "Privacy Policy - www.tudip.com/privacy-policy"
        m.aboutUsText.text = "Contact Us: info@tudip.com"
        return true
    end if
    if (press = false)
        if (key = "right" or key = "left")
            m.cannonTimerStopFlag = 0
        end if
    end if
    if(m.homeBoard.hasFocus()=true and press=true) then
        if (key = "OK")
            m.homeBoard.visible = false
            m.homeBoard.setFocus(false)
            m.gameBoard.visible = true
            m.gameBoard.setFocus(true)
            resetUI()
            createGameboard()
        else if (key = "back")
            m.backgroundMusic.control = "stop"
            m.homeBoard.visible = false
            m.homeBoard.setFocus(false)
            m.gamesRowScreen.visible = true
            m.gamesRowScreen.setFocus(true)
            m.homeGamesRowScreen.visible = true
            m.homeGamesRowList.visible = true
            m.homeGamesRowList.setFocus(true)
        end if
    else if (m.gameBoard.hasFocus() = true and press= true)
        if(key = "back")
            m.cannonRotateTimer.control = "stop"
            moveToHomeboard()
        else if (key = "OK")
            m.bulletAnimationValue = 1
            bulletShoot()
        else if (key = "left" AND press = true)
            m.keyPress = "left"
            m.cannonTimerStopFlag = 1
        else if (key = "right" AND press = true)
            m.keyPress = "right"
            m.cannonTimerStopFlag = 1
        end if
    else if(m.popUpNextLevelPage.hasFocus()=true AND press = true)
        if(key = "right")
            m.quitPoster.opacity = 1
            m.nextLevelPoster.opacity = 0.5
        else if (key = "left")
            m.nextLevelPoster.opacity = 1
            m.quitPoster.opacity = 0.5
        else if (key = "OK")
            m.cannonPoster.rotation = 0
            m.cannonPoster.height = 150
            m.cannonPoster.width = 150
            m.cannonPoster.translation = "[565,285]"
            m.backgroundMusic.control = "play"
            if (m.nextLevelPoster.opacity = 1)
                resetScore()
                m.levelCount+=1
                m.popUpNextLevelPage.setFocus(false)
                m.gameBoard.setFocus(true)
                m.popUpNextLevelPage.visible = false
                m.enemyStorageArray.clear()
                m.playerLife = 5
                m.totalTime += 10
                createGameBoard()
                'levelNumber()
            else if (m.quitPoster.opacity = 1)
                resetScore()
                m.popUpNextLevelPage.setFocus(false)
                m.homeBoard.setFocus(true)
                m.popUpNextLevelPage.visible = false
                m.cannonPosterPage.visible = false
                m.homeBoard.visible = true
                m.gameBoard.visible = false
                stopTimer()
                resetUI()
                m.enemyStorageArray.clear()
                m.playerLife = 5
            end if
        end if
    else if(m.gameOverPopUpPage.hasFocus()=true AND press = true)
        if(key = "right")
            m.quitPosterGameOver.opacity = 1
            m.playAgainPoster.opacity = 0.5
        else if (key = "left")
            m.playAgainPoster.opacity = 1
            m.quitPosterGameOver.opacity = 0.5
        else if (key = "OK")
            m.backgroundMusic.control = "play"
            if (m.playAgainPoster.opacity = 1)
                resetScore()
                m.totalTime=20
                m.gameOverPopUpPage.setFocus(false)
                m.gameBoard.setFocus(true)
                m.gameOverPopUpPage.visible = false
                m.cannonPosterPage.visible = false
                m.enemyStorageArray.clear()
                m.playerLife = 5
                createGameBoard()
                resetUI()
            else if (m.quitPosterGameOver.opacity = 1)
                resetScore()
                m.gameOverPopUpPage.setFocus(false)
                m.homeBoard.setFocus(true)
                m.homeBoard.visible = true
                m.gameOverPopUpPage.visible = false
                m.cannonPosterPage.visible = false
                m.gameBoard.visible = false
                m.enemyStorageArray.clear()
                stopTimer()
                resetUI()
                m.playerLife = 5
            end if
        end if
    else if(m.aboutgameStatsScreen.visible = true AND press = true)
        if (key = "back")
            m.aboutgameStatsScreen.visible = false
            m.gamesRowScreen.visible = true
            m.homeGamesRowList.visible = true
            m.homeGamesRowList.setFocus(true)
        end if
    end if
    return true
end function

' cannon rotate function
function cannonRotation()
    rotationAngle=m.cannonPoster.rotation
    if m.cannonTimerStopFlag = 1
        if m.keyPress = "left"
            if (m.cannonPoster.uri = "pkg:/images/cannon.png")
                m.cannonPoster.height = 180
                m.cannonPoster.width = 180
                m.cannonPoster.translation = "[540,260]"
                m.cannonPoster.uri = "pkg:/images/cannon8.png"
            else if ( m.cannonPoster.uri = "pkg:/images/cannon8.png")
                m.cannonPoster.height = 150
                m.cannonPoster.width = 150
                m.cannonPoster.translation = "[565,285]"
                m.cannonPoster.uri = "pkg:/images/cannon7.png"
            else if ( m.cannonPoster.uri = "pkg:/images/cannon7.png")
                m.cannonPoster.height = 210
                m.cannonPoster.width = 210
                m.cannonPoster.translation = "[490,265]"
                m.cannonPoster.uri = "pkg:/images/cannon6.png"
            else if ( m.cannonPoster.uri = "pkg:/images/cannon6.png")
                m.cannonPoster.height = 150
                m.cannonPoster.width = 150
                m.cannonPoster.translation = "[565,285]"
                m.cannonPoster.uri = "pkg:/images/cannon5.png"
            else if ( m.cannonPoster.uri = "pkg:/images/cannon5.png")
                m.cannonPoster.height = 210
                m.cannonPoster.width = 210
                m.cannonPoster.translation = "[585,265]"
                m.cannonPoster.uri = "pkg:/images/cannon4.png"
            else if ( m.cannonPoster.uri = "pkg:/images/cannon4.png")
                m.cannonPoster.height = 150
                m.cannonPoster.width = 150
                m.cannonPoster.translation = "[565,285]"
                m.cannonPoster.uri = "pkg:/images/cannon3.png"
            else if ( m.cannonPoster.uri = "pkg:/images/cannon3.png")
                m.cannonPoster.height = 210
                m.cannonPoster.width = 210
                m.cannonPoster.translation = "[580,260]"
                m.cannonPoster.uri = "pkg:/images/cannon2.png"
            else if ( m.cannonPoster.uri = "pkg:/images/cannon2.png")
                m.cannonPoster.height = 150
                m.cannonPoster.width = 150
                m.cannonPoster.translation = "[565,285]"
                m.cannonPoster.uri = "pkg:/images/cannon.png"
            end if
        else if m.keyPress = "right"
            if (m.cannonPoster.uri = "pkg:/images/cannon.png")
                m.cannonPoster.height = 210
                m.cannonPoster.width = 210
                m.cannonPoster.translation = "[580,260]"
                m.cannonPoster.uri = "pkg:/images/cannon2.png"
            else if ( m.cannonPoster.uri = "pkg:/images/cannon2.png")
                m.cannonPoster.height = 150
                m.cannonPoster.width = 150
                m.cannonPoster.translation = "[565,285]"
                m.cannonPoster.uri = "pkg:/images/cannon3.png"
            else if ( m.cannonPoster.uri = "pkg:/images/cannon3.png")
                m.cannonPoster.height = 210
                m.cannonPoster.width = 210
                m.cannonPoster.translation = "[585,265]"
                m.cannonPoster.uri = "pkg:/images/cannon4.png"
            else if ( m.cannonPoster.uri = "pkg:/images/cannon4.png")
                m.cannonPoster.height = 150
                m.cannonPoster.width = 150
                m.cannonPoster.translation = "[565,285]"
                m.cannonPoster.uri = "pkg:/images/cannon5.png"
            else if ( m.cannonPoster.uri = "pkg:/images/cannon5.png")
                m.cannonPoster.height = 210
                m.cannonPoster.width = 210
                m.cannonPoster.translation = "[490,265]"
                m.cannonPoster.uri = "pkg:/images/cannon6.png"
            else if ( m.cannonPoster.uri = "pkg:/images/cannon6.png")
                m.cannonPoster.height = 150
                m.cannonPoster.width = 150
                m.cannonPoster.translation = "[565,285]"
                m.cannonPoster.uri = "pkg:/images/cannon7.png"
            else if ( m.cannonPoster.uri = "pkg:/images/cannon7.png")
                m.cannonPoster.height = 180
                m.cannonPoster.width = 180
                m.cannonPoster.translation = "[540,260]"
                m.cannonPoster.uri = "pkg:/images/cannon8.png"
            else if ( m.cannonPoster.uri = "pkg:/images/cannon8.png")
                m.cannonPoster.height = 150
                m.cannonPoster.width = 150
                m.cannonPoster.translation = "[565,285]"
                m.cannonPoster.uri = "pkg:/images/cannon.png"
            end if
        end if
    end if
end function

function createLevels()
    levels=[
        {
            "time":30,
            "cannon":"pkg:/images/cannon.png",
            "background":"pkg:/images/gameBoardBg.png",
            "enemy":"pkg:/images/enemy.png",
            "playerLife":5
        }
    ]
    return levels
end function

function bulletShoot()
   ' m.backgroundMusic.control = "pause"
    playSound(2)

    canonCenterX=m.cannonPoster.translation[0]+60
    canonCenterY=m.cannonPoster.translation[1]+90
    ' creating bullet
    m.bulletPoster = CreateObject("roSGNode","Poster")
    m.bulletPoster.uri="pkg:/images/bullet.png"
    m.bulletPoster.id = "mode2BulletPoster" + m.bulletCount.toStr()
    m.bulletPoster.width = "35"
    m.bulletPoster.height = "39"
    m.gameBoard.appendChild(m.bulletPoster)
    ' adding animation on bullet
    bulletAnimation = CreateObject("roSGNode", "Animation")
    bulletAnimation.id = "bulletAnimation" + m.bulletCount.toStr()
    bulletAnimation.easeFunction = "linear"
    bulletAnimation.duration = 1.5
    bulletAnimation.repeat = false
    ' adding interpolator
    bulletVectorNode = CreateObject("roSGNode","Vector2DFieldInterpolator")
    bulletVectorNode.id = "bulletVector" + m.bulletCount.toStr()
    bulletVectorNode.key=[0,1]
    bulletVectorNode.fieldToInterp = m.bulletPoster.id +".translation"
    bulletAnimation.appendChild(bulletVectorNode)
    ' adding in game board
    m.gameBoard.appendChild(bulletAnimation)

    if (m.cannonPoster.uri = "pkg:/images/cannon.png")
            bulletVectorNode.keyValue =[[canonCenterX,canonCenterY-10],[canonCenterX,canonCenterY-800]]
            bulletAnimation.control="start"
        else if (m.cannonPoster.uri = "pkg:/images/cannon2.png")
            m.bulletPoster.rotation = -0.7854
            bulletVectorNode.keyValue =[[canonCenterX+30,canonCenterY+9],[canonCenterX+800,canonCenterY-800]]
            bulletAnimation.control="start"
        else if (m.cannonPoster.uri = "pkg:/images/cannon3.png" )
            m.bulletPoster.rotation = -1.5708
            bulletVectorNode.keyValue =[[canonCenterX+20,canonCenterY-32],[canonCenterX+800,canonCenterY]]
            bulletAnimation.control="start"
        else if (m.cannonPoster.uri = "pkg:/images/cannon4.png")
            m.bulletPoster.rotation = -2.3562
            bulletVectorNode.keyValue =[[canonCenterX+55,canonCenterY+4],[canonCenterX+800,canonCenterY+800]]
            bulletAnimation.control="start"
        else if (m.cannonPoster.uri = "pkg:/images/cannon5.png")
            m.bulletPoster.rotation = -3.1416
            bulletVectorNode.keyValue =[[canonCenterX+30,canonCenterY+8],[canonCenterX,canonCenterY+800]]
            bulletAnimation.control="start"
        else if (m.cannonPoster.uri = "pkg:/images/cannon6.png")
            m.bulletPoster.rotation = -3.927
            bulletVectorNode.keyValue =[[canonCenterX+10,canonCenterY+70],[canonCenterX-800,canonCenterY+800]]
            bulletAnimation.control="start"
        else if (m.cannonPoster.uri = "pkg:/images/cannon7.png")
            m.bulletPoster.rotation = -4.7124
            bulletVectorNode.keyValue =[[canonCenterX-5,canonCenterY],[canonCenterX-800,canonCenterY]]
            bulletAnimation.control="start"
        else if (m.cannonPoster.uri = "pkg:/images/cannon8.png")
            m.bulletPoster.rotation = -5.4978
            bulletVectorNode.keyValue =[[canonCenterX,canonCenterY-4],[canonCenterX-800,canonCenterY-800]]
            bulletAnimation.control="start"
        end if

    m.bulletPosterboard.push(m.bulletPoster)
    m.bulletCount++
end function

sub enemyCannonCollision()
    x = m.cannonPoster.translation[0]
    y = m.cannonPoster.translation[1]
    if(m.enemyPoster <> Invalid)
        for each item in m.enemyStorageArray
            xEnemy = item.translation[0]
            yEnemy = item.translation[1]
            if(x <= (xEnemy+m.enemyPoster.width) AND (x+m.cannonPoster.width) >= xEnemy)
                if(y <= (yEnemy+m.enemyPoster.height) AND (y+m.cannonPoster.height)>= yEnemy)
                   if (item.visible = true)
                        playSound(6)
                        m.playerLife-=1
                        m.lifeLabel.text = m.playerLife
                    end if
                   item.visible = false
                   m.enemyStorageArray.shift()

                    'show popUp After no life remaining
                    if (m.playerLife<1)
                        m.scoreGameOverLabel.text = "Score : "+m.score.toStr()
                        m.bulletPosterboard.clear()
                        playSound(3)
                        m.gameBoard.opacity = 0.5
                        m.enemyCannonTimer.control = "stop"
                        m.enemyPoster.visible = false
                        stopTimer()
                        for each item in m.enemyStorageArray
                            m.gameBoard.removeChild(item)
                        end for
                        m.enemyStorageArray.clear()
                        m.gameBoard.setFocus(false)
                        m.gameOverPopUpPage.setFocus(true)
                        m.gameOverPopUpPage.visible = true
                    end if
                end if
            end if
        end for
    end if
end sub

function itemDisappearance()
    if(m.itemBlast.uri = "pkg:/images/blast.png")
        m.itemBlast.visible = false
    end if
end function

sub enemyBulletCollision()
    if(m.bulletPoster <> Invalid)
        for each bulletItem in m.bulletPosterboard
            x = bulletItem.translation[0]
            y = bulletItem.translation[1]
            if(m.enemyPoster <> Invalid)
                for each item in m.enemyStorageArray
                    xEnemy = item.translation[0]
                    yEnemy = item.translation[1]
                    if(x <= (xEnemy+m.enemyPoster.width) AND (x+m.bulletPoster.width) >= xEnemy)
                        if(y <= (yEnemy+m.enemyPoster.height) AND (y+m.bulletPoster.height)>= yEnemy)
                            if(bulletItem.visible=true AND item.visible = true)
                                playSound(5)
                                m.itemBlast = item
                                if(item.uri = "pkg:/images/enemy.png")
                                    m.score += m.dummyScoreVariable1
                                    m.scoreLabel.text = "Score : "+m.score.toStr()
                                    m.showPoints.text = "+20"
                                    m.showPointsTimer.control = "start"
                                else if(item.uri = "pkg:/images/enemy2.png")
                                    m.score += m.dummyScoreVariable2
                                    m.scoreLabel.text = "Score : "+m.score.toStr()
                                    m.showPoints.text = "+20"
                                    m.showPointsTimer.control = "start"
                                else if(item.uri = "pkg:/images/enemy3.png")
                                    m.score += m.dummyScoreVariable3
                                    m.scoreLabel.text = "Score : "+m.score.toStr()
                                    m.showPoints.text = "+30"
                                    m.showPointsTimer.control = "start"
                                else if(item.uri = "pkg:/images/enemy4.png")
                                    m.score += m.dummyScoreVariable4
                                    m.scoreLabel.text = "Score : "+m.score.toStr()
                                    m.showPoints.text = "+10"
                                    m.showPointsTimer.control = "start"
                                end if
                                item.uri = "pkg:/images/blast.png"
                                m.itemBlastRemoveTimer.control="start"
                                bulletItem.visible = false
                            end if
                        end if
                    end if
                end for
            end if
        end for
    end if
end sub

function resetScore()
    m.score=0
    m.scoreLabel.text = "Score: 0"
    m.dummyScoreVariable=0
end function

function createGameboard()
    m.gameBoard.opacity = 1

    m.cannonPosterPage.visible = true
    m.cannonPoster.visible = true

    m.level = m.levelObject[m.currentLevel-1]

    m.levelPosterLabel.text = "Level "+m.levelCount.toStr()

    m.backButton.uri = "pkg:/images/back.png"

    ' setting background
    m.gameBg.uri = m.level.background

    ' setting cannon
    m.cannonPoster.uri = m.level.cannon
    m.cannonPoster.scaleRotateCenter=[70,90]

    'starting cannon timer
    m.cannonRotateTimer.control = "start"

    'player Life
    m.lifeLabel.text = m.playerLife

    'adding timer node for game duration
    parseTimeFromLevelDS()
    m.gameTimer=createObject("roSGNode","Timer")
    m.gameTimer.repeat=true
    m.gameTimer.duration=1
    m.gameTimer.observeField("fire","updateGameTimerText")
    m.levelTimerPosterLabel.text=m.gameTimeString
    m.gameTimer.control="start"

    m.enemyGenerateTimer = CreateObject("roSGNode","Timer")
    m.enemyGenerateTimer.repeat = true
    m.enemyGenerateTimer.duration = 2
    m.enemyGenerateTimer.observeField("fire","rndENemyGeneration")
    m.enemyGenerateTimer.control="start"

    m.enemyCannonTimer = CreateObject("roSGNode","Timer")
    m.enemyCannonTimer.repeat = true
    m.enemyCannonTimer.duration = 0.001
    m.enemyCannonTimer.observeField("fire","enemyCannonCollision")
    m.enemyCannonTimer.control="start"

    m.enemyBulletTimer = CreateObject("roSGNode","Timer")
    m.enemyBulletTimer.repeat = true
    m.enemyBulletTimer.duration = 0.001
    m.enemyBulletTimer.observeField("fire","enemyBulletCollision")
    m.enemyBulletTimer.control="start"
end function

' generate random enemies
sub rndEnemyGeneration()
    m.randomTranslation = ["", "[600, -30]", "[-30,320]", "[1310, 321]", "[599,750]","[200,-30]","[200,750]","[1000,750]"]
    m.randomDifferentEnemies = ["","pkg:/images/enemy.png","pkg:/images/enemy2.png","pkg:/images/enemy3.png","pkg:/images/enemy4.png"]

    collectDifferentEnemies = m.randomDifferentEnemies[RND(4)]
    m.enemyPoster = CreateObject("roSGNode", "Poster")
    m.enemyPoster.id = "enemy"+m.enemyCount.toStr()
    m.enemyPoster.height = 80
    m.enemyPoster.width = 80
    'setting enemy
    m.enemyPoster.uri = collectDifferentEnemies

    if(m.enemyPoster.uri="pkg:/images/enemy.png") m.dummyScoreVariable1= 20
    if(m.enemyPoster.uri="pkg:/images/enemy2.png") m.dummyScoreVariable2 = 20
    if(m.enemyPoster.uri="pkg:/images/enemy3.png") m.dummyScoreVariable3= 30
    if(m.enemyPoster.uri="pkg:/images/enemy4.png") m.dummyScoreVariable4 = 10
    m.enemyPoster.translation = m.randomTranslation[rnd(7)]
    m.gameBoard.appendChild(m.enemyPoster)

    ' adding animation on enemy
    enemyPosterAnimation = CreateObject("roSGNode", "Animation")
    enemyPosterAnimation.id = "enemyAnimation" + m.EnemyCount.toStr()
    enemyPosterAnimation.easeFunction = "linear"
    enemyPosterAnimation.duration = 5
    enemyPosterAnimation.repeat = false

    ' adding interpolator
    enemyVectorNode = CreateObject("roSGNode","Vector2DFieldInterpolator")
    enemyVectorNode.id = "enemyVector" + m.enemyCount.toStr()
    enemyVectorNode.key=[0,1]
    enemyVectorNode.fieldToInterp = m.enemyPoster.id +".translation"
    enemyPosterAnimation.appendChild(enemyVectorNode)

    ' adding in game board
    m.gameBoard.appendChild(enemyPosterAnimation)

    m.enemyStorageArray.push(m.enemyPoster)

    x = m.enemyPoster.translation[0]
    y = m.enemyPoster.translation[1]

    enemyX=m.enemyPoster.translation[0]
    enemyY=m.enemyPoster.translation[1]
    if(x = 600)
        'top center
        enemyVectorNode.keyValue =[[enemyX,enemyY],[enemyX,enemyY+300]]
        enemyPosterAnimation.control="start"
    else if(y = 320)
        'left center
        enemyVectorNode.keyValue =[[enemyX,enemyY],[enemyX+600,enemyY]]
        enemyPosterAnimation.control="start"
    else if(y = 321)
        'rght center
        enemyVectorNode.keyValue =[[enemyX,enemyY],[enemyX-700,enemyY]]
        enemyPosterAnimation.control="start"
    else if(x = 599)
        'bottom center
        enemyVectorNode.keyValue =[[enemyX,enemyY],[enemyX,enemyY-550]]
        enemyPosterAnimation.control="start"
    else if(x=200)
        'top left
        enemyVectorNode.keyValue =[[enemyX,enemyY],[enemyX+400,enemyY+300]]
        enemyPosterAnimation.control="start"
    else if(x=1000)
        ' bottom right
        enemyVectorNode.keyValue =[[enemyX+60,enemyY],[enemyX-650,enemyY-590]]
        enemyPosterAnimation.control="start"
    end if

    m.enemyCount+=1
end sub

function stopTimer()
    m.gameTimer.control="stop"
    m.enemyGenerateTimer.control="stop"
end function

function moveToHomeboard()
    for each item in m.enemyStorageArray
        m.gameBoard.removeChild(item)
    end for
    m.enemyStorageArray.clear()
    stopTimer()
    m.gameBoard.visible = false
    m.gameBoard.setFocus(false)
    m.homeBoard.visible = true
    m.homeBoard.setFocus(true)
    m.cannonPoster.visible = false
    resetUI()
end function

'reseting UI
function resetUI()
    m.levelCount=1
    m.levelPosterLabel.text = "Level "+m.levelCount.toStr()
    m.score = 0
    m.scoreLabel.text = "Score : "+m.score.toStr()
    m.playerLife = 5
    m.lifeLabel.text = m.playerLife
    m.totalTime=20
    m.cannonPoster.rotation = 0
    m.cannonPoster.height = 150
    m.cannonPoster.width = 150
    m.cannonPoster.translation = "[565,285]"
end function

function levelCompletePopUp()
    m.scoreNextLevelLabel.text = "Score : "+m.score.toStr()
    m.bulletPosterboard.clear()
    m.gameBoard.opacity = 0.5
    m.popUpNextLevelPage.setFocus(true)
    m.gameBoard.setFocus(false)
    m.enemyPoster.visible = false
    for each item in m.enemyStorageArray
        m.gameBoard.removeChild(item)
    end for
    m.enemyStorageArray.clear()
    playSound(4)
    stopTimer()
    m.popUpNextLevelPage.visible = true
end function

function parseTimeFromLevelDS() as Void
    m.timerMinutes=m.totaltime/60
    m.timerMinutes=fix(m.timerMinutes)
    m.timerSeconds=m.totalTime mod 60
    if (len(m.timerMinutes.toStr())=1) m.gameTimeString="0"
        m.gameTimeString+=m.timerMinutes.toStr()
        m.gameTimeString+=":"
    if (len(m.timerSeconds.toStr())=1) m.gameTimeString+="0"
    m.gameTimeString+=m.timerSeconds.toStr()
end function

function updateGameTimerText() as Void
    timeString=""
    m.timerSeconds--
    if (m.timerMinutes=0 and m.timerSeconds=0)
        m.levelTimerPosterLabel.text="00:00"
        m.gameTimer.control="stop"

        ' code to show popUp
        levelCompletePopUp()
    return
    else
    if(m.timerSeconds=0 or m.timerSeconds=-1)
        m.timerSeconds=59
        m.timerMinutes--
    end if
    if (len(m.timerMinutes.toStr())=1) timeString="0"
        timeString+=m.timerMinutes.toStr()
        timeString+=":"
    if (len(m.timerSeconds.toStr())=1) timeString+="0"
        timeString+=m.timerSeconds.toStr()
        m.levelTimerPosterLabel.text=timeString
    end if
end function

' play the required sound
function playSound(soundNum as integer)
    if(soundNum = 1)
        m.backgroundMusic.control = "play"
    else if (soundNum = 2)
        m.sound.uri = "pkg:/sounds/cannonFireSound.wav"
        m.sound.control = "play"
    else if (soundNum = 3)
        m.sound.uri = "pkg:/sounds/gameOverSound.wav"
        m.sound.control = "play"
    else if (soundNum = 4)
        m.sound.uri = "pkg:/sounds/levelClearSound.wav"
        m.sound.control = "play"
    else if (soundNum = 5)
        m.sound.uri = "pkg:/sounds/bulletHit.wav"
        m.sound.control = "play"
    else if (soundNum = 6)
        m.sound.uri = "pkg:/sounds/life.wav"
        m.sound.control = "play"
    end if
end function