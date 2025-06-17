<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="xc9500" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="B" />
        <signal name="XLXN_3" />
        <signal name="x" />
        <signal name="XLXN_5" />
        <signal name="A" />
        <signal name="XLXN_8" />
        <signal name="XLXN_9" />
        <signal name="XLXN_10" />
        <signal name="clk" />
        <signal name="XLXN_12" />
        <signal name="Z" />
        <port polarity="Input" name="x" />
        <port polarity="Input" name="clk" />
        <port polarity="Output" name="Z" />
        <blockdef name="fd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <rect width="256" x="64" y="-320" height="256" />
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
        <blockdef name="and2b1">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-48" y2="-144" x1="64" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="40" y1="-64" y2="-64" x1="0" />
            <circle r="12" cx="52" cy="-64" />
        </blockdef>
        <blockdef name="and3b1">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="40" y1="-64" y2="-64" x1="0" />
            <circle r="12" cx="52" cy="-64" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="192" y1="-128" y2="-128" x1="256" />
            <line x2="64" y1="-64" y2="-192" x1="64" />
            <arc ex="144" ey="-176" sx="144" sy="-80" r="48" cx="144" cy="-128" />
            <line x2="64" y1="-80" y2="-80" x1="144" />
            <line x2="144" y1="-176" y2="-176" x1="64" />
        </blockdef>
        <blockdef name="and2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-144" x1="64" />
        </blockdef>
        <block symbolname="fd" name="XLXI_1">
            <blockpin signalname="clk" name="C" />
            <blockpin signalname="XLXN_8" name="D" />
            <blockpin signalname="A" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_3">
            <blockpin signalname="clk" name="C" />
            <blockpin signalname="x" name="D" />
            <blockpin signalname="B" name="Q" />
        </block>
        <block symbolname="or2" name="XLXI_4">
            <blockpin signalname="XLXN_10" name="I0" />
            <blockpin signalname="XLXN_9" name="I1" />
            <blockpin signalname="XLXN_8" name="O" />
        </block>
        <block symbolname="and2b1" name="XLXI_5">
            <blockpin signalname="x" name="I0" />
            <blockpin signalname="B" name="I1" />
            <blockpin signalname="XLXN_9" name="O" />
        </block>
        <block symbolname="and3b1" name="XLXI_6">
            <blockpin signalname="B" name="I0" />
            <blockpin signalname="A" name="I1" />
            <blockpin signalname="x" name="I2" />
            <blockpin signalname="XLXN_10" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_7">
            <blockpin signalname="B" name="I0" />
            <blockpin signalname="A" name="I1" />
            <blockpin signalname="Z" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1040" y="1856" name="XLXI_1" orien="R0" />
        <instance x="1040" y="2256" name="XLXI_3" orien="R0" />
        <instance x="624" y="1696" name="XLXI_4" orien="R0" />
        <instance x="320" y="1664" name="XLXI_5" orien="R0" />
        <instance x="320" y="1872" name="XLXI_6" orien="R0" />
        <branch name="B">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="160" y="1536" type="branch" />
            <wire x2="240" y1="1536" y2="1536" x1="160" />
            <wire x2="320" y1="1536" y2="1536" x1="240" />
        </branch>
        <branch name="x">
            <wire x2="240" y1="1600" y2="1600" x1="160" />
            <wire x2="320" y1="1600" y2="1600" x1="240" />
            <wire x2="240" y1="1600" y2="1680" x1="240" />
            <wire x2="320" y1="1680" y2="1680" x1="240" />
            <wire x2="240" y1="1680" y2="2000" x1="240" />
            <wire x2="1040" y1="2000" y2="2000" x1="240" />
        </branch>
        <branch name="A">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="160" y="1744" type="branch" />
            <wire x2="320" y1="1744" y2="1744" x1="160" />
        </branch>
        <branch name="XLXN_8">
            <wire x2="1040" y1="1600" y2="1600" x1="880" />
        </branch>
        <branch name="XLXN_9">
            <wire x2="624" y1="1568" y2="1568" x1="576" />
        </branch>
        <branch name="XLXN_10">
            <wire x2="592" y1="1744" y2="1744" x1="576" />
            <wire x2="592" y1="1632" y2="1744" x1="592" />
            <wire x2="624" y1="1632" y2="1632" x1="592" />
        </branch>
        <branch name="clk">
            <wire x2="960" y1="2128" y2="2128" x1="880" />
            <wire x2="1040" y1="2128" y2="2128" x1="960" />
            <wire x2="1040" y1="1728" y2="1728" x1="960" />
            <wire x2="960" y1="1728" y2="2128" x1="960" />
        </branch>
        <instance x="1520" y="1888" name="XLXI_7" orien="R0" />
        <branch name="A">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1472" y="1760" type="branch" />
            <wire x2="1440" y1="1600" y2="1600" x1="1424" />
            <wire x2="1440" y1="1600" y2="1760" x1="1440" />
            <wire x2="1472" y1="1760" y2="1760" x1="1440" />
            <wire x2="1520" y1="1760" y2="1760" x1="1472" />
        </branch>
        <branch name="B">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1472" y="1824" type="branch" />
            <wire x2="1440" y1="2000" y2="2000" x1="1424" />
            <wire x2="1472" y1="1824" y2="1824" x1="1440" />
            <wire x2="1520" y1="1824" y2="1824" x1="1472" />
            <wire x2="1440" y1="1824" y2="2000" x1="1440" />
        </branch>
        <iomarker fontsize="28" x="160" y="1600" name="x" orien="R180" />
        <branch name="Z">
            <wire x2="1808" y1="1792" y2="1792" x1="1776" />
        </branch>
        <iomarker fontsize="28" x="1808" y="1792" name="Z" orien="R0" />
        <branch name="B">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="160" y="1808" type="branch" />
            <wire x2="320" y1="1808" y2="1808" x1="160" />
        </branch>
        <iomarker fontsize="28" x="880" y="2128" name="clk" orien="R180" />
    </sheet>
</drawing>