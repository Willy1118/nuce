<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="xc9500" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="x(0)" />
        <signal name="y(0)" />
        <signal name="XLXN_3" />
        <signal name="XLXN_4" />
        <signal name="XLXN_5" />
        <signal name="cin" />
        <signal name="cout" />
        <signal name="s(0)" />
        <signal name="s(1)" />
        <signal name="s(2)" />
        <signal name="s(3)" />
        <signal name="x(1)" />
        <signal name="y(1)" />
        <signal name="x(2)" />
        <signal name="y(2)" />
        <signal name="x(3)" />
        <signal name="y(3)" />
        <signal name="x(3:0)" />
        <signal name="y(3:0)" />
        <signal name="s(3:0)" />
        <port polarity="Input" name="x(0)" />
        <port polarity="Input" name="y(0)" />
        <port polarity="Input" name="cin" />
        <port polarity="Output" name="cout" />
        <port polarity="Output" name="s(0)" />
        <port polarity="Output" name="s(1)" />
        <port polarity="Output" name="s(2)" />
        <port polarity="Output" name="s(3)" />
        <port polarity="Input" name="x(1)" />
        <port polarity="Input" name="y(1)" />
        <port polarity="Input" name="x(2)" />
        <port polarity="Input" name="y(2)" />
        <port polarity="Input" name="x(3)" />
        <port polarity="Input" name="y(3)" />
        <blockdef name="fa">
            <timestamp>2024-3-14T2:47:13</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="384" y1="-128" y2="-128" x1="320" />
        </blockdef>
        <block symbolname="fa" name="XLXI_1">
            <blockpin signalname="XLXN_3" name="cout" />
            <blockpin signalname="cin" name="cin" />
            <blockpin signalname="x(0)" name="a" />
            <blockpin signalname="y(0)" name="b" />
            <blockpin signalname="s(0)" name="sum" />
        </block>
        <block symbolname="fa" name="XLXI_2">
            <blockpin signalname="XLXN_4" name="cout" />
            <blockpin signalname="XLXN_3" name="cin" />
            <blockpin signalname="x(1)" name="a" />
            <blockpin signalname="y(1)" name="b" />
            <blockpin signalname="s(1)" name="sum" />
        </block>
        <block symbolname="fa" name="XLXI_3">
            <blockpin signalname="XLXN_5" name="cout" />
            <blockpin signalname="XLXN_4" name="cin" />
            <blockpin signalname="x(2)" name="a" />
            <blockpin signalname="y(2)" name="b" />
            <blockpin signalname="s(2)" name="sum" />
        </block>
        <block symbolname="fa" name="XLXI_4">
            <blockpin signalname="cout" name="cout" />
            <blockpin signalname="XLXN_5" name="cin" />
            <blockpin signalname="x(3)" name="a" />
            <blockpin signalname="y(3)" name="b" />
            <blockpin signalname="s(3)" name="sum" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1280" y="1040" name="XLXI_2" orien="R0">
        </instance>
        <instance x="640" y="1040" name="XLXI_1" orien="R0">
        </instance>
        <instance x="1920" y="1040" name="XLXI_3" orien="R0">
        </instance>
        <instance x="2560" y="1040" name="XLXI_4" orien="R0">
        </instance>
        <branch name="x(0)">
            <wire x2="640" y1="880" y2="880" x1="560" />
        </branch>
        <branch name="y(0)">
            <wire x2="640" y1="944" y2="944" x1="560" />
        </branch>
        <branch name="XLXN_3">
            <wire x2="1040" y1="1008" y2="1008" x1="1024" />
            <wire x2="1280" y1="1008" y2="1008" x1="1040" />
        </branch>
        <branch name="XLXN_4">
            <wire x2="1920" y1="1008" y2="1008" x1="1664" />
        </branch>
        <branch name="XLXN_5">
            <wire x2="2560" y1="1008" y2="1008" x1="2304" />
        </branch>
        <branch name="cin">
            <wire x2="640" y1="1008" y2="1008" x1="560" />
        </branch>
        <branch name="cout">
            <wire x2="3040" y1="1008" y2="1008" x1="2944" />
        </branch>
        <branch name="s(0)">
            <wire x2="1040" y1="912" y2="912" x1="1024" />
            <wire x2="1040" y1="800" y2="912" x1="1040" />
        </branch>
        <branch name="s(1)">
            <wire x2="1680" y1="912" y2="912" x1="1664" />
            <wire x2="1680" y1="800" y2="912" x1="1680" />
        </branch>
        <branch name="s(2)">
            <wire x2="2320" y1="912" y2="912" x1="2304" />
            <wire x2="2320" y1="800" y2="912" x1="2320" />
        </branch>
        <branch name="s(3)">
            <wire x2="2960" y1="912" y2="912" x1="2944" />
            <wire x2="2960" y1="800" y2="912" x1="2960" />
        </branch>
        <iomarker fontsize="28" x="560" y="880" name="x(0)" orien="R180" />
        <iomarker fontsize="28" x="560" y="944" name="y(0)" orien="R180" />
        <iomarker fontsize="28" x="560" y="1008" name="cin" orien="R180" />
        <iomarker fontsize="28" x="1040" y="800" name="s(0)" orien="R270" />
        <branch name="x(1)">
            <wire x2="1280" y1="880" y2="880" x1="1248" />
        </branch>
        <iomarker fontsize="28" x="1248" y="880" name="x(1)" orien="R180" />
        <branch name="y(1)">
            <wire x2="1280" y1="944" y2="944" x1="1248" />
        </branch>
        <iomarker fontsize="28" x="1248" y="944" name="y(1)" orien="R180" />
        <iomarker fontsize="28" x="1680" y="800" name="s(1)" orien="R270" />
        <branch name="x(2)">
            <wire x2="1920" y1="880" y2="880" x1="1888" />
        </branch>
        <iomarker fontsize="28" x="1888" y="880" name="x(2)" orien="R180" />
        <branch name="y(2)">
            <wire x2="1920" y1="944" y2="944" x1="1888" />
        </branch>
        <iomarker fontsize="28" x="1888" y="944" name="y(2)" orien="R180" />
        <iomarker fontsize="28" x="2320" y="800" name="s(2)" orien="R270" />
        <branch name="x(3)">
            <wire x2="2560" y1="880" y2="880" x1="2528" />
        </branch>
        <iomarker fontsize="28" x="2528" y="880" name="x(3)" orien="R180" />
        <branch name="y(3)">
            <wire x2="2560" y1="944" y2="944" x1="2528" />
        </branch>
        <iomarker fontsize="28" x="2528" y="944" name="y(3)" orien="R180" />
        <iomarker fontsize="28" x="3040" y="1008" name="cout" orien="R0" />
        <iomarker fontsize="28" x="2960" y="800" name="s(3)" orien="R270" />
        <branch name="x(3:0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="720" y="1200" type="branch" />
            <wire x2="960" y1="1200" y2="1200" x1="720" />
            <wire x2="960" y1="1200" y2="1280" x1="960" />
            <wire x2="960" y1="1280" y2="1360" x1="960" />
            <wire x2="960" y1="1360" y2="1440" x1="960" />
            <wire x2="960" y1="1440" y2="1520" x1="960" />
            <wire x2="960" y1="1520" y2="1600" x1="960" />
        </branch>
        <branch name="y(3:0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1360" y="1200" type="branch" />
            <wire x2="1600" y1="1200" y2="1200" x1="1360" />
            <wire x2="1600" y1="1200" y2="1280" x1="1600" />
            <wire x2="1600" y1="1280" y2="1360" x1="1600" />
            <wire x2="1600" y1="1360" y2="1440" x1="1600" />
            <wire x2="1600" y1="1440" y2="1520" x1="1600" />
            <wire x2="1600" y1="1520" y2="1600" x1="1600" />
        </branch>
        <branch name="s(3:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2880" y="1200" type="branch" />
            <wire x2="2880" y1="1200" y2="1200" x1="2640" />
            <wire x2="2640" y1="1200" y2="1280" x1="2640" />
            <wire x2="2640" y1="1280" y2="1360" x1="2640" />
            <wire x2="2640" y1="1360" y2="1440" x1="2640" />
            <wire x2="2640" y1="1440" y2="1520" x1="2640" />
            <wire x2="2640" y1="1520" y2="1600" x1="2640" />
        </branch>
        <bustap x2="1056" y1="1280" y2="1280" x1="960" />
        <bustap x2="1056" y1="1360" y2="1360" x1="960" />
        <bustap x2="1056" y1="1440" y2="1440" x1="960" />
        <bustap x2="1056" y1="1520" y2="1520" x1="960" />
        <bustap x2="1696" y1="1280" y2="1280" x1="1600" />
        <bustap x2="1696" y1="1360" y2="1360" x1="1600" />
        <bustap x2="1696" y1="1440" y2="1440" x1="1600" />
        <bustap x2="1696" y1="1520" y2="1520" x1="1600" />
        <bustap x2="2736" y1="1280" y2="1280" x1="2640" />
        <bustap x2="2736" y1="1360" y2="1360" x1="2640" />
        <bustap x2="2736" y1="1440" y2="1440" x1="2640" />
        <bustap x2="2736" y1="1520" y2="1520" x1="2640" />
        <branch name="x(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1100" y="1280" type="branch" />
            <wire x2="1100" y1="1280" y2="1280" x1="1056" />
            <wire x2="1120" y1="1280" y2="1280" x1="1100" />
        </branch>
        <branch name="x(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1091" y="1360" type="branch" />
            <wire x2="1091" y1="1360" y2="1360" x1="1056" />
            <wire x2="1120" y1="1360" y2="1360" x1="1091" />
        </branch>
        <branch name="x(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1093" y="1440" type="branch" />
            <wire x2="1093" y1="1440" y2="1440" x1="1056" />
            <wire x2="1120" y1="1440" y2="1440" x1="1093" />
        </branch>
        <branch name="x(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1081" y="1520" type="branch" />
            <wire x2="1081" y1="1520" y2="1520" x1="1056" />
            <wire x2="1120" y1="1520" y2="1520" x1="1081" />
        </branch>
        <branch name="y(3)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1760" y="1280" type="branch" />
            <wire x2="1760" y1="1280" y2="1280" x1="1696" />
        </branch>
        <branch name="y(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1736" y="1360" type="branch" />
            <wire x2="1736" y1="1360" y2="1360" x1="1696" />
            <wire x2="1760" y1="1360" y2="1360" x1="1736" />
        </branch>
        <branch name="y(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1740" y="1440" type="branch" />
            <wire x2="1740" y1="1440" y2="1440" x1="1696" />
            <wire x2="1760" y1="1440" y2="1440" x1="1740" />
        </branch>
        <branch name="y(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1722" y="1520" type="branch" />
            <wire x2="1722" y1="1520" y2="1520" x1="1696" />
            <wire x2="1760" y1="1520" y2="1520" x1="1722" />
        </branch>
        <branch name="s(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2776" y="1280" type="branch" />
            <wire x2="2776" y1="1280" y2="1280" x1="2736" />
            <wire x2="2800" y1="1280" y2="1280" x1="2776" />
        </branch>
        <branch name="s(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2778" y="1360" type="branch" />
            <wire x2="2778" y1="1360" y2="1360" x1="2736" />
            <wire x2="2800" y1="1360" y2="1360" x1="2778" />
        </branch>
        <branch name="s(1)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2800" y="1440" type="branch" />
            <wire x2="2800" y1="1440" y2="1440" x1="2736" />
        </branch>
        <branch name="s(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2746" y="1520" type="branch" />
            <wire x2="2746" y1="1520" y2="1520" x1="2736" />
            <wire x2="2800" y1="1520" y2="1520" x1="2746" />
        </branch>
    </sheet>
</drawing>