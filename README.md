# VSThemeConverter

Convert Visual Studio Code theme to 4D theme

## How to

Put the theme in [Resources/vs](Resources/vs)

Then run `CParti` method.

The result will be installed directly into your 4d theme folder

## Customize

### Fix missing keys

Not all are converted correctly so you could edit convert code

The mapping of vs code keys and 4d keys are defined in `to4DTheme` in class [VSTheme](Project/Sources/Classes/VSTheme.4dm)

### Force a font

You could edit default font name by editing DefaultTheme method to defined your `fontName` and `fontSize`
```4d
$themeObject.fontSize:=18
$themeObject.fontName:="Fire Code"
```

