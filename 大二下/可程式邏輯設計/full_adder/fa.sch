<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="xc9500" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1" />
        <signal name="sum" />
        <signal name="XLXN_4" />
        <signal name="XLXN_5" />
        <signal name="cin" />
        <signal name="a" />
        <signal name="b" />
        <signal name="cout" />
        <port polarity="Output" name="sum" />
        <port polarity="Input" name="cin" />
        <port polarity="Input" name="a" />
        <port polarity="Input" name="b" />
        <port polarity="Output" name="cout" />
        <blockdef name="ha">
            <timestamp>2024-3-12T5:54:35</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="or2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="192" ey="-96" sx="112" sy="-48" r="88" cx="116" cy="-136" />
            <arc ex="48" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <line x2="48" y1="-144" y2="-144" x1="112" />
            <arc ex="112" ey="-144" sx="192" sy="-96" r="88" cx="116" cy="-56" />
            <line x2="48" y1="-48" y2="-48" x1="112" />
        </blockdef>
        <block symbolname="ha" name="XLXI_1">
            <blockpin signalname="a" name="a" />
            <blockpin signalname="b" name="b" />
            <blockpin signalname="XLXN_1" name="sum" />
            <blockpin signalname="XLXN_5" name="carry" />
        </block>
        <block symbolname="ha" name="XLXI_2">
            <blockpin signalname="XLXN_1" name="a" />
            <blockpin signalname="cin" name="b" />
            <blockpin signalname="sum" name="sum" />
            <blockpin signalname="XLXN_4" name="carry" />
        </block>
        <block symbolname="or2" name="XLXI_3">
            <blockpin signalname="XLXN_5" name="I0" />
            <blockpin signalname="XLXN_4" name="I1" />
            <blockpin signalname="cout" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="960" y="1376" name="XLXI_1" orien="R0">
        </instance>
        <instance x="1600" y="1376" name="XLXI_2" orien="R0">
        </instance>
        <instance x="2080" y="1728" name="XLXI_3" orien="R0" />
        <branch name="XLXN_1">
            <wire x2="1600" y1="1280" y2="1280" x1="1344" />
        </branch>
        <branch name="sum">
            <wire x2="2160" y1="1280" y2="1280" x1="1984" />
        </branch>
        <branch name="XLXN_4">
            <wire x2="2032" y1="1344" y2="1344" x1="1984" />
            <wire x2="2032" y1="1344" y2="1600" x1="2032" />
            <wire x2="2080" y1="1600" y2="1600" x1="2032" />
        </branch>
        <branch name="XLXN_5">
            <wire x2="1440" y1="1344" y2="1344" x1="1344" />
            <wire x2="1440" y1="1344" y2="1664" x1="1440" />
            <wire x2="2080" y1="1664" y2="1664" x1="1440" />
        </branch>
        <branch name="cin">
            <wire x2="1520" y1="1520" y2="1520" x1="960" />
            <wire x2="1600" y1="1344" y2="1344" x1="1520" />
            <wire x2="1520" y1="1344" y2="1520" x1="1520" />
        </branch>
        <branch name="a">
            <wire x2="960" y1="1280" y2="1280" x1="928" />
        </branch>
        <iomarker fontsize="28" x="928" y="1280" name="a" orien="R180" />
        <branch name="b">
            <wire x2="960" y1="1344" y2="1344" x1="928" />
        </branch>
        <iomarker fontsize="28" x="928" y="1344" name="b" orien="R180" />
        <iomarker fontsize="28" x="960" y="1520" name="cin" orien="R180" />
        <iomarker fontsize="28" x="2160" y="1280" name="sum" orien="R0" />
        <branch name="cout">
            <wire x2="2368" y1="1632" y2="1632" x1="2336" />
        </branch>
        <iomarker fontsize="28" x="2368" y="1632" name="cout" orien="R0" />
    </sheet>
</drawing>