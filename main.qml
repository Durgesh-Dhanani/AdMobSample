import QtQuick 2.1
import QtQuick.Window 2.1
import VPlay.plugins.admob 1.0

Window {
  visible: true
  width: 360
  height: 360

  // Demo license key, only applicable for this project
  property string admobKey: "1802219D9DB5B476BA12870EB3692921CF8F51009303CD091C54CAE8FB7526676A24EFC0930449D202C4F71B521EB7EBBFFB388539A557EB6E02E0E8B0C4AD0E94A1FF80B56F577E4CFA9785CA3B97359A0646B65AD510425377A94FD104A7E6ACDC1471E926D421987CDCB7B22CE43857D39D948AD94D8A7AA8D064594D167F2C1ED80450248E441E231BED59E19782988A68BE40DEA9510D2EC40E82DF4804"

  AdMobBanner {
    id: banner1
    licenseKey: admobKey

    adUnitId: "<your-adunit-id>"
    testDeviceIds: [ ]

    // See http://plugins.v-play.net/doc/vplay-plugins-admobbanner/#banner-prop for all types of available banners
    banner: AdMobBanner.Smart

    // The banner gets anchored on the bottom of the screen
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.bottom: parent.bottom
  }

  AdMobInterstitial {
    licenseKey: admobKey

    id: interstitial
    adUnitId: "<your-adunit-id>"
    testDeviceIds:  [ ]

    onInterstitialReceived: {
      console.debug("Interstitial loaded")
      showInterstitialIfLoaded()
    }

    onInterstitialFailedToReceive: {
      console.debug("Interstitial not loaded")
    }
  }

  Text {
    text: qsTr("Open Interstitial Ad")
    anchors.centerIn: parent

    MouseArea {
      anchors.fill: parent
      onClicked: {
        interstitial.loadInterstitial()
      }
    }
  }
}
