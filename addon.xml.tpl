<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<addon id="plugin.video.xbmctorrent" name="XBMCtorrent" version="$VERSION" provider-name="steeve, nightik">
    <requires>
        <import addon="xbmc.python" version="2.1.0"/>
    </requires>
    <extension point="xbmc.python.pluginsource" library="addon.py">
        <provides>video</provides>
    </extension>
    <extension point="xbmc.addon.repository" name="XBMCtorrent (RU) Autoupdate Repository">
        <info compressed="false">https://afedchin-repo.herokuapp.com/addons.xml</info>
        <checksum>https://afedchin-repo.herokuapp.com/addons.xml.md5</checksum>
        <datadir zip="true">https://afedchin-repo.herokuapp.com/</datadir>
    </extension>
    <extension point="xbmc.addon.metadata">
        <platform>all</platform>
        <source><![CDATA[https://github.com/steeve/xbmctorrent]]></source>
        <language></language>
        <license><![CDATA[GNU GENERAL PUBLIC LICENSE. Version 3, 29 June 2007]]></license>
        <summary><![CDATA[XBMCtorrent: Torrent streaming for Kodi.]]></summary>
        <description><![CDATA[Watch torrents directly from Kodi, without waiting.]]></description>
    </extension>
</addon>
