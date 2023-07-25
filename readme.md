# Garmin CIQ Page Indicator（Native-like）

Core code:

```js

public function draw(dc as Dc, selectedIndex as Number) as Void {
    var height = 20;
    for (var i = 0; i < _size; i++) {
        if (i == selectedIndex) {
        dc.setColor(_selectedColor, Graphics.COLOR_TRANSPARENT);
        } else {
        dc.setColor(_notSelectedColor, Graphics.COLOR_TRANSPARENT);
        }
        //b is the distance between dot's centers to the center of the round screen
        var b = dc.getWidth() / 2 - height;

        //round page indicator
        //3.14 is the initial radian
        //0.2 is the increasing radian between two page indicators
        var x_i = b * Math.cos(3.14 - (i - 1) * 0.2) + dc.getWidth() / 2;
        var y_i = b * Math.sin(3.14 - (i - 1) * 0.2) + dc.getWidth() / 2;
        dc.fillCircle(x_i, y_i, height / 2);
    }
}
```

[Preivew](./preview-page-indicator.png)

Have fun~

## Credit:

- The sample project Primates by Garmin
