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
        <signal name="a(0)" />
        <signal name="b(0)" />
        <signal name="XLXN_5" />
        <signal name="XLXN_6" />
        <signal name="b(1)" />
        <signal name="a(1)" />
        <signal name="p(0)" />
        <signal name="a0b1" />
        <signal name="b0a1" />
        <signal name="XLXN_13" />
        <signal name="XLXN_14" />
        <signal name="p(1)" />
        <signal name="p(2)" />
        <signal name="p(3)" />
        <signal name="a(1:0)" />
        <signal name="b(1:0)" />
        <signal name="p(3:0)" />
        <port polarity="Input" name="a(0)" />
        <port polarity="Input" name="b(0)" />
        <port polarity="Input" name="b(1)" />
        <port polarity="Input" name="a(1)" />
        <port polarity="Output" name="p(0)" />
        <port polarity="Output" name="p(1)" />
        <port polarity="Output" name="p(2)" />
        <port polarity="Output" name="p(3)" />
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
        <blockdef name="ha">
            <timestamp>2024-3-14T3:15:23</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <block symbolname="and2" name="XLXI_1">
            <blockpin signalname="b(0)" name="I0" />
            <blockpin signalname="a(0)" name="I1" />
            <blockpin signalname="p(0)" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_2">
            <blockpin signalname="b(1)" name="I0" />
            <blockpin signalname="a(0)" name="I1" />
            <blockpin signalname="a0b1" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_3">
            <blockpin signalname="b(0)" name="I0" />
            <blockpin signalname="a(1)" name="I1" />
            <blockpin signalname="b0a1" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_4">
            <blockpin signalname="a(1)" name="I0" />
            <blockpin signalname="b(1)" name="I1" />
            <blockpin signalname="XLXN_13" name="O" />
        </block>
        <block symbolname="ha" name="XLXI_5">
            <blockpin signalname="a0b1" name="a" />
            <blockpin signalname="b0a1" name="b" />
            <blockpin signalname="p(1)" name="sum" />
            <blockpin signalname="XLXN_14" name="carry" />
        </block>
        <block symbolname="ha" name="XLXI_6">
            <blockpin signalname="XLXN_14" name="a" />
            <blockpin signalname="XLXN_13" name="b" />
            <blockpin signalname="p(2)" name="sum" />
            <blockpin signalname="p(3)" name="carry" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="800" y="608" name="XLXI_1" orien="R0" />
        <instance x="800" y="768" name="XLXI_2" orien="R0" />
        <instance x="800" y="928" name="XLXI_3" orien="R0" />
        <instance x="800" y="1088" name="XLXI_4" orien="R0" />
        <branch name="a(0)">
            <wire x2="720" y1="480" y2="480" x1="400" />
            <wire x2="800" y1="480" y2="480" x1="720" />
            <wire x2="720" y1="480" y2="640" x1="720" />
            <wire x2="800" y1="640" y2="640" x1="720" />
        </branch>
        <branch name="b(0)">
            <wire x2="640" y1="544" y2="544" x1="400" />
            <wire x2="800" y1="544" y2="544" x1="640" />
            <wire x2="640" y1="544" y2="864" x1="640" />
            <wire x2="800" y1="864" y2="864" x1="640" />
        </branch>
        <branch name="b(1)">
            <wire x2="560" y1="704" y2="704" x1="400" />
            <wire x2="800" y1="704" y2="704" x1="560" />
            <wire x2="560" y1="704" y2="960" x1="560" />
            <wire x2="800" y1="960" y2="960" x1="560" />
        </branch>
        <branch name="a(1)">
            <wire x2="480" y1="800" y2="800" x1="400" />
            <wire x2="800" y1="800" y2="800" x1="480" />
            <wire x2="480" y1="800" y2="1024" x1="480" />
            <wire x2="800" y1="1024" y2="1024" x1="480" />
        </branch>
        <branch name="p(0)">
            <wire x2="1200" y1="512" y2="512" x1="1056" />
        </branch>
        <instance x="1280" y="816" name="XLXI_5" orien="R0">
        </instance>
        <iomarker fontsize="28" x="400" y="480" name="a(0)" orien="R180" />
        <iomarker fontsize="28" x="400" y="544" name="b(0)" orien="R180" />
        <iomarker fontsize="28" x="400" y="704" name="b(1)" orien="R180" />
        <iomarker fontsize="28" x="400" y="800" name="a(1)" orien="R180" />
        <iomarker fontsize="28" x="1200" y="512" name="p(0)" orien="R0" />
        <branch name="a0b1">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1120" y="672" type="branch" />
            <wire x2="1120" y1="672" y2="672" x1="1056" />
            <wire x2="1120" y1="672" y2="720" x1="1120" />
            <wire x2="1280" y1="720" y2="720" x1="1120" />
        </branch>
        <branch name="b0a1">
            <attrtext style="alignment:SOFT-TCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1120" y="832" type="branch" />
            <wire x2="1120" y1="832" y2="832" x1="1056" />
            <wire x2="1120" y1="784" y2="832" x1="1120" />
            <wire x2="1280" y1="784" y2="784" x1="1120" />
        </branch>
        <branch name="XLXN_13">
            <wire x2="1760" y1="992" y2="992" x1="1056" />
        </branch>
        <instance x="1760" y="1024" name="XLXI_6" orien="R0">
        </instance>
        <branch name="XLXN_14">
            <wire x2="1712" y1="784" y2="784" x1="1664" />
            <wire x2="1712" y1="784" y2="928" x1="1712" />
            <wire x2="1760" y1="928" y2="928" x1="1712" />
        </branch>
        <branch name="p(1)">
            <wire x2="2240" y1="720" y2="720" x1="1664" />
        </branch>
        <branch name="p(2)">
            <wire x2="2240" y1="928" y2="928" x1="2144" />
        </branch>
        <branch name="p(3)">
            <wire x2="2240" y1="992" y2="992" x1="2144" />
        </branch>
        <iomarker fontsize="28" x="2240" y="720" name="p(1)" orien="R0" />
        <iomarker fontsize="28" x="2240" y="928" name="p(2)" orien="R0" />
        <iomarker fontsize="28" x="2240" y="992" name="p(3)" orien="R0" />
        <branch name="a(1:0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="640" y="1200" type="branch" />
            <wire x2="800" y1="1200" y2="1200" x1="640" />
            <wire x2="800" y1="1200" y2="1280" x1="800" />
            <wire x2="800" y1="1280" y2="1360" x1="800" />
            <wire x2="800" y1="1360" y2="1440" x1="800" />
        </branch>
        <branch name="b(1:0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1120" y="1200" type="branch" />
            <wire x2="1280" y1="1200" y2="1200" x1="1120" />
            <wire x2="1280" y1="1200" y2="1280" x1="1280" />
            <wire x2="1280" y1="1280" y2="1296" x1="1280" />
            <wire x2="1280" y1="1296" y2="1360" x1="1280" />
            <wire x2="1280" y1="1360" y2="1440" x1="1280" />
        </branch>
        <branch name="p(3:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2064" y="1200" type="branch" />
            <wire x2="2064" y1="1200" y2="1200" x1="1840" />
            <wire x2="1840" y1="1200" y2="1280" x1="1840" />
            <wire x2="1840" y1="1280" y2="1360" x1="1840" />
            <wire x2="1840" y1="1360" y2="1440" x1="1840" />
            <wire x2="1840" y1="1440" y2="1520" x1="1840" />
            <wire x2="1840" y1="1520" y2="1600" x1="1840" />
        </branch>
        <bustap x2="896" y1="1280" y2="1280" x1="800" />
        <bustap x2="896" y1="1360" y2="1360" x1="800" />
        <bustap x2="1376" y1="1280" y2="1280" x1="1280" />
        <bustap x2="1376" y1="1360" y2="1360" x1="1280" />
        <branch name="a(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="907" y="1280" type="branch" />
            <wire x2="907" y1="1280" y2="1280" x1="896" />
            <wire x2="960" y1="1280" y2="1280" x1="907" />
        </branch>
        <branch name="a(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="917" y="1360" type="branch" />
            <wire x2="917" y1="1360" y2="1360" x1="896" />
            <wire x2="960" y1="1360" y2="1360" x1="917" />
        </branch>
        <branch name="b(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1403" y="1280" type="branch" />
            <wire x2="1403" y1="1280" y2="1280" x1="1376" />
            <wire x2="1440" y1="1280" y2="1280" x1="1403" />
        </branch>
        <branch name="b(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1400" y="1360" type="branch" />
            <wire x2="1400" y1="1360" y2="1360" x1="1376" />
            <wire x2="1440" y1="1360" y2="1360" x1="1400" />
        </branch>
        <bustap x2="1936" y1="1280" y2="1280" x1="1840" />
        <bustap x2="1936" y1="1360" y2="1360" x1="1840" />
        <bustap x2="1936" y1="1440" y2="1440" x1="1840" />
        <bustap x2="1936" y1="1520" y2="1520" x1="1840" />
        <branch name="p(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1973" y="1280" type="branch" />
            <wire x2="1973" y1="1280" y2="1280" x1="1936" />
            <wire x2="2000" y1="1280" y2="1280" x1="1973" />
        </branch>
        <branch name="p(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1975" y="1360" type="branch" />
            <wire x2="1975" y1="1360" y2="1360" x1="1936" />
            <wire x2="2000" y1="1360" y2="1360" x1="1975" />
        </branch>
        <branch name="p(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1986" y="1440" type="branch" />
            <wire x2="1986" y1="1440" y2="1440" x1="1936" />
            <wire x2="2000" y1="1440" y2="1440" x1="1986" />
        </branch>
        <branch name="p(0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2000" y="1520" type="branch" />
            <wire x2="2000" y1="1520" y2="1520" x1="1936" />
        </branch>
    </sheet>
</drawing>