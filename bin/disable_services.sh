#!/usr/bin/env bash

# https://gist.github.com/pwnsdx/1217727ca57de2dd2a372afdd7a0fc21

# ps -ax 
# 420

# view disabled services
# launchctl print-disabled system

# see above note about unintended consequences
# 399	0	com.apple.bird      
# 1085	0	com.apple.speech.speechsynthesisd.x86_64
# -	0	com.apple.speech.synthesisserver
# -	0	com.apple.speech.speechdatainstallerd
# -	0	com.apple.speech.speechsynthesisd.arm64

services+=' com.apple.SafariHistoryServiceAgent'     # Safari
services+=' com.apple.progressd'                     # ClassKit related (classroom things)
services+=' com.apple.cloudphotod'                   # iCloud
services+=' com.apple.homed'                         # Home Services
services+=' com.apple.parentalcontrols.check'        # Parental Controls
services+=' com.apple.amp.mediasharingd'             # Media Platform
services+=' com.apple.familycontrols.useragent'      # Parental Controls
services+=' com.apple.diagnosticextensionsd'         
services+=' com.apple.ContactsAgent'                 # Contacts
services+=' com.apple.SafariBookmarksSyncAgent'      # Safari
services+=' com.apple.screensharing.agent'           # Screen Sharing
services+=' com.apple.commerce'                      
services+=' com.apple.TMHelperAgent.SetupOffer'      # Time Machine
services+=' com.apple.AddressBook.SourceSync'        # Address Book
services+=' com.apple.familynotificationd'           # Parental Controls
services+=' com.apple.photolibraryd'                 # Photo Library
services+=' com.apple.assistant_service'             # Siri 
services+=' com.apple.touristd'                      # First time instructions
services+=' com.apple.CommCenter'                    # Communications?
services+=' com.apple.MailServiceAgent'              # iMail
services+=' com.apple.DataDetectorsLocalSources'     # No idea
services+=' com.apple.Safari.PasswordBreachAgent'            # Safari
services+=' com.apple.AOSPushRelay'                          # Apple Online Store/iTunes 
services+=' com.apple.AOSHeartbeat'                          # Apple Online Store/iTunes 
services+=' com.apple.accessibility.AXVisualSupportAgent'    # Accessibility
services+=' com.apple.screensharing.menuextra'               # Screen Sharing
services+=' com.apple.AddressBook.ContactsAccountsService'   # Address Book
services+=' com.apple.Safari.SafeBrowsing.Service'           # Safari
services+=' com.apple.findmymacmessenger'                    # Find My Mac
services+=' com.apple.ScreenTimeAgent'                       # Lol
services+=' com.apple.cloudd'                                # iCloud
services+=' com.apple.UserNotificationCenterAgent'           # Notifications
services+=' com.apple.dt.CommandLineTools.installondemand'   # What?
services+=' com.apple.appleseed.seedusaged'                  # Feedback Assistant
services+=' com.apple.ap.adprivacyd'                         # Advertising
services+=' com.apple.ap.promotedcontentd'                   # Advertising
services+=' com.apple.PhotoLibraryMigrationUtility.XPC'      # PhotoLibrary
services+=' com.apple.AMPLibraryAgent'                       # Media Platform
services+=' com.apple.tonelibraryd'                          # Call Tones
services+=' com.apple.CloudPhotosConfiguration'              # iCloud
services+=' com.apple.contacts.donation-agent'               # Huh?
services+=' com.apple.nexusd'                                # Interaction between AppleTV and HomePod
services+=' com.apple.replayd'                               # in-app capture, recording, broadcast via ReplayKit
services+=' com.apple.icloud.searchpartyuseragent'           # iCloud
services+=' com.apple.CallHistoryPluginHelper'               # Something calling related
services+=' com.apple.AddressBook.AssistantService'          # Address Book
services+=' com.apple.mbfloagent'                            # First-run Setup Assistant
services+=' com.apple.ssinvitationagent'                     # Screen-Sharing (maybe via Messages?)
services+=' com.apple.webinspectord'                         # Safari
services+=' com.valvesoftware.steamclean'                    # Steam 
services+=' com.apple.WebKit.PluginAgent'                    # Safari
services+=' com.apple.DiagnosticReportCleanup.plist'         # Diagnostics Cleanup (I'll do it manually)
services+=' com.apple.SafariNotificationAgent'               # Safari
services+=' com.apple.remindd'                               # Reminders
services+=' com.apple.siri-distributed-evaluation'           # Siri
services+=' com.apple.siri.context.service'                  # Siri
services+=' com.apple.AMPDeviceDiscoveryAgent'               # Apple Media Platform
services+=' com.apple.accessibility.dfrhud'                  # Accessibility
services+=' com.apple.CallHistorySyncHelper'                 # Call history
services+=' com.apple.parsecd'                               # Siri
services+=' com.apple.parsec-fbf'                            # Siri
services+=' com.apple.security.cloudkeychainproxy3'          # iCloud
services+=' com.apple.telephonyutilities.callservicesd'      # Call Services
services+=' com.apple.cloudpaird'                            # iCloud
services+=' com.apple.SafariCloudHistoryPushAgent'           # Safari
services+=' com.apple.rapportd'                              # Apple Device Handoff
services+=' com.apple.installandsetup.migrationhelper.user'  # Migrate User information
services+=' com.apple.routined'                              # Learns historical location patterns of user, kill it with fire
services+=' com.adobe.ARMDCHelper.cc24aef4a1b90ed56a725c38014c95072f92651fb65e1bf9c8e43c37a23d420d'  # Dunno why adobe would need to run a service
services+=' com.apple.videosubscriptionsd'                   # AppleTV
services+=' com.apple.protectedcloudstorage.protectedcloudkeysyncing'    # More iCloud
services+=' com.apple.imcore.imtransferagent'                # iMessages
services+=' com.apple.ckdiscretionaryd'                      # More iCloud
services+=' com.apple.CalendarAgent'                         # iCalendar
services+=' com.apple.RapportUIAgent'                        # Network devices
services+=' com.apple.siriknowledged'                        # Siri
services+=' com.apple.sharingd'                              # AirDrop, HandOff, etc
services+=' com.apple.iCloudUserNotificationsd'              # iCloud
services+=' com.oracle.java.Java-Updater'                    # Java Updater
services+=' com.apple.familycircled'                         # iCloud maybe
services+=' com.apple.AMPArtworkAgent'                       # Artwork for iTunes, etc
services+=' com.apple.imagent'                               # iMessages
services+=' com.apple.sidecar-relay'                         # ipad as a secondary monitor
services+=' com.apple.photoanalysisd'                        # Memories/People in Photo Library
services+=' com.apple.imautomatichistorydeletionagent'       # iMessages
services+=' com.apple.RemoteDesktop.agent'                   # Remote Desktop
services+=' com.apple.icloud.fmfd'                           # iCloud
services+=' com.apple.iCloudNotificationAgent'               # iCloud
services+=' com.apple.studentd'                              # Classroom
services+=' com.apple.VoiceOver'                             # Accessibility
services+=' com.apple.suggestd'                              # Siri/News Personalization
services+=' com.apple.navd'                                  # Calendar notify when to leave for appointments
services+=' com.apple.amsaccountsd'                          # Apple Media Services
services+=' com.apple.assistantd'                            # Siri
services+=' com.apple.FollowUpUI'                            # FollowUp
services+=' com.apple.mediaanalysisd'                        # VideoProcessing?
services+=' com.apple.assessmentagent'                       # Classroom
services+=' com.apple.exchange.exchangesyncd'                # Address Book
services+=' com.apple.UsageTrackingAgent'                    # Screen time
services+=' com.apple.email.maild'                           # Mail
services+=' com.apple.Maps.mapspushd'                        # Maps
services+=' com.apple.voicememod'                            # Accessibility
services+=' com.apple.gamed'                                 # Games
services+=' com.apple.knowledge-agent'                       # Siri
services+=' com.apple.mobiledeviceupdater'                   # Mobile devices
services+=' com.apple.helpd'                                 # Useless Help
services+=' com.apple.screensharing.MessagesAgent'           # iMessages
services+=' com.apple.passd'                                 # Apple Pay
services+=' com.apple.DictationIM'                           # Don't need this
services+=' com.apple.iCloudHelper'                          # iCloud
services+=' com.apple.sidecar-display-agent'                 # Sidecar
services+=' com.apple.accessibility.heard'                   # Accessibility
services+=' com.apple.corespeechd'                           # Spoken Commands
services+=' com.apple.AMPSystemPlayerAgent'                  # Media Platform
services+=' com.apple.itunescloudd'                          # iTunes
services+=' com.apple.icloud.findmydeviced.findmydevice-user-agent'  # Find My Device
services+=' com.apple.scrod'                                     # Screen Reader Output
services+=' com.apple.ap.adservicesd'                        # Advertising
services+=' com.apple.amsengagementd'                        # Apple Media Services
services+=' com.apple.AirPortBaseStationAgent'               # Airport
services+=' com.apple.proactiveeventtrackerd'                # Siri
services+=' com.apple.accessibility.MotionTrackingAgent'     # Motion Tracking
services+=' com.apple.SafariLaunchAgent'                     # Safari
services+=' com.apple.recentsd'                              # Mail/Messages recents
services+=' com.apple.usernoted'                             # Notification Center
services+=' com.apple.SafariPlugInUpdateNotifier'            # Safari
services+=' com.apple.AddressBook.abd'                       # Address Book
services+=' com.apple.ScreenReaderUIServer'                  # Accessibility
services+=' com.apple.newsd'                                 # NewsDaemon
services+=' com.apple.AirPlayUIAgent'                        # AirPlay
services+=' com.apple.TMHelperAgent'                         # TimeMachine
services+=' com.apple.AMPDevicesAgent'                       # Media Platform
services+=' com.apple.SpeechRecognitionCore.brokerd'         # Speech recognition
services+=' com.apple.accessibility.mediaaccessibilityd'     # Media accessibility
services+=' com.apple.AirPlayXPCHelper'                      # AirPlay
services+=' com.apple.coreservices.useractivityd'            # Advertising

for S in $services; do
    sudo launchctl disable "system/$S"
    sudo launchctl disable "gui/501/$S"
    sudo launchctl disable "user/501/$S"
done
