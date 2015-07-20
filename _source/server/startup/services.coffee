
if Apollos.services.find().count() is 0

  Apollos.services.insert
    name: "screen-printing"
    label: "Screen printing"
    description: "Cras mattis consectetur purus sit amet fermentum. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Donec ullamcorper nulla non metus auctor fringilla."
    colors:
      primary: "#ea6045"
      secondary: "#3f5666"
      tertiary: "#2f3440"
    quote:
      name: "apparel"
      label: "Apparel"
      action: "Choose Apparel Type"
      modifier: "volume"


  Apollos.services.insert
    name: "letter-press"
    label: "Letter press"
    description: "Cras mattis consectetur purus sit amet fermentum. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Donec ullamcorper nulla non metus auctor fringilla."
    colors:
      primary: "#e5901a"
      secondary: "#4b3b4b"
      tertiary: "#2f3440"
    quote:
      name: "letterpress"
      label: "Letter Press"
      action: "Choose Print Type"
      modifier: "volume"


  Apollos.services.insert
    name: "custom-printing"
    label: "Custom Printing"
    description: "Cras mattis consectetur purus sit amet fermentum. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Donec ullamcorper nulla non metus auctor fringilla."
    colors:
      primary: "#4b3b4b"
      secondary: "#e5901a"
      tertiary: "#2f3440"
    quote:
      name: "custom printing"
      label: "Custom Printing"
      action: "Choose Paper Type"
      modifier: "size"
