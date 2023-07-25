//
// Copyright 2015-2021 by Garmin Ltd. or its subsidiaries.
// Subject to Garmin SDK License Agreement and Wearables
// Application Developer Agreement.
//

import Toybox.Graphics;
import Toybox.Lang;

//! Draws a graphic indicating which page the user is currently on
class PageIndicator {
  private var _size as Number;
  private var _selectedColor as ColorType;
  private var _notSelectedColor as ColorType;
  private var _margin as Number;

  //! Constructor
  //! @param size Number of pages
  //! @param selectedColor Color to use for the selected page
  //! @param notSelectedColor Color to use for non-selected pages
  //! @param alignment How to align the graphic
  //! @param margin Amount of margin for the graphic
  public function initialize(
    size as Number,
    selectedColor as ColorValue,
    notSelectedColor as ColorValue,
    margin as Number
  ) {
    _size = size;
    _selectedColor = selectedColor;
    _notSelectedColor = notSelectedColor;
    _margin = margin;
  }

  //! Draw the graphic
  //! @param dc Device context
  //! @param selectedIndex The index of the current page
  public function draw(dc as Dc, selectedIndex as Number) as Void {
    var height = 20;
    for (var i = 0; i < _size; i++) {
      if (i == selectedIndex) {
        dc.setColor(_selectedColor, Graphics.COLOR_TRANSPARENT);
      } else {
        dc.setColor(_notSelectedColor, Graphics.COLOR_TRANSPARENT);
      }
      var b = dc.getWidth() / 2 - height;

      //round page indicator
      var x_i = b * Math.cos(3.14 - (i - 1) * 0.2) + dc.getWidth() / 2;
      var y_i = b * Math.sin(3.14 - (i - 1) * 0.2) + dc.getWidth() / 2;
      dc.fillCircle(x_i, y_i, height / 2);
    }
  }
}
