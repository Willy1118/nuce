<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="xc9500" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="a(0)" />
        <signal name="b(0)" />
        <signal name="b(1)" />
        <signal name="b(2)" />
        <signal name="b(3)" />
        <signal name="p(0)" />
        <signal name="a0b1" />
        <signal name="a0b2" />
        <signal name="a0b3" />
        <signal name="a(1)" />
        <signal name="a1b0" />
        <signal name="a1b1" />
        <signal name="a1b2" />
        <signal name="a1b3" />
        <signal name="a2b3" />
        <signal name="a2b2" />
        <signal name="a2b1" />
        <signal name="a2b0" />
        <signal name="a(2)" />
        <signal name="a(3)" />
        <signal name="a3b0" />
        <signal name="a3b1" />
        <signal name="a3b2" />
        <signal name="a3b3" />
        <signal name="a(3:0)" />
        <signal name="b(3:0)" />
        <signal name="p(1)" />
        <signal name="c1" />
        <signal name="XLXN_234" />
        <signal name="c21" />
        <signal name="p(2)" />
        <signal name="c22" />
        <signal name="XLXN_239" />
        <signal name="c31" />
        <signal name="XLXN_242" />
        <signal name="c32" />
        <signal name="c33" />
        <signal name="p(3)" />
        <signal name="XLXN_251" />
        <signal name="c41" />
        <signal name="XLXN_255" />
        <signal name="c42" />
        <signal name="c43" />
        <signal name="p(4)" />
        <signal name="XLXN_263" />
        <signal name="c51" />
        <signal name="p(5)" />
        <signal name="XLXN_270" />
        <signal name="c52" />
        <signal name="p(6)" />
        <signal name="p(7)" />
        <signal name="p(7:0)" />
        <port polarity="Input" name="a(0)" />
        <port polarity="Input" name="b(0)" />
        <port polarity="Input" name="b(1)" />
        <port polarity="Input" name="b(2)" />
        <port polarity="Input" name="b(3)" />
        <port polarity="Output" name="p(0)" />
        <port polarity="Input" name="a(1)" />
        <port polarity="Input" name="a(2)" />
        <port polarity="Input" name="a(3)" />
        <port polarity="Output" name="p(1)" />
        <port polarity="Output" name="p(2)" />
        <port polarity="Output" name="p(3)" />
        <port polarity="Output" name="p(4)" />
        <port polarity="Output" name="p(5)" />
        <port polarity="Output" name="p(6)" />
        <port polarity="Output" name="p(7)" />
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
            <timestamp>2024-3-14T4:35:28</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="fa">
            <timestamp>2024-3-14T4:38:53</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="384" y1="-128" y2="-128" x1="320" />
        </blockdef>
        <block symbolname="and2" name="XLXI_29">
            <blockpin signalname="b(0)" name="I0" />
            <blockpin signalname="a(0)" name="I1" />
            <blockpin signalname="p(0)" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_30">
            <blockpin signalname="b(1)" name="I0" />
            <blockpin signalname="a(0)" name="I1" />
            <blockpin signalname="a0b1" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_31">
            <blockpin signalname="b(2)" name="I0" />
            <blockpin signalname="a(0)" name="I1" />
            <blockpin signalname="a0b2" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_32">
            <blockpin signalname="b(3)" name="I0" />
            <blockpin signalname="a(0)" name="I1" />
            <blockpin signalname="a0b3" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_33">
            <blockpin signalname="b(0)" name="I0" />
            <blockpin signalname="a(1)" name="I1" />
            <blockpin signalname="a1b0" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_34">
            <blockpin signalname="b(1)" name="I0" />
            <blockpin signalname="a(1)" name="I1" />
            <blockpin signalname="a1b1" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_35">
            <blockpin signalname="b(2)" name="I0" />
            <blockpin signalname="a(1)" name="I1" />
            <blockpin signalname="a1b2" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_36">
            <blockpin signalname="b(3)" name="I0" />
            <blockpin signalname="a(1)" name="I1" />
            <blockpin signalname="a1b3" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_39">
            <blockpin signalname="b(2)" name="I0" />
            <blockpin signalname="a(2)" name="I1" />
            <blockpin signalname="a2b2" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_38">
            <blockpin signalname="b(1)" name="I0" />
            <blockpin signalname="a(2)" name="I1" />
            <blockpin signalname="a2b1" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_37">
            <blockpin signalname="b(0)" name="I0" />
            <blockpin signalname="a(2)" name="I1" />
            <blockpin signalname="a2b0" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_40">
            <blockpin signalname="b(3)" name="I0" />
            <blockpin signalname="a(2)" name="I1" />
            <blockpin signalname="a2b3" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_41">
            <blockpin signalname="b(0)" name="I0" />
            <blockpin signalname="a(3)" name="I1" />
            <blockpin signalname="a3b0" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_42">
            <blockpin signalname="b(1)" name="I0" />
            <blockpin signalname="a(3)" name="I1" />
            <blockpin signalname="a3b1" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_43">
            <blockpin signalname="b(2)" name="I0" />
            <blockpin signalname="a(3)" name="I1" />
            <blockpin signalname="a3b2" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_44">
            <blockpin signalname="b(3)" name="I0" />
            <blockpin signalname="a(3)" name="I1" />
            <blockpin signalname="a3b3" name="O" />
        </block>
        <block symbolname="ha" name="XLXI_96">
            <blockpin signalname="a0b1" name="a" />
            <blockpin signalname="a1b0" name="b" />
            <blockpin signalname="p(1)" name="sum" />
            <blockpin signalname="c1" name="carry" />
        </block>
        <block symbolname="fa" name="XLXI_97">
            <blockpin signalname="c21" name="cout" />
            <blockpin signalname="c1" name="cin" />
            <blockpin signalname="a2b0" name="a" />
            <blockpin signalname="a1b1" name="b" />
            <blockpin signalname="XLXN_234" name="sum" />
        </block>
        <block symbolname="ha" name="XLXI_98">
            <blockpin signalname="a0b2" name="a" />
            <blockpin signalname="XLXN_234" name="b" />
            <blockpin signalname="p(2)" name="sum" />
            <blockpin signalname="c22" name="carry" />
        </block>
        <block symbolname="fa" name="XLXI_99">
            <blockpin signalname="c31" name="cout" />
            <blockpin signalname="c21" name="cin" />
            <blockpin signalname="a3b0" name="a" />
            <blockpin signalname="a2b1" name="b" />
            <blockpin signalname="XLXN_239" name="sum" />
        </block>
        <block symbolname="fa" name="XLXI_100">
            <blockpin signalname="c32" name="cout" />
            <blockpin signalname="a0b3" name="cin" />
            <blockpin signalname="a1b2" name="a" />
            <blockpin signalname="XLXN_239" name="b" />
            <blockpin signalname="XLXN_242" name="sum" />
        </block>
        <block symbolname="ha" name="XLXI_101">
            <blockpin signalname="XLXN_242" name="a" />
            <blockpin signalname="c22" name="b" />
            <blockpin signalname="p(3)" name="sum" />
            <blockpin signalname="c33" name="carry" />
        </block>
        <block symbolname="fa" name="XLXI_102">
            <blockpin signalname="c41" name="cout" />
            <blockpin signalname="c31" name="cin" />
            <blockpin signalname="a3b1" name="a" />
            <blockpin signalname="a2b2" name="b" />
            <blockpin signalname="XLXN_251" name="sum" />
        </block>
        <block symbolname="fa" name="XLXI_103">
            <blockpin signalname="c42" name="cout" />
            <blockpin signalname="c32" name="cin" />
            <blockpin signalname="a1b3" name="a" />
            <blockpin signalname="XLXN_251" name="b" />
            <blockpin signalname="XLXN_255" name="sum" />
        </block>
        <block symbolname="ha" name="XLXI_104">
            <blockpin signalname="XLXN_255" name="a" />
            <blockpin signalname="c33" name="b" />
            <blockpin signalname="p(4)" name="sum" />
            <blockpin signalname="c43" name="carry" />
        </block>
        <block symbolname="fa" name="XLXI_105">
            <blockpin signalname="c51" name="cout" />
            <blockpin signalname="c41" name="cin" />
            <blockpin signalname="a3b2" name="a" />
            <blockpin signalname="a2b3" name="b" />
            <blockpin signalname="XLXN_263" name="sum" />
        </block>
        <block symbolname="fa" name="XLXI_106">
            <blockpin signalname="c52" name="cout" />
            <blockpin signalname="c43" name="cin" />
            <blockpin signalname="c42" name="a" />
            <blockpin signalname="XLXN_263" name="b" />
            <blockpin signalname="p(5)" name="sum" />
        </block>
        <block symbolname="fa" name="XLXI_107">
            <blockpin signalname="p(7)" name="cout" />
            <blockpin signalname="a3b3" name="cin" />
            <blockpin signalname="c52" name="a" />
            <blockpin signalname="c51" name="b" />
            <blockpin signalname="p(6)" name="sum" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="576" y="1184" name="XLXI_29" orien="R0" />
        <instance x="576" y="1344" name="XLXI_30" orien="R0" />
        <instance x="576" y="1504" name="XLXI_31" orien="R0" />
        <instance x="576" y="1664" name="XLXI_32" orien="R0" />
        <branch name="a(0)">
            <wire x2="480" y1="1056" y2="1056" x1="400" />
            <wire x2="576" y1="1056" y2="1056" x1="480" />
            <wire x2="480" y1="1056" y2="1216" x1="480" />
            <wire x2="576" y1="1216" y2="1216" x1="480" />
            <wire x2="480" y1="1216" y2="1376" x1="480" />
            <wire x2="576" y1="1376" y2="1376" x1="480" />
            <wire x2="480" y1="1376" y2="1536" x1="480" />
            <wire x2="576" y1="1536" y2="1536" x1="480" />
        </branch>
        <branch name="b(0)">
            <wire x2="576" y1="1120" y2="1120" x1="400" />
        </branch>
        <branch name="b(1)">
            <wire x2="576" y1="1280" y2="1280" x1="400" />
        </branch>
        <branch name="b(2)">
            <wire x2="576" y1="1440" y2="1440" x1="400" />
        </branch>
        <branch name="b(3)">
            <wire x2="576" y1="1600" y2="1600" x1="400" />
        </branch>
        <branch name="p(0)">
            <wire x2="880" y1="1088" y2="1088" x1="832" />
        </branch>
        <branch name="a0b1">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="848" y="1248" type="branch" />
            <wire x2="848" y1="1248" y2="1248" x1="832" />
            <wire x2="880" y1="1248" y2="1248" x1="848" />
        </branch>
        <branch name="a0b2">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="848" y="1408" type="branch" />
            <wire x2="848" y1="1408" y2="1408" x1="832" />
            <wire x2="880" y1="1408" y2="1408" x1="848" />
        </branch>
        <branch name="a0b3">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="848" y="1568" type="branch" />
            <wire x2="848" y1="1568" y2="1568" x1="832" />
            <wire x2="880" y1="1568" y2="1568" x1="848" />
        </branch>
        <instance x="1376" y="1184" name="XLXI_33" orien="R0" />
        <instance x="1376" y="1344" name="XLXI_34" orien="R0" />
        <instance x="1376" y="1504" name="XLXI_35" orien="R0" />
        <instance x="1376" y="1664" name="XLXI_36" orien="R0" />
        <branch name="a(1)">
            <wire x2="1280" y1="1056" y2="1056" x1="1200" />
            <wire x2="1376" y1="1056" y2="1056" x1="1280" />
            <wire x2="1280" y1="1056" y2="1216" x1="1280" />
            <wire x2="1376" y1="1216" y2="1216" x1="1280" />
            <wire x2="1280" y1="1216" y2="1376" x1="1280" />
            <wire x2="1376" y1="1376" y2="1376" x1="1280" />
            <wire x2="1280" y1="1376" y2="1536" x1="1280" />
            <wire x2="1376" y1="1536" y2="1536" x1="1280" />
        </branch>
        <branch name="b(0)">
            <wire x2="1376" y1="1120" y2="1120" x1="1200" />
        </branch>
        <branch name="b(1)">
            <wire x2="1376" y1="1280" y2="1280" x1="1200" />
        </branch>
        <branch name="b(2)">
            <wire x2="1376" y1="1440" y2="1440" x1="1200" />
        </branch>
        <branch name="b(3)">
            <wire x2="1376" y1="1600" y2="1600" x1="1200" />
        </branch>
        <branch name="a1b0">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1648" y="1088" type="branch" />
            <wire x2="1648" y1="1088" y2="1088" x1="1632" />
            <wire x2="1680" y1="1088" y2="1088" x1="1648" />
        </branch>
        <branch name="a1b1">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1648" y="1248" type="branch" />
            <wire x2="1648" y1="1248" y2="1248" x1="1632" />
            <wire x2="1680" y1="1248" y2="1248" x1="1648" />
        </branch>
        <branch name="a1b2">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1648" y="1408" type="branch" />
            <wire x2="1648" y1="1408" y2="1408" x1="1632" />
            <wire x2="1680" y1="1408" y2="1408" x1="1648" />
        </branch>
        <branch name="a1b3">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1648" y="1568" type="branch" />
            <wire x2="1648" y1="1568" y2="1568" x1="1632" />
            <wire x2="1680" y1="1568" y2="1568" x1="1648" />
        </branch>
        <instance x="576" y="2224" name="XLXI_39" orien="R0" />
        <instance x="576" y="2064" name="XLXI_38" orien="R0" />
        <instance x="576" y="1904" name="XLXI_37" orien="R0" />
        <branch name="a2b3">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="848" y="2288" type="branch" />
            <wire x2="848" y1="2288" y2="2288" x1="832" />
            <wire x2="880" y1="2288" y2="2288" x1="848" />
        </branch>
        <branch name="a2b2">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="848" y="2128" type="branch" />
            <wire x2="848" y1="2128" y2="2128" x1="832" />
            <wire x2="880" y1="2128" y2="2128" x1="848" />
        </branch>
        <branch name="a2b1">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="848" y="1968" type="branch" />
            <wire x2="848" y1="1968" y2="1968" x1="832" />
            <wire x2="880" y1="1968" y2="1968" x1="848" />
        </branch>
        <branch name="a2b0">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="848" y="1808" type="branch" />
            <wire x2="848" y1="1808" y2="1808" x1="832" />
            <wire x2="880" y1="1808" y2="1808" x1="848" />
        </branch>
        <branch name="b(3)">
            <wire x2="576" y1="2320" y2="2320" x1="400" />
        </branch>
        <branch name="b(2)">
            <wire x2="576" y1="2160" y2="2160" x1="400" />
        </branch>
        <branch name="b(1)">
            <wire x2="576" y1="2000" y2="2000" x1="400" />
        </branch>
        <branch name="b(0)">
            <wire x2="576" y1="1840" y2="1840" x1="400" />
        </branch>
        <branch name="a(2)">
            <wire x2="480" y1="1776" y2="1776" x1="400" />
            <wire x2="576" y1="1776" y2="1776" x1="480" />
            <wire x2="480" y1="1776" y2="1936" x1="480" />
            <wire x2="576" y1="1936" y2="1936" x1="480" />
            <wire x2="480" y1="1936" y2="2096" x1="480" />
            <wire x2="576" y1="2096" y2="2096" x1="480" />
            <wire x2="480" y1="2096" y2="2256" x1="480" />
            <wire x2="576" y1="2256" y2="2256" x1="480" />
        </branch>
        <instance x="576" y="2384" name="XLXI_40" orien="R0" />
        <instance x="1376" y="1904" name="XLXI_41" orien="R0" />
        <instance x="1376" y="2064" name="XLXI_42" orien="R0" />
        <instance x="1376" y="2224" name="XLXI_43" orien="R0" />
        <branch name="a(3)">
            <wire x2="1280" y1="1776" y2="1776" x1="1200" />
            <wire x2="1376" y1="1776" y2="1776" x1="1280" />
            <wire x2="1280" y1="1776" y2="1936" x1="1280" />
            <wire x2="1376" y1="1936" y2="1936" x1="1280" />
            <wire x2="1280" y1="1936" y2="2096" x1="1280" />
            <wire x2="1376" y1="2096" y2="2096" x1="1280" />
            <wire x2="1280" y1="2096" y2="2256" x1="1280" />
            <wire x2="1376" y1="2256" y2="2256" x1="1280" />
        </branch>
        <branch name="b(0)">
            <wire x2="1376" y1="1840" y2="1840" x1="1200" />
        </branch>
        <branch name="b(1)">
            <wire x2="1376" y1="2000" y2="2000" x1="1200" />
        </branch>
        <branch name="b(2)">
            <wire x2="1376" y1="2160" y2="2160" x1="1200" />
        </branch>
        <branch name="b(3)">
            <wire x2="1376" y1="2320" y2="2320" x1="1200" />
        </branch>
        <branch name="a3b0">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1648" y="1808" type="branch" />
            <wire x2="1648" y1="1808" y2="1808" x1="1632" />
            <wire x2="1680" y1="1808" y2="1808" x1="1648" />
        </branch>
        <branch name="a3b2">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1648" y="2128" type="branch" />
            <wire x2="1648" y1="2128" y2="2128" x1="1632" />
            <wire x2="1680" y1="2128" y2="2128" x1="1648" />
        </branch>
        <branch name="a3b3">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1648" y="2288" type="branch" />
            <wire x2="1648" y1="2288" y2="2288" x1="1632" />
            <wire x2="1680" y1="2288" y2="2288" x1="1648" />
        </branch>
        <instance x="1376" y="2384" name="XLXI_44" orien="R0" />
        <iomarker fontsize="28" x="400" y="1056" name="a(0)" orien="R180" />
        <iomarker fontsize="28" x="400" y="1120" name="b(0)" orien="R180" />
        <iomarker fontsize="28" x="400" y="1280" name="b(1)" orien="R180" />
        <iomarker fontsize="28" x="400" y="1440" name="b(2)" orien="R180" />
        <iomarker fontsize="28" x="400" y="1600" name="b(3)" orien="R180" />
        <iomarker fontsize="28" x="1200" y="1056" name="a(1)" orien="R180" />
        <iomarker fontsize="28" x="1200" y="1120" name="b(0)" orien="R180" />
        <iomarker fontsize="28" x="1200" y="1280" name="b(1)" orien="R180" />
        <iomarker fontsize="28" x="1200" y="1440" name="b(2)" orien="R180" />
        <iomarker fontsize="28" x="1200" y="1600" name="b(3)" orien="R180" />
        <iomarker fontsize="28" x="400" y="2320" name="b(3)" orien="R180" />
        <iomarker fontsize="28" x="400" y="2160" name="b(2)" orien="R180" />
        <iomarker fontsize="28" x="400" y="2000" name="b(1)" orien="R180" />
        <iomarker fontsize="28" x="400" y="1840" name="b(0)" orien="R180" />
        <iomarker fontsize="28" x="400" y="1776" name="a(2)" orien="R180" />
        <iomarker fontsize="28" x="1200" y="1776" name="a(3)" orien="R180" />
        <iomarker fontsize="28" x="1200" y="1840" name="b(0)" orien="R180" />
        <iomarker fontsize="28" x="1200" y="2000" name="b(1)" orien="R180" />
        <iomarker fontsize="28" x="1200" y="2160" name="b(2)" orien="R180" />
        <iomarker fontsize="28" x="1200" y="2320" name="b(3)" orien="R180" />
        <branch name="a(3:0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="480" y="560" type="branch" />
            <wire x2="640" y1="560" y2="560" x1="480" />
            <wire x2="640" y1="560" y2="640" x1="640" />
            <wire x2="640" y1="640" y2="720" x1="640" />
            <wire x2="640" y1="720" y2="800" x1="640" />
            <wire x2="640" y1="800" y2="880" x1="640" />
            <wire x2="640" y1="880" y2="960" x1="640" />
        </branch>
        <bustap x2="736" y1="640" y2="640" x1="640" />
        <bustap x2="736" y1="720" y2="720" x1="640" />
        <bustap x2="736" y1="800" y2="800" x1="640" />
        <bustap x2="736" y1="880" y2="880" x1="640" />
        <branch name="a(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="768" y="640" type="branch" />
            <wire x2="768" y1="640" y2="640" x1="736" />
            <wire x2="800" y1="640" y2="640" x1="768" />
        </branch>
        <branch name="a(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="768" y="720" type="branch" />
            <wire x2="768" y1="720" y2="720" x1="736" />
            <wire x2="800" y1="720" y2="720" x1="768" />
        </branch>
        <branch name="a(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="768" y="800" type="branch" />
            <wire x2="768" y1="800" y2="800" x1="736" />
            <wire x2="800" y1="800" y2="800" x1="768" />
        </branch>
        <branch name="a(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="768" y="880" type="branch" />
            <wire x2="768" y1="880" y2="880" x1="736" />
            <wire x2="800" y1="880" y2="880" x1="768" />
        </branch>
        <branch name="b(3:0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1200" y="560" type="branch" />
            <wire x2="1360" y1="560" y2="560" x1="1200" />
            <wire x2="1360" y1="560" y2="640" x1="1360" />
            <wire x2="1360" y1="640" y2="720" x1="1360" />
            <wire x2="1360" y1="720" y2="800" x1="1360" />
            <wire x2="1360" y1="800" y2="880" x1="1360" />
            <wire x2="1360" y1="880" y2="960" x1="1360" />
        </branch>
        <bustap x2="1456" y1="640" y2="640" x1="1360" />
        <bustap x2="1456" y1="720" y2="720" x1="1360" />
        <bustap x2="1456" y1="800" y2="800" x1="1360" />
        <bustap x2="1456" y1="880" y2="880" x1="1360" />
        <branch name="b(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1488" y="640" type="branch" />
            <wire x2="1488" y1="640" y2="640" x1="1456" />
            <wire x2="1520" y1="640" y2="640" x1="1488" />
        </branch>
        <branch name="b(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1488" y="720" type="branch" />
            <wire x2="1488" y1="720" y2="720" x1="1456" />
            <wire x2="1520" y1="720" y2="720" x1="1488" />
        </branch>
        <branch name="b(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1488" y="800" type="branch" />
            <wire x2="1488" y1="800" y2="800" x1="1456" />
            <wire x2="1520" y1="800" y2="800" x1="1488" />
        </branch>
        <branch name="b(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1488" y="880" type="branch" />
            <wire x2="1488" y1="880" y2="880" x1="1456" />
            <wire x2="1520" y1="880" y2="880" x1="1488" />
        </branch>
        <instance x="2096" y="1168" name="XLXI_96" orien="R0">
        </instance>
        <branch name="a0b1">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2000" y="1072" type="branch" />
            <wire x2="2096" y1="1072" y2="1072" x1="2000" />
        </branch>
        <branch name="a1b0">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2000" y="1136" type="branch" />
            <wire x2="2096" y1="1136" y2="1136" x1="2000" />
        </branch>
        <branch name="p(1)">
            <wire x2="2560" y1="1072" y2="1072" x1="2480" />
        </branch>
        <branch name="c1">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2544" y="1136" type="branch" />
            <wire x2="2544" y1="1136" y2="1136" x1="2480" />
            <wire x2="2560" y1="1136" y2="1136" x1="2544" />
        </branch>
        <instance x="2096" y="1472" name="XLXI_97" orien="R0">
        </instance>
        <branch name="a2b0">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2000" y="1312" type="branch" />
            <wire x2="2096" y1="1312" y2="1312" x1="2000" />
        </branch>
        <branch name="a1b1">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2000" y="1376" type="branch" />
            <wire x2="2096" y1="1376" y2="1376" x1="2000" />
        </branch>
        <branch name="c1">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2000" y="1440" type="branch" />
            <wire x2="2096" y1="1440" y2="1440" x1="2000" />
        </branch>
        <instance x="2560" y="1376" name="XLXI_98" orien="R0">
        </instance>
        <branch name="XLXN_234">
            <wire x2="2560" y1="1344" y2="1344" x1="2480" />
        </branch>
        <iomarker fontsize="28" x="880" y="1088" name="p(0)" orien="R0" />
        <iomarker fontsize="28" x="2560" y="1072" name="p(1)" orien="R0" />
        <branch name="a3b1">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1642" y="1968" type="branch" />
            <wire x2="1680" y1="1968" y2="1968" x1="1632" />
        </branch>
        <branch name="a0b2">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2480" y="1280" type="branch" />
            <wire x2="2560" y1="1280" y2="1280" x1="2480" />
        </branch>
        <branch name="c21">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2520" y="1440" type="branch" />
            <wire x2="2560" y1="1440" y2="1440" x1="2480" />
        </branch>
        <branch name="p(2)">
            <wire x2="3040" y1="1280" y2="1280" x1="2944" />
        </branch>
        <branch name="c22">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3013" y="1344" type="branch" />
            <wire x2="3040" y1="1344" y2="1344" x1="2944" />
        </branch>
        <iomarker fontsize="28" x="3040" y="1280" name="p(2)" orien="R0" />
        <instance x="2096" y="1792" name="XLXI_99" orien="R0">
        </instance>
        <instance x="2560" y="1760" name="XLXI_100" orien="R0">
        </instance>
        <instance x="3040" y="1728" name="XLXI_101" orien="R0">
        </instance>
        <branch name="a3b0">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2000" y="1632" type="branch" />
            <wire x2="2096" y1="1632" y2="1632" x1="2000" />
        </branch>
        <branch name="a2b1">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2000" y="1696" type="branch" />
            <wire x2="2096" y1="1696" y2="1696" x1="2000" />
        </branch>
        <branch name="c21">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2000" y="1760" type="branch" />
            <wire x2="2096" y1="1760" y2="1760" x1="2000" />
        </branch>
        <branch name="a1b2">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2480" y="1600" type="branch" />
            <wire x2="2560" y1="1600" y2="1600" x1="2480" />
        </branch>
        <branch name="XLXN_239">
            <wire x2="2560" y1="1664" y2="1664" x1="2480" />
        </branch>
        <branch name="c31">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2528" y="1760" type="branch" />
            <wire x2="2528" y1="1760" y2="1760" x1="2480" />
            <wire x2="2560" y1="1760" y2="1760" x1="2528" />
        </branch>
        <branch name="a0b3">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2480" y="1728" type="branch" />
            <wire x2="2560" y1="1728" y2="1728" x1="2480" />
        </branch>
        <branch name="XLXN_242">
            <wire x2="3040" y1="1632" y2="1632" x1="2944" />
        </branch>
        <branch name="c22">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2960" y="1696" type="branch" />
            <wire x2="3040" y1="1696" y2="1696" x1="2960" />
        </branch>
        <branch name="c32">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3018" y="1728" type="branch" />
            <wire x2="3018" y1="1728" y2="1728" x1="2944" />
            <wire x2="3040" y1="1728" y2="1728" x1="3018" />
        </branch>
        <branch name="c33">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3440" y="1696" type="branch" />
            <wire x2="3440" y1="1696" y2="1696" x1="3424" />
            <wire x2="3472" y1="1696" y2="1696" x1="3440" />
        </branch>
        <branch name="p(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3440" y="1632" type="branch" />
            <wire x2="3440" y1="1632" y2="1632" x1="3424" />
            <wire x2="3472" y1="1632" y2="1632" x1="3440" />
        </branch>
        <instance x="2016" y="2112" name="XLXI_102" orien="R0">
        </instance>
        <instance x="2480" y="2080" name="XLXI_103" orien="R0">
        </instance>
        <instance x="2944" y="2048" name="XLXI_104" orien="R0">
        </instance>
        <branch name="a3b1">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1920" y="1952" type="branch" />
            <wire x2="2016" y1="1952" y2="1952" x1="1920" />
        </branch>
        <branch name="a2b2">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1920" y="2016" type="branch" />
            <wire x2="2016" y1="2016" y2="2016" x1="1920" />
        </branch>
        <branch name="c31">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1920" y="2080" type="branch" />
            <wire x2="2016" y1="2080" y2="2080" x1="1920" />
        </branch>
        <branch name="XLXN_251">
            <wire x2="2480" y1="1984" y2="1984" x1="2400" />
        </branch>
        <branch name="a1b3">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2400" y="1920" type="branch" />
            <wire x2="2480" y1="1920" y2="1920" x1="2400" />
        </branch>
        <branch name="c32">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2400" y="2048" type="branch" />
            <wire x2="2480" y1="2048" y2="2048" x1="2400" />
        </branch>
        <branch name="c41">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2448" y="2080" type="branch" />
            <wire x2="2448" y1="2080" y2="2080" x1="2400" />
            <wire x2="2480" y1="2080" y2="2080" x1="2448" />
        </branch>
        <branch name="XLXN_255">
            <wire x2="2944" y1="1952" y2="1952" x1="2864" />
        </branch>
        <branch name="c33">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2880" y="2016" type="branch" />
            <wire x2="2944" y1="2016" y2="2016" x1="2880" />
        </branch>
        <branch name="c42">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2925" y="2048" type="branch" />
            <wire x2="2925" y1="2048" y2="2048" x1="2864" />
            <wire x2="2960" y1="2048" y2="2048" x1="2925" />
        </branch>
        <branch name="c43">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3414" y="2016" type="branch" />
            <wire x2="3414" y1="2016" y2="2016" x1="3328" />
            <wire x2="3440" y1="2016" y2="2016" x1="3414" />
        </branch>
        <branch name="p(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3396" y="1952" type="branch" />
            <wire x2="3396" y1="1952" y2="1952" x1="3328" />
            <wire x2="3440" y1="1952" y2="1952" x1="3396" />
        </branch>
        <instance x="2016" y="2512" name="XLXI_105" orien="R0">
        </instance>
        <instance x="2480" y="2480" name="XLXI_106" orien="R0">
        </instance>
        <instance x="2960" y="2608" name="XLXI_107" orien="R0">
        </instance>
        <branch name="a3b2">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1920" y="2352" type="branch" />
            <wire x2="2016" y1="2352" y2="2352" x1="1920" />
        </branch>
        <branch name="a2b3">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1920" y="2416" type="branch" />
            <wire x2="2016" y1="2416" y2="2416" x1="1920" />
        </branch>
        <branch name="c41">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1920" y="2480" type="branch" />
            <wire x2="2016" y1="2480" y2="2480" x1="1920" />
        </branch>
        <branch name="XLXN_263">
            <wire x2="2480" y1="2384" y2="2384" x1="2400" />
        </branch>
        <branch name="c42">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2400" y="2320" type="branch" />
            <wire x2="2480" y1="2320" y2="2320" x1="2400" />
        </branch>
        <branch name="c43">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2400" y="2448" type="branch" />
            <wire x2="2480" y1="2448" y2="2448" x1="2400" />
        </branch>
        <branch name="p(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2935" y="2352" type="branch" />
            <wire x2="2880" y1="2352" y2="2352" x1="2864" />
            <wire x2="2935" y1="2352" y2="2352" x1="2880" />
            <wire x2="2960" y1="2352" y2="2352" x1="2935" />
        </branch>
        <branch name="c51">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2446" y="2480" type="branch" />
            <wire x2="2446" y1="2480" y2="2480" x1="2400" />
            <wire x2="2480" y1="2480" y2="2480" x1="2446" />
            <wire x2="2480" y1="2480" y2="2512" x1="2480" />
            <wire x2="2960" y1="2512" y2="2512" x1="2480" />
        </branch>
        <branch name="c52">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2926" y="2448" type="branch" />
            <wire x2="2926" y1="2448" y2="2448" x1="2864" />
            <wire x2="2960" y1="2448" y2="2448" x1="2926" />
        </branch>
        <branch name="a3b3">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2880" y="2576" type="branch" />
            <wire x2="2960" y1="2576" y2="2576" x1="2880" />
        </branch>
        <branch name="p(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3408" y="2480" type="branch" />
            <wire x2="3408" y1="2480" y2="2480" x1="3344" />
            <wire x2="3440" y1="2480" y2="2480" x1="3408" />
        </branch>
        <branch name="p(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3408" y="2576" type="branch" />
            <wire x2="3408" y1="2576" y2="2576" x1="3344" />
            <wire x2="3440" y1="2576" y2="2576" x1="3408" />
        </branch>
        <branch name="p(7:0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1840" y="80" type="branch" />
            <wire x2="2000" y1="80" y2="80" x1="1840" />
            <wire x2="2000" y1="80" y2="160" x1="2000" />
            <wire x2="2000" y1="160" y2="240" x1="2000" />
            <wire x2="2000" y1="240" y2="320" x1="2000" />
            <wire x2="2000" y1="320" y2="400" x1="2000" />
            <wire x2="2000" y1="400" y2="480" x1="2000" />
            <wire x2="2000" y1="480" y2="560" x1="2000" />
            <wire x2="2000" y1="560" y2="640" x1="2000" />
            <wire x2="2000" y1="640" y2="720" x1="2000" />
            <wire x2="2000" y1="720" y2="800" x1="2000" />
        </branch>
        <bustap x2="2096" y1="160" y2="160" x1="2000" />
        <bustap x2="2096" y1="240" y2="240" x1="2000" />
        <bustap x2="2096" y1="320" y2="320" x1="2000" />
        <bustap x2="2096" y1="400" y2="400" x1="2000" />
        <bustap x2="2096" y1="480" y2="480" x1="2000" />
        <bustap x2="2096" y1="560" y2="560" x1="2000" />
        <bustap x2="2096" y1="640" y2="640" x1="2000" />
        <bustap x2="2096" y1="720" y2="720" x1="2000" />
        <branch name="p(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2130" y="160" type="branch" />
            <wire x2="2130" y1="160" y2="160" x1="2096" />
            <wire x2="2160" y1="160" y2="160" x1="2130" />
        </branch>
        <branch name="p(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2135" y="240" type="branch" />
            <wire x2="2135" y1="240" y2="240" x1="2096" />
            <wire x2="2160" y1="240" y2="240" x1="2135" />
        </branch>
        <branch name="p(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2134" y="320" type="branch" />
            <wire x2="2134" y1="320" y2="320" x1="2096" />
            <wire x2="2160" y1="320" y2="320" x1="2134" />
        </branch>
        <branch name="p(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2128" y="400" type="branch" />
            <wire x2="2128" y1="400" y2="400" x1="2096" />
            <wire x2="2160" y1="400" y2="400" x1="2128" />
        </branch>
        <branch name="p(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2138" y="480" type="branch" />
            <wire x2="2138" y1="480" y2="480" x1="2096" />
            <wire x2="2160" y1="480" y2="480" x1="2138" />
        </branch>
        <branch name="p(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2132" y="560" type="branch" />
            <wire x2="2132" y1="560" y2="560" x1="2096" />
            <wire x2="2160" y1="560" y2="560" x1="2132" />
        </branch>
        <branch name="p(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2132" y="640" type="branch" />
            <wire x2="2132" y1="640" y2="640" x1="2096" />
            <wire x2="2160" y1="640" y2="640" x1="2132" />
        </branch>
        <branch name="p(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2130" y="720" type="branch" />
            <wire x2="2130" y1="720" y2="720" x1="2096" />
            <wire x2="2160" y1="720" y2="720" x1="2130" />
        </branch>
        <iomarker fontsize="28" x="3472" y="1632" name="p(3)" orien="R0" />
        <iomarker fontsize="28" x="3440" y="1952" name="p(4)" orien="R0" />
        <iomarker fontsize="28" x="2960" y="2352" name="p(5)" orien="R0" />
        <iomarker fontsize="28" x="3440" y="2480" name="p(6)" orien="R0" />
        <iomarker fontsize="28" x="3440" y="2576" name="p(7)" orien="R0" />
    </sheet>
</drawing>