<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="xc9500" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="iclk" />
        <signal name="XLXN_3" />
        <signal name="XLXN_4" />
        <signal name="oclk" />
        <signal name="XLXN_6" />
        <port polarity="Input" name="iclk" />
        <port polarity="Output" name="oclk" />
        <blockdef name="cb4re">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="320" y1="-192" y2="-192" x1="384" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="320" y1="-320" y2="-320" x1="384" />
            <line x2="320" y1="-384" y2="-384" x1="384" />
            <line x2="320" y1="-448" y2="-448" x1="384" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="320" y1="-128" y2="-128" x1="384" />
            <line x2="64" y1="-32" y2="-32" x1="192" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <rect width="256" x="64" y="-512" height="448" />
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
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="32" y1="-64" y2="-64" x1="96" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="64" />
        </blockdef>
        <block symbolname="cb4re" name="XLXI_1">
            <blockpin signalname="iclk" name="C" />
            <blockpin signalname="XLXN_6" name="CE" />
            <blockpin signalname="oclk" name="R" />
            <blockpin name="CEO" />
            <blockpin signalname="XLXN_3" name="Q0" />
            <blockpin signalname="XLXN_4" name="Q1" />
            <blockpin name="Q2" />
            <blockpin name="Q3" />
            <blockpin name="TC" />
        </block>
        <block symbolname="and2b1" name="XLXI_2">
            <blockpin signalname="XLXN_3" name="I0" />
            <blockpin signalname="XLXN_4" name="I1" />
            <blockpin signalname="oclk" name="O" />
        </block>
        <block symbolname="vcc" name="XLXI_3">
            <blockpin signalname="XLXN_6" name="P" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1376" y="2032" name="XLXI_1" orien="R0" />
        <instance x="1840" y="1520" name="XLXI_2" orien="M180" />
        <branch name="iclk">
            <wire x2="1376" y1="1904" y2="1904" x1="1200" />
        </branch>
        <branch name="oclk">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1280" y="2000" type="branch" />
            <wire x2="1376" y1="2000" y2="2000" x1="1280" />
        </branch>
        <branch name="XLXN_3">
            <wire x2="1840" y1="1584" y2="1584" x1="1760" />
        </branch>
        <branch name="XLXN_4">
            <wire x2="1840" y1="1648" y2="1648" x1="1760" />
        </branch>
        <branch name="oclk">
            <wire x2="2240" y1="1616" y2="1616" x1="2096" />
        </branch>
        <iomarker fontsize="28" x="1200" y="1904" name="iclk" orien="R180" />
        <iomarker fontsize="28" x="2240" y="1616" name="oclk" orien="R0" />
        <instance x="1216" y="1584" name="XLXI_3" orien="R0" />
        <branch name="XLXN_6">
            <wire x2="1280" y1="1584" y2="1840" x1="1280" />
            <wire x2="1376" y1="1840" y2="1840" x1="1280" />
        </branch>
    </sheet>
</drawing>