# VSThemeConverter
[![language][code-shield]][code-url]
[![language-top][code-top]][code-url]
![code-size][code-size]
[![release][release-shield]][release-url]
[![license][license-shield]][license-url]
[![discord][discord-shield]][discord-url]

Convert Visual Studio Code theme to 4D theme.

## How to

Open the database on macOS and select the themes you want to convert

![Screenshot](https://github.com/mesopelagique/VSThemeConverter/raw/gh-pages/Screenshot.png)

Then the converted themse will be put in the default 4d theme folder automatically. Just go to 4D setting to select the wanted one.

## Customize behaviours

### Fix missing keys

Not all are converted correctly so you could edit convert code

The mapping of vs code keys and 4d keys are defined in file [mapping.json](Resources/mapping.json)

### Force a font

By default it take the font used by your current theme

You could edit default font name by editing DefaultTheme method to defined your `fontName` and `fontSize`

```4d
$themeObject.fontSize:=18
$themeObject.fontName:="Fira Code"
```

or you could change all theme font using [SetFontToAllTheme](Project/Sources/Methods/SetFontToAllTheme.4dm)

## Limitations

- color with alpha (RGBA) : alpha component is removed
- some vs code theme have comments inside JSON, not all are removed #1

## Other components

[<img src="https://mesopelagique.github.io/quatred.png" alt="mesopelagique"/>](https://mesopelagique.github.io/)

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[code-shield]: https://img.shields.io/static/v1?label=language&message=4d&color=blue
[code-top]: https://img.shields.io/github/languages/top/mesopelagique/VSThemeConverter.svg
[code-size]: https://img.shields.io/github/languages/code-size/mesopelagique/VSThemeConverter.svg
[code-url]: https://developer.4d.com/
[release-shield]: https://img.shields.io/github/v/release/mesopelagique/VSThemeConverter
[release-url]: https://github.com/mesopelagique/VSThemeConverter/releases/latest
[license-shield]: https://img.shields.io/github/license/mesopelagique/VSThemeConverter
[license-url]: LICENSE.md
[discord-shield]: https://img.shields.io/badge/chat-discord-7289DA?logo=discord&style=flat
[discord-url]: https://discord.gg/dVTqZHr
