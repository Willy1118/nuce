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
        <signal name="XLXN_3" />
        <signal name="a" />
        <signal name="b" />
        <signal name="XLXN_6" />
        <signal name="cin" />
        <signal name="XLXN_10" />
        <signal name="XLXN_11" />
        <signal name="XLXN_12" />
        <signal name="XLXN_13" />
        <signal name="XLXN_14" />
        <signal name="sum" />
        <signal name="cout" />
        <port polarity="Input" name="a" />
        <port polarity="Input" name="b" />
        <port polarity="Input" name="cin" />
        <port polarity="Output" name="sum" />
        <port polarity="Output" name="cout" />
        <blockdef name="xor3">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="48" y1="-64" y2="-64" x1="0" />
            <line x2="72" y1="-128" y2="-128" x1="0" />
            <line x2="48" y1="-192" y2="-192" x1="0" />
            <line x2="208" y1="-128" y2="-128" x1="256" />
            <arc ex="48" ey="-176" sx="48" sy="-80" r="56" cx="16" cy="-128" />
            <arc ex="64" ey="-176" sx="64" sy="-80" r="56" cx="32" cy="-128" />
            <arc ex="128" ey="-176" sx="208" sy="-128" r="88" cx="132" cy="-88" />
            <line x2="48" y1="-64" y2="-80" x1="48" />
            <line x2="48" y1="-192" y2="-176" x1="48" />
            <line x2="64" y1="-80" y2="-80" x1="128" />
            <line x2="64" y1="-176" y2="-176" x1="128" />
            <arc ex="208" ey="-128" sx="128" sy="-80" r="88" cx="132" cy="-168" />
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
        <blockdef name="or3">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="48" y1="-64" y2="-64" x1="0" />
            <line x2="72" y1="-128" y2="-128" x1="0" />
            <line x2="48" y1="-192" y2="-192" x1="0" />
            <line x2="192" y1="-128" y2="-128" x1="256" />
            <arc ex="192" ey="-128" sx="112" sy="-80" r="88" cx="116" cy="-168" />
            <arc ex="48" ey="-176" sx="48" sy="-80" r="56" cx="16" cy="-128" />
            <line x2="48" y1="-64" y2="-80" x1="48" />
            <line x2="48" y1="-192" y2="-176" x1="48" />
            <line x2="48" y1="-80" y2="-80" x1="112" />
            <arc ex="112" ey="-176" sx="192" sy="-128" r="88" cx="116" cy="-88" />
            <line x2="48" y1="-176" y2="-176" x1="112" />
        </blockdef>
        <block symbolname="xor3" name="XLXI_1">
            <blockpin signalname="cin" name="I0" />
            <blockpin signalname="b" name="I1" />
            <blockpin signalname="a" name="I2" />
            <blockpin signalname="sum" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_2">
            <blockpin signalname="b" name="I0" />
            <blockpin signalname="a" name="I1" />
            <blockpin signalname="XLXN_12" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_3">
            <blockpin signalname="cin" name="I0" />
            <blockpin signalname="a" name="I1" />
            <blockpin signalname="XLXN_13" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_4">
            <blockpin signalname="cin" name="I0" />
            <blockpin signalname="b" name="I1" />
            <blockpin signalname="XLXN_14" name="O" />
        </block>
        <block symbolname="or3" name="XLXI_5">
            <blockpin signalname="XLXN_14" name="I0" />
            <blockpin signalname="XLXN_13" name="I1" />
            <blockpin signalname="XLXN_12" name="I2" />
            <blockpin signalname="cout" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1040" y="752" name="XLXI_1" orien="R0" />
        <instance x="1040" y="1008" name="XLXI_2" orien="R0" />
        <instance x="1040" y="1168" name="XLXI_3" orien="R0" />
        <instance x="1040" y="1328" name="XLXI_4" orien="R0" />
        <instance x="1600" y="1200" name="XLXI_5" orien="R0" />
        <branch name="a">
            <wire x2="960" y1="560" y2="560" x1="720" />
            <wire x2="1040" y1="560" y2="560" x1="960" />
            <wire x2="960" y1="560" y2="880" x1="960" />
            <wire x2="1040" y1="880" y2="880" x1="960" />
            <wire x2="960" y1="880" y2="1040" x1="960" />
            <wire x2="1040" y1="1040" y2="1040" x1="960" />
        </branch>
        <branch name="cin">
            <wire x2="800" y1="688" y2="688" x1="720" />
            <wire x2="1040" y1="688" y2="688" x1="800" />
            <wire x2="800" y1="688" y2="1104" x1="800" />
            <wire x2="1040" y1="1104" y2="1104" x1="800" />
            <wire x2="800" y1="1104" y2="1264" x1="800" />
            <wire x2="1040" y1="1264" y2="1264" x1="800" />
        </branch>
        <branch name="b">
            <wire x2="880" y1="624" y2="624" x1="720" />
            <wire x2="1040" y1="624" y2="624" x1="880" />
            <wire x2="880" y1="624" y2="928" x1="880" />
            <wire x2="880" y1="928" y2="944" x1="880" />
            <wire x2="1040" y1="944" y2="944" x1="880" />
            <wire x2="880" y1="944" y2="1200" x1="880" />
            <wire x2="1040" y1="1200" y2="1200" x1="880" />
        </branch>
        <branch name="XLXN_12">
            <wire x2="1600" y1="912" y2="912" x1="1296" />
            <wire x2="1600" y1="912" y2="1008" x1="1600" />
        </branch>
        <branch name="XLXN_13">
            <wire x2="1600" y1="1072" y2="1072" x1="1296" />
        </branch>
        <branch name="XLXN_14">
            <wire x2="1600" y1="1232" y2="1232" x1="1296" />
            <wire x2="1600" y1="1136" y2="1232" x1="1600" />
        </branch>
        <iomarker fontsize="28" x="720" y="560" name="a" orien="R180" />
        <iomarker fontsize="28" x="720" y="624" name="b" orien="R180" />
        <iomarker fontsize="28" x="720" y="688" name="cin" orien="R180" />
        <branch name="sum">
            <wire x2="1312" y1="624" y2="624" x1="1296" />
            <wire x2="1888" y1="624" y2="624" x1="1312" />
        </branch>
        <branch name="cout">
            <wire x2="1888" y1="1072" y2="1072" x1="1856" />
        </branch>
        <iomarker fontsize="28" x="1888" y="1072" name="cout" orien="R0" />
        <iomarker fontsize="28" x="1888" y="624" name="sum" orien="R0" />
    </sheet>
</drawing>