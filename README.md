# SwitchKeyboardLayout

Console app to switch keyboard layout in OS X.

## enable_desktop_keyboard_layout.sh

~~~
#!/bin/sh

ROOT_PATH=$(cd `dirname "$0"` && pwd)

$ROOT_PATH/SwitchKeyboardLayout enable org.unknown.keylayout.Русская-BG46
$ROOT_PATH/SwitchKeyboardLayout disable com.apple.keylayout.Russian
~~~

## enable_notebook_keyboard_layout.sh

~~~
#!/bin/sh

ROOT_PATH=$(cd `dirname "$0"` && pwd)

$ROOT_PATH/SwitchKeyboardLayout enable com.apple.keylayout.Russian
$ROOT_PATH/SwitchKeyboardLayout disable org.unknown.keylayout.Русская-BG46
~~~