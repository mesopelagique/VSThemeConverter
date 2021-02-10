# VSThemeConverter
[![language][code-shield]][code-url]
[![language-top][code-top]][code-url]
![code-size][code-size]
[![release][release-shield]][release-url]
[![license][license-shield]][license-url]
[![discord][discord-shield]][discord-url]

Convert Visual Studio Code theme to 4D theme

## How to launch a convertion

### Theme installed in yout vs code app

Launch the `YourVsTheme` form to select or convert all

or launch `FromVsCodeInstalled`

### Theme on github

Launch `GitURLRequest`. A prompt will ask you to paste the url.

> A git clone will be done in your temp directory, a conversion will be done, then temp directory is cleaned

### Theme on file system

Put the theme in [Resources/vs](Resources/vs) (you could git clone, unzip copy paste etc.. inside)

Then run `CParti` method.

The result will be installed directly into your 4d theme folder

## Customize behaviour

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

## Limitations

- color with alpha (RGBA) : alpha component is removed

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
