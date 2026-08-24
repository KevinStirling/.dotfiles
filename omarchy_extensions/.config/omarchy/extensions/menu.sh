show_screenrecord_menu() {
  omarchy-capture-screenrecording --stop-recording && exit 0

case $(menu "Screenrecord" "  With no audio\n  With desktop audio\n  With desktop + microphone audio\n  With desktop + microphone audio + webcam") in
  *"With no audio") omarchy-capture-screenrecording ;;
  *"With desktop audio") omarchy-capture-screenrecording --with-desktop-audio ;;
  *"With desktop + microphone audio") omarchy-capture-screenrecording --with-desktop-audio --with-microphone-audio ;;
  *"With desktop + microphone audio + webcam")
    local device=$(show_webcam_select_menu) || {
      back_to show_capture_menu
      return
    }
    omarchy-capture-screenrecording --with-desktop-audio --with-microphone-audio --with-webcam --webcam-device="$device"
    ;;
  *) back_to show_capture_menu ;;
  esac
}
