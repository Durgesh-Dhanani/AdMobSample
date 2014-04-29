import QtQuick 2.1
import QtQuick.Window 2.1
import VPlay.plugins.admob 1.0

Window {
  visible: true
  // The Window is set to fullscreen on mobile devices
  // NOTE: the AdMob plugin cannot be used on Desktop, but only on iOS & Android
  width: 360
  height: 360

  // Demo license key, only applicable for this project
  // To use ads in your own apps, purchase an Admob license here: http://plugins.v-play.net/plugins/admob/
  property string admobKey: "1802219D9DB5B476BA12870EB3692921CF8F51009303CD091C54CAE8FB7526676A24EFC0930449D202C4F71B521EB7EBBFFB388539A557EB6E02E0E8B0C4AD0E94A1FF80B56F577E4CFA9785CA3B97359A0646B65AD510425377A94FD104A7E6ACDC1471E926D421987CDCB7B22CE43857D39D948AD94D8A7AA8D064594D167F2C1ED80450248E441E231BED59E19782988A68BE40DEA9510D2EC40E82DF4804"

  AdMobBanner {
    licenseKey: admobKey

    // Add your own adUnitId here - this one is owned by V-Play and just for demo purposes
    // If you do not have an AdMob account yet, you can create a new one at http://www.google.com/ads/admob/
    adUnitId: "ca-app-pub-9155324456588158/9913032020"
    // Enter your testDeviceIds here, so your adUnitId does not get blocked by Google
    testDeviceIds: [ ]

    // See http://plugins.v-play.net/doc/vplay-plugins-admobbanner/#banner-prop for all types of available banners
    banner: AdMobBanner.Smart

    // The banner gets anchored on the bottom of the screen
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.bottom: parent.bottom
  }

  AdMobInterstitial {
    id: interstitial

    licenseKey: admobKey
    adUnitId: "ca-app-pub-9155324456588158/9075427220"
    testDeviceIds:  [ ]

    onInterstitialReceived: {
      console.debug("Interstitial loaded")
      showInterstitialIfLoaded()
    }

    onInterstitialFailedToReceive: {
      console.debug("Interstitial not loaded")
    }
  }

  // Open an Interstitial by clicking anywhere on the Screen
  Text {
    text: qsTr("Open Interstitial Ad")
    anchors.centerIn: parent
  }
  MouseArea {
    anchors.fill: parent
    onClicked: {
      interstitial.loadInterstitial()
    }
  }

}
