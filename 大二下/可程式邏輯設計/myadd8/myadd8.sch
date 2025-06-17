<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="xc9500" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="x(3:0)" />
        <signal name="y(3:0)" />
        <signal name="cin" />
        <signal name="s(3:0)" />
        <signal name="XLXN_5" />
        <signal name="cout" />
        <signal name="s(7:4)" />
        <signal name="x(7:4)" />
        <signal name="y(7:4)" />
        <signal name="x(7:0)" />
        <signal name="y(7:0)" />
        <signal name="s(7:0)" />
        <port polarity="Input" name="x(3:0)" />
        <port polarity="Input" name="y(3:0)" />
        <port polarity="Input" name="cin" />
        <port polarity="Output" name="s(3:0)" />
        <port polarity="Output" name="cout" />
        <port polarity="Output" name="s(7:4)" />
        <port polarity="Input" name="x(7:4)" />
        <port polarity="Input" name="y(7:4)" />
        <blockdef name="myadd4">
            <timestamp>2024-3-14T3:0:54</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-140" height="24" />
            <line x2="384" y1="-128" y2="-128" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <block symbolname="myadd4" name="XLXI_1">
            <blockpin signalname="x(3:0)" name="x(3:0)" />
            <blockpin signalname="y(3:0)" name="y(3:0)" />
            <blockpin signalname="cin" name="cin" />
            <blockpin signalname="s(3:0)" name="s(3:0)" />
            <blockpin signalname="XLXN_5" name="cout" />
        </block>
        <block symbolname="myadd4" name="XLXI_2">
            <blockpin signalname="x(7:4)" name="x(3:0)" />
            <blockpin signalname="y(7:4)" name="y(3:0)" />
            <blockpin signalname="XLXN_5" name="cin" />
            <blockpin signalname="s(7:4)" name="s(3:0)" />
            <blockpin signalname="cout" name="cout" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="896" y="832" name="XLXI_1" orien="R0">
        </instance>
        <instance x="1536" y="832" name="XLXI_2" orien="R0">
        </instance>
        <branch name="x(3:0)">
            <wire x2="896" y1="672" y2="672" x1="800" />
        </branch>
        <branch name="y(3:0)">
            <wire x2="896" y1="736" y2="736" x1="800" />
        </branch>
        <branch name="cin">
            <wire x2="896" y1="800" y2="800" x1="800" />
        </branch>
        <branch name="s(3:0)">
            <wire x2="1360" y1="704" y2="704" x1="1280" />
            <wire x2="1360" y1="560" y2="704" x1="1360" />
        </branch>
        <branch name="XLXN_5">
            <wire x2="1536" y1="800" y2="800" x1="1280" />
        </branch>
        <branch name="cout">
            <wire x2="2000" y1="800" y2="800" x1="1920" />
        </branch>
        <branch name="s(7:4)">
            <wire x2="2000" y1="704" y2="704" x1="1920" />
            <wire x2="2000" y1="560" y2="704" x1="2000" />
        </branch>
        <branch name="x(7:4)">
            <wire x2="1536" y1="672" y2="672" x1="1520" />
        </branch>
        <branch name="y(7:4)">
            <wire x2="1536" y1="736" y2="736" x1="1520" />
        </branch>
        <iomarker fontsize="28" x="800" y="672" name="x(3:0)" orien="R180" />
        <iomarker fontsize="28" x="800" y="736" name="y(3:0)" orien="R180" />
        <iomarker fontsize="28" x="800" y="800" name="cin" orien="R180" />
        <iomarker fontsize="28" x="1360" y="560" name="s(3:0)" orien="R270" />
        <iomarker fontsize="28" x="1520" y="672" name="x(7:4)" orien="R180" />
        <iomarker fontsize="28" x="1520" y="736" name="y(7:4)" orien="R180" />
        <iomarker fontsize="28" x="2000" y="560" name="s(7:4)" orien="R270" />
        <iomarker fontsize="28" x="2000" y="800" name="cout" orien="R0" />
        <branch name="x(7:0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="800" y="960" type="branch" />
            <wire x2="880" y1="960" y2="960" x1="800" />
            <wire x2="880" y1="960" y2="1040" x1="880" />
            <wire x2="880" y1="1040" y2="1120" x1="880" />
            <wire x2="880" y1="1120" y2="1200" x1="880" />
        </branch>
        <branch name="y(7:0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1200" y="960" type="branch" />
            <wire x2="1280" y1="960" y2="960" x1="1200" />
            <wire x2="1280" y1="960" y2="1040" x1="1280" />
            <wire x2="1280" y1="1040" y2="1120" x1="1280" />
            <wire x2="1280" y1="1120" y2="1200" x1="1280" />
        </branch>
        <branch name="s(7:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1760" y="960" type="branch" />
            <wire x2="1760" y1="960" y2="960" x1="1680" />
            <wire x2="1680" y1="960" y2="1040" x1="1680" />
            <wire x2="1680" y1="1040" y2="1120" x1="1680" />
            <wire x2="1680" y1="1120" y2="1200" x1="1680" />
        </branch>
        <bustap x2="976" y1="1040" y2="1040" x1="880" />
        <bustap x2="976" y1="1120" y2="1120" x1="880" />
        <bustap x2="1376" y1="1040" y2="1040" x1="1280" />
        <bustap x2="1376" y1="1120" y2="1120" x1="1280" />
        <bustap x2="1776" y1="1040" y2="1040" x1="1680" />
        <bustap x2="1776" y1="1120" y2="1120" x1="1680" />
        <branch name="x(7:4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1013" y="1040" type="branch" />
            <wire x2="1013" y1="1040" y2="1040" x1="976" />
            <wire x2="1040" y1="1040" y2="1040" x1="1013" />
        </branch>
        <branch name="x(3:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1009" y="1120" type="branch" />
            <wire x2="1009" y1="1120" y2="1120" x1="976" />
            <wire x2="1040" y1="1120" y2="1120" x1="1009" />
        </branch>
        <branch name="y(7:4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1394" y="1040" type="branch" />
            <wire x2="1394" y1="1040" y2="1040" x1="1376" />
            <wire x2="1440" y1="1040" y2="1040" x1="1394" />
        </branch>
        <branch name="y(3:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1420" y="1120" type="branch" />
            <wire x2="1420" y1="1120" y2="1120" x1="1376" />
            <wire x2="1440" y1="1120" y2="1120" x1="1420" />
        </branch>
        <branch name="s(7:4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1805" y="1040" type="branch" />
            <wire x2="1805" y1="1040" y2="1040" x1="1776" />
            <wire x2="1840" y1="1040" y2="1040" x1="1805" />
        </branch>
        <branch name="s(3:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1805" y="1120" type="branch" />
            <wire x2="1805" y1="1120" y2="1120" x1="1776" />
            <wire x2="1840" y1="1120" y2="1120" x1="1805" />
        </branch>
    </sheet>
</drawing>