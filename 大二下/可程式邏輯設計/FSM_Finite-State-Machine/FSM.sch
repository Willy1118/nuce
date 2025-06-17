<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="xc9500" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="clk" />
        <signal name="x" />
        <signal name="B" />
        <signal name="XLXN_8" />
        <signal name="A" />
        <signal name="Z" />
        <port polarity="Input" name="clk" />
        <port polarity="Input" name="x" />
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
        <block symbolname="fd" name="XLXI_2">
            <blockpin signalname="clk" name="C" />
            <blockpin signalname="x" name="D" />
            <blockpin signalname="B" name="Q" />
        </block>
        <block symbolname="and2b1" name="XLXI_4">
            <blockpin signalname="x" name="I0" />
            <blockpin signalname="B" name="I1" />
            <blockpin signalname="XLXN_8" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_5">
            <blockpin signalname="x" name="I0" />
            <blockpin signalname="A" name="I1" />
            <blockpin signalname="Z" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1200" y="1856" name="XLXI_2" orien="R0" />
        <iomarker fontsize="28" x="1040" y="1728" name="clk" orien="R180" />
        <instance x="784" y="1104" name="XLXI_4" orien="M180" />
        <branch name="x">
            <wire x2="720" y1="1168" y2="1168" x1="640" />
            <wire x2="784" y1="1168" y2="1168" x1="720" />
            <wire x2="1040" y1="1040" y2="1040" x1="720" />
            <wire x2="1680" y1="1040" y2="1040" x1="1040" />
            <wire x2="1680" y1="1040" y2="1136" x1="1680" />
            <wire x2="1040" y1="1040" y2="1200" x1="1040" />
            <wire x2="1040" y1="1200" y2="1600" x1="1040" />
            <wire x2="1200" y1="1600" y2="1600" x1="1040" />
            <wire x2="720" y1="1040" y2="1168" x1="720" />
        </branch>
        <instance x="1680" y="1072" name="XLXI_5" orien="M180" />
        <iomarker fontsize="28" x="640" y="1168" name="x" orien="R180" />
        <branch name="A">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1648" y="1200" type="branch" />
            <wire x2="1648" y1="1200" y2="1200" x1="1584" />
            <wire x2="1680" y1="1200" y2="1200" x1="1648" />
        </branch>
        <branch name="B">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1648" y="1600" type="branch" />
            <wire x2="1648" y1="1600" y2="1600" x1="1584" />
            <wire x2="1680" y1="1600" y2="1600" x1="1648" />
        </branch>
        <branch name="clk">
            <wire x2="1120" y1="1728" y2="1728" x1="1040" />
            <wire x2="1200" y1="1728" y2="1728" x1="1120" />
            <wire x2="1120" y1="1328" y2="1728" x1="1120" />
            <wire x2="1200" y1="1328" y2="1328" x1="1120" />
        </branch>
        <branch name="XLXN_8">
            <wire x2="1200" y1="1200" y2="1200" x1="1040" />
        </branch>
        <instance x="1200" y="1456" name="XLXI_1" orien="R0" />
        <branch name="Z">
            <wire x2="1968" y1="1168" y2="1168" x1="1936" />
        </branch>
        <iomarker fontsize="28" x="1968" y="1168" name="Z" orien="R0" />
        <branch name="B">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="720" y="1232" type="branch" />
            <wire x2="784" y1="1232" y2="1232" x1="720" />
        </branch>
    </sheet>
</drawing>