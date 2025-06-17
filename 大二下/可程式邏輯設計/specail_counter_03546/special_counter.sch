<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="xc9500" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1" />
        <signal name="XLXN_2" />
        <signal name="q(2)" />
        <signal name="q(1)" />
        <signal name="q(0)" />
        <signal name="XLXN_7" />
        <signal name="XLXN_8" />
        <signal name="XLXN_9" />
        <signal name="XLXN_11" />
        <signal name="XLXN_13" />
        <signal name="q(2:0)" />
        <signal name="XLXN_19" />
        <signal name="clk" />
        <port polarity="Output" name="q(2:0)" />
        <port polarity="Input" name="clk" />
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
        <blockdef name="and2b2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="40" y1="-64" y2="-64" x1="0" />
            <circle r="12" cx="52" cy="-64" />
            <line x2="40" y1="-128" y2="-128" x1="0" />
            <circle r="12" cx="52" cy="-128" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
            <line x2="64" y1="-48" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
        </blockdef>
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <block symbolname="fd" name="XLXI_1">
            <blockpin signalname="clk" name="C" />
            <blockpin signalname="XLXN_1" name="D" />
            <blockpin signalname="q(2)" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_2">
            <blockpin signalname="clk" name="C" />
            <blockpin signalname="XLXN_7" name="D" />
            <blockpin signalname="q(1)" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_3">
            <blockpin signalname="clk" name="C" />
            <blockpin signalname="XLXN_8" name="D" />
            <blockpin signalname="q(0)" name="Q" />
        </block>
        <block symbolname="or2" name="XLXI_4">
            <blockpin signalname="q(0)" name="I0" />
            <blockpin signalname="XLXN_2" name="I1" />
            <blockpin signalname="XLXN_1" name="O" />
        </block>
        <block symbolname="and2b1" name="XLXI_5">
            <blockpin signalname="q(1)" name="I0" />
            <blockpin signalname="q(2)" name="I1" />
            <blockpin signalname="XLXN_2" name="O" />
        </block>
        <block symbolname="and2b2" name="XLXI_6">
            <blockpin signalname="q(1)" name="I0" />
            <blockpin signalname="q(0)" name="I1" />
            <blockpin signalname="XLXN_7" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_7">
            <blockpin signalname="q(2)" name="I" />
            <blockpin signalname="XLXN_8" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1760" y="1536" name="XLXI_1" orien="R0" />
        <instance x="1760" y="1856" name="XLXI_2" orien="R0" />
        <instance x="1760" y="2176" name="XLXI_3" orien="R0" />
        <instance x="1344" y="1376" name="XLXI_4" orien="R0" />
        <instance x="944" y="1344" name="XLXI_5" orien="R0" />
        <instance x="1344" y="1696" name="XLXI_6" orien="R0" />
        <instance x="1376" y="1952" name="XLXI_7" orien="R0" />
        <branch name="XLXN_1">
            <wire x2="1760" y1="1280" y2="1280" x1="1600" />
        </branch>
        <branch name="XLXN_2">
            <wire x2="1344" y1="1248" y2="1248" x1="1200" />
        </branch>
        <branch name="q(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2205" y="1280" type="branch" />
            <wire x2="2205" y1="1280" y2="1280" x1="2144" />
            <wire x2="2240" y1="1280" y2="1280" x1="2205" />
        </branch>
        <branch name="q(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2208" y="1600" type="branch" />
            <wire x2="2208" y1="1600" y2="1600" x1="2144" />
            <wire x2="2240" y1="1600" y2="1600" x1="2208" />
        </branch>
        <branch name="q(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2210" y="1920" type="branch" />
            <wire x2="2210" y1="1920" y2="1920" x1="2144" />
            <wire x2="2240" y1="1920" y2="1920" x1="2210" />
        </branch>
        <branch name="XLXN_7">
            <wire x2="1744" y1="1600" y2="1600" x1="1600" />
            <wire x2="1760" y1="1600" y2="1600" x1="1744" />
        </branch>
        <branch name="XLXN_8">
            <wire x2="1760" y1="1920" y2="1920" x1="1600" />
        </branch>
        <branch name="q(0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1200" y="1312" type="branch" />
            <wire x2="1280" y1="1312" y2="1312" x1="1200" />
            <wire x2="1344" y1="1312" y2="1312" x1="1280" />
            <wire x2="1280" y1="1312" y2="1568" x1="1280" />
            <wire x2="1344" y1="1568" y2="1568" x1="1280" />
        </branch>
        <branch name="q(1)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="720" y="1280" type="branch" />
            <wire x2="880" y1="1280" y2="1280" x1="720" />
            <wire x2="944" y1="1280" y2="1280" x1="880" />
            <wire x2="880" y1="1280" y2="1632" x1="880" />
            <wire x2="1344" y1="1632" y2="1632" x1="880" />
        </branch>
        <branch name="q(2)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="720" y="1216" type="branch" />
            <wire x2="800" y1="1216" y2="1216" x1="720" />
            <wire x2="944" y1="1216" y2="1216" x1="800" />
            <wire x2="800" y1="1216" y2="1920" x1="800" />
            <wire x2="1376" y1="1920" y2="1920" x1="800" />
        </branch>
        <branch name="q(2:0)">
            <wire x2="1520" y1="720" y2="720" x1="1360" />
            <wire x2="1360" y1="720" y2="800" x1="1360" />
            <wire x2="1360" y1="800" y2="880" x1="1360" />
            <wire x2="1360" y1="880" y2="960" x1="1360" />
            <wire x2="1360" y1="960" y2="1040" x1="1360" />
        </branch>
        <bustap x2="1456" y1="800" y2="800" x1="1360" />
        <branch name="q(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1488" y="800" type="branch" />
            <wire x2="1488" y1="800" y2="800" x1="1456" />
            <wire x2="1520" y1="800" y2="800" x1="1488" />
        </branch>
        <bustap x2="1456" y1="880" y2="880" x1="1360" />
        <branch name="q(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1490" y="880" type="branch" />
            <wire x2="1490" y1="880" y2="880" x1="1456" />
            <wire x2="1520" y1="880" y2="880" x1="1490" />
        </branch>
        <bustap x2="1456" y1="960" y2="960" x1="1360" />
        <branch name="q(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1486" y="960" type="branch" />
            <wire x2="1486" y1="960" y2="960" x1="1456" />
            <wire x2="1520" y1="960" y2="960" x1="1486" />
        </branch>
        <iomarker fontsize="28" x="1520" y="720" name="q(2:0)" orien="R0" />
        <branch name="clk">
            <wire x2="1680" y1="2048" y2="2048" x1="1600" />
            <wire x2="1760" y1="2048" y2="2048" x1="1680" />
            <wire x2="1760" y1="1408" y2="1408" x1="1680" />
            <wire x2="1680" y1="1408" y2="1728" x1="1680" />
            <wire x2="1680" y1="1728" y2="2048" x1="1680" />
            <wire x2="1760" y1="1728" y2="1728" x1="1680" />
        </branch>
        <iomarker fontsize="28" x="1600" y="2048" name="clk" orien="R180" />
    </sheet>
</drawing>