<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="xc9500" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="x" />
        <signal name="A" />
        <signal name="C" />
        <signal name="D" />
        <signal name="E" />
        <signal name="XLXN_47" />
        <signal name="XLXN_48" />
        <signal name="XLXN_49" />
        <signal name="XLXN_50" />
        <signal name="XLXN_60" />
        <signal name="XLXN_61" />
        <signal name="XLXN_62" />
        <signal name="XLXN_63" />
        <signal name="XLXN_75" />
        <signal name="XLXN_76" />
        <signal name="XLXN_77" />
        <signal name="XLXN_80" />
        <signal name="y2">
        </signal>
        <signal name="clk" />
        <signal name="XLXN_86" />
        <signal name="y1">
        </signal>
        <signal name="XLXN_88" />
        <signal name="XLXN_91" />
        <signal name="XLXN_92" />
        <signal name="XLXN_93" />
        <signal name="XLXN_94" />
        <signal name="XLXN_97" />
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
        <blockdef name="and3b2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="40" y1="-64" y2="-64" x1="0" />
            <circle r="12" cx="52" cy="-64" />
            <line x2="40" y1="-128" y2="-128" x1="0" />
            <circle r="12" cx="52" cy="-128" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="192" y1="-128" y2="-128" x1="256" />
            <line x2="64" y1="-64" y2="-192" x1="64" />
            <arc ex="144" ey="-176" sx="144" sy="-80" r="48" cx="144" cy="-128" />
            <line x2="64" y1="-80" y2="-80" x1="144" />
            <line x2="144" y1="-176" y2="-176" x1="64" />
        </blockdef>
        <blockdef name="and4b2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="40" y1="-64" y2="-64" x1="0" />
            <circle r="12" cx="52" cy="-64" />
            <line x2="40" y1="-128" y2="-128" x1="0" />
            <circle r="12" cx="52" cy="-128" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="192" y1="-160" y2="-160" x1="256" />
            <line x2="144" y1="-208" y2="-208" x1="64" />
            <arc ex="144" ey="-208" sx="144" sy="-112" r="48" cx="144" cy="-160" />
            <line x2="64" y1="-64" y2="-256" x1="64" />
            <line x2="64" y1="-112" y2="-112" x1="144" />
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
        <block symbolname="fd" name="XLXI_38">
            <blockpin signalname="clk" name="C" />
            <blockpin signalname="XLXN_50" name="D" />
            <blockpin signalname="C" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_42">
            <blockpin signalname="clk" name="C" />
            <blockpin signalname="XLXN_63" name="D" />
            <blockpin signalname="D" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_43">
            <blockpin signalname="clk" name="C" />
            <blockpin signalname="XLXN_77" name="D" />
            <blockpin signalname="E" name="Q" />
        </block>
        <block symbolname="or3" name="XLXI_44">
            <blockpin signalname="XLXN_49" name="I0" />
            <blockpin signalname="XLXN_48" name="I1" />
            <blockpin signalname="XLXN_47" name="I2" />
            <blockpin signalname="XLXN_50" name="O" />
        </block>
        <block symbolname="and3b1" name="XLXI_45">
            <blockpin signalname="x" name="I0" />
            <blockpin signalname="C" name="I1" />
            <blockpin signalname="E" name="I2" />
            <blockpin signalname="XLXN_47" name="O" />
        </block>
        <block symbolname="and3b1" name="XLXI_46">
            <blockpin signalname="E" name="I0" />
            <blockpin signalname="C" name="I1" />
            <blockpin signalname="x" name="I2" />
            <blockpin signalname="XLXN_48" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_47">
            <blockpin signalname="D" name="I0" />
            <blockpin signalname="x" name="I1" />
            <blockpin signalname="XLXN_49" name="O" />
        </block>
        <block symbolname="and2b1" name="XLXI_49">
            <blockpin signalname="x" name="I0" />
            <blockpin signalname="D" name="I1" />
            <blockpin signalname="XLXN_60" name="O" />
        </block>
        <block symbolname="and3b2" name="XLXI_50">
            <blockpin signalname="x" name="I0" />
            <blockpin signalname="E" name="I1" />
            <blockpin signalname="C" name="I2" />
            <blockpin signalname="XLXN_61" name="O" />
        </block>
        <block symbolname="and4b2" name="XLXI_51">
            <blockpin signalname="C" name="I0" />
            <blockpin signalname="D" name="I1" />
            <blockpin signalname="x" name="I2" />
            <blockpin signalname="E" name="I3" />
            <blockpin signalname="XLXN_62" name="O" />
        </block>
        <block symbolname="or3" name="XLXI_52">
            <blockpin signalname="XLXN_60" name="I0" />
            <blockpin signalname="XLXN_61" name="I1" />
            <blockpin signalname="XLXN_62" name="I2" />
            <blockpin signalname="XLXN_63" name="O" />
        </block>
        <block symbolname="or3" name="XLXI_53">
            <blockpin signalname="XLXN_75" name="I0" />
            <blockpin signalname="C" name="I1" />
            <blockpin signalname="XLXN_76" name="I2" />
            <blockpin signalname="XLXN_77" name="O" />
        </block>
        <block symbolname="and2b1" name="XLXI_56">
            <blockpin signalname="x" name="I0" />
            <blockpin signalname="D" name="I1" />
            <blockpin signalname="XLXN_76" name="O" />
        </block>
        <block symbolname="and3b2" name="XLXI_58">
            <blockpin signalname="E" name="I0" />
            <blockpin signalname="D" name="I1" />
            <blockpin signalname="x" name="I2" />
            <blockpin signalname="XLXN_75" name="O" />
        </block>
        <block symbolname="and2b1" name="XLXI_59">
            <blockpin signalname="E" name="I0" />
            <blockpin signalname="C" name="I1" />
            <blockpin signalname="XLXN_80" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_60">
            <blockpin signalname="D" name="I0" />
            <blockpin signalname="XLXN_80" name="I1" />
            <blockpin signalname="y2" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_63">
            <blockpin signalname="A" name="I" />
            <blockpin signalname="y1" name="O" />
        </block>
        <block symbolname="fd" name="XLXI_2">
            <blockpin signalname="clk" name="C" />
            <blockpin signalname="XLXN_97" name="D" />
            <blockpin signalname="A" name="Q" />
        </block>
        <block symbolname="and2b2" name="XLXI_65">
            <blockpin signalname="A" name="I0" />
            <blockpin signalname="x" name="I1" />
            <blockpin signalname="XLXN_92" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_66">
            <blockpin signalname="A" name="I0" />
            <blockpin signalname="x" name="I1" />
            <blockpin signalname="XLXN_91" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_67">
            <blockpin signalname="XLXN_91" name="I0" />
            <blockpin signalname="XLXN_92" name="I1" />
            <blockpin signalname="XLXN_97" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_68">
            <blockpin signalname="y2" name="I0" />
            <blockpin signalname="y1" name="I1" />
            <blockpin signalname="Z" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1200" y="1456" name="XLXI_38" orien="R0" />
        <instance x="1200" y="2016" name="XLXI_42" orien="R0" />
        <branch name="D">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1680" y="1760" type="branch" />
            <wire x2="1680" y1="1760" y2="1760" x1="1584" />
            <wire x2="2240" y1="1760" y2="1760" x1="1680" />
        </branch>
        <instance x="864" y="1328" name="XLXI_44" orien="R0" />
        <instance x="464" y="912" name="XLXI_45" orien="M180" />
        <instance x="464" y="1328" name="XLXI_46" orien="R0" />
        <instance x="464" y="1456" name="XLXI_47" orien="R0" />
        <branch name="C">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="80" y="1040" type="branch" />
            <wire x2="320" y1="1040" y2="1040" x1="80" />
            <wire x2="464" y1="1040" y2="1040" x1="320" />
            <wire x2="320" y1="1040" y2="1200" x1="320" />
            <wire x2="464" y1="1200" y2="1200" x1="320" />
            <wire x2="320" y1="1200" y2="1824" x1="320" />
            <wire x2="464" y1="1824" y2="1824" x1="320" />
            <wire x2="320" y1="1824" y2="1904" x1="320" />
            <wire x2="464" y1="1904" y2="1904" x1="320" />
            <wire x2="320" y1="1904" y2="2400" x1="320" />
            <wire x2="864" y1="2400" y2="2400" x1="320" />
        </branch>
        <branch name="E">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="80" y="1104" type="branch" />
            <wire x2="240" y1="1104" y2="1104" x1="80" />
            <wire x2="464" y1="1104" y2="1104" x1="240" />
            <wire x2="240" y1="1104" y2="1264" x1="240" />
            <wire x2="464" y1="1264" y2="1264" x1="240" />
            <wire x2="240" y1="1264" y2="1760" x1="240" />
            <wire x2="464" y1="1760" y2="1760" x1="240" />
            <wire x2="240" y1="1760" y2="2096" x1="240" />
            <wire x2="464" y1="2096" y2="2096" x1="240" />
            <wire x2="240" y1="2096" y2="2304" x1="240" />
            <wire x2="464" y1="2304" y2="2304" x1="240" />
        </branch>
        <branch name="D">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="80" y="1392" type="branch" />
            <wire x2="160" y1="1392" y2="1392" x1="80" />
            <wire x2="464" y1="1392" y2="1392" x1="160" />
            <wire x2="160" y1="1392" y2="1600" x1="160" />
            <wire x2="464" y1="1600" y2="1600" x1="160" />
            <wire x2="160" y1="1600" y2="1968" x1="160" />
            <wire x2="464" y1="1968" y2="1968" x1="160" />
            <wire x2="160" y1="1968" y2="2240" x1="160" />
            <wire x2="464" y1="2240" y2="2240" x1="160" />
            <wire x2="160" y1="2240" y2="2544" x1="160" />
            <wire x2="464" y1="2544" y2="2544" x1="160" />
        </branch>
        <branch name="XLXN_47">
            <wire x2="864" y1="1040" y2="1040" x1="720" />
            <wire x2="864" y1="1040" y2="1136" x1="864" />
        </branch>
        <branch name="XLXN_48">
            <wire x2="864" y1="1200" y2="1200" x1="720" />
        </branch>
        <branch name="XLXN_49">
            <wire x2="864" y1="1360" y2="1360" x1="720" />
            <wire x2="864" y1="1264" y2="1360" x1="864" />
        </branch>
        <branch name="XLXN_50">
            <wire x2="1200" y1="1200" y2="1200" x1="1120" />
        </branch>
        <instance x="464" y="1472" name="XLXI_49" orien="M180" />
        <instance x="464" y="1632" name="XLXI_50" orien="M180" />
        <instance x="464" y="1840" name="XLXI_51" orien="M180" />
        <instance x="864" y="1632" name="XLXI_52" orien="M180" />
        <branch name="XLXN_60">
            <wire x2="864" y1="1568" y2="1568" x1="720" />
            <wire x2="864" y1="1568" y2="1696" x1="864" />
        </branch>
        <branch name="XLXN_61">
            <wire x2="864" y1="1760" y2="1760" x1="720" />
        </branch>
        <branch name="XLXN_62">
            <wire x2="864" y1="2000" y2="2000" x1="720" />
            <wire x2="864" y1="1824" y2="2000" x1="864" />
        </branch>
        <branch name="XLXN_63">
            <wire x2="1200" y1="1760" y2="1760" x1="1120" />
        </branch>
        <instance x="464" y="2416" name="XLXI_56" orien="M180" />
        <instance x="464" y="2368" name="XLXI_58" orien="R0" />
        <branch name="x">
            <wire x2="400" y1="976" y2="976" x1="80" />
            <wire x2="464" y1="976" y2="976" x1="400" />
            <wire x2="400" y1="976" y2="1136" x1="400" />
            <wire x2="464" y1="1136" y2="1136" x1="400" />
            <wire x2="400" y1="1136" y2="1328" x1="400" />
            <wire x2="464" y1="1328" y2="1328" x1="400" />
            <wire x2="400" y1="1328" y2="1536" x1="400" />
            <wire x2="464" y1="1536" y2="1536" x1="400" />
            <wire x2="400" y1="1536" y2="1696" x1="400" />
            <wire x2="464" y1="1696" y2="1696" x1="400" />
            <wire x2="400" y1="1696" y2="2032" x1="400" />
            <wire x2="464" y1="2032" y2="2032" x1="400" />
            <wire x2="400" y1="2032" y2="2176" x1="400" />
            <wire x2="464" y1="2176" y2="2176" x1="400" />
            <wire x2="400" y1="2176" y2="2480" x1="400" />
            <wire x2="464" y1="2480" y2="2480" x1="400" />
        </branch>
        <instance x="864" y="2272" name="XLXI_53" orien="M180" />
        <instance x="1200" y="2656" name="XLXI_43" orien="R0" />
        <branch name="E">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1680" y="2400" type="branch" />
            <wire x2="1680" y1="2400" y2="2400" x1="1584" />
            <wire x2="1840" y1="2400" y2="2400" x1="1680" />
            <wire x2="1840" y1="1664" y2="2400" x1="1840" />
            <wire x2="1920" y1="1664" y2="1664" x1="1840" />
        </branch>
        <branch name="XLXN_75">
            <wire x2="864" y1="2240" y2="2240" x1="720" />
            <wire x2="864" y1="2240" y2="2336" x1="864" />
        </branch>
        <branch name="XLXN_76">
            <wire x2="864" y1="2512" y2="2512" x1="720" />
            <wire x2="864" y1="2464" y2="2512" x1="864" />
        </branch>
        <branch name="XLXN_77">
            <wire x2="1200" y1="2400" y2="2400" x1="1120" />
        </branch>
        <branch name="C">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1680" y="1200" type="branch" />
            <wire x2="1680" y1="1200" y2="1200" x1="1584" />
            <wire x2="1840" y1="1200" y2="1200" x1="1680" />
            <wire x2="1840" y1="1200" y2="1600" x1="1840" />
            <wire x2="1920" y1="1600" y2="1600" x1="1840" />
        </branch>
        <instance x="1920" y="1728" name="XLXI_59" orien="R0" />
        <instance x="2240" y="1824" name="XLXI_60" orien="R0" />
        <branch name="XLXN_80">
            <wire x2="2208" y1="1632" y2="1632" x1="2176" />
            <wire x2="2208" y1="1632" y2="1696" x1="2208" />
            <wire x2="2240" y1="1696" y2="1696" x1="2208" />
        </branch>
        <branch name="y2">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2560" y="1728" type="branch" />
            <wire x2="2560" y1="1728" y2="1728" x1="2496" />
            <wire x2="2640" y1="1728" y2="1728" x1="2560" />
            <wire x2="2640" y1="1696" y2="1728" x1="2640" />
            <wire x2="2720" y1="1696" y2="1696" x1="2640" />
        </branch>
        <branch name="clk">
            <wire x2="1120" y1="2528" y2="2528" x1="1040" />
            <wire x2="1200" y1="2528" y2="2528" x1="1120" />
            <wire x2="1120" y1="768" y2="1328" x1="1120" />
            <wire x2="1120" y1="1328" y2="1888" x1="1120" />
            <wire x2="1120" y1="1888" y2="2528" x1="1120" />
            <wire x2="1200" y1="1888" y2="1888" x1="1120" />
            <wire x2="1200" y1="1328" y2="1328" x1="1120" />
            <wire x2="1200" y1="768" y2="768" x1="1120" />
        </branch>
        <iomarker fontsize="28" x="1040" y="2528" name="clk" orien="R180" />
        <branch name="A">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1760" y="640" type="branch" />
            <wire x2="1760" y1="640" y2="640" x1="1584" />
            <wire x2="1840" y1="640" y2="640" x1="1760" />
        </branch>
        <iomarker fontsize="28" x="80" y="976" name="x" orien="R180" />
        <instance x="1840" y="672" name="XLXI_63" orien="R0" />
        <branch name="y1">
            <wire x2="2320" y1="640" y2="640" x1="2064" />
            <wire x2="2320" y1="640" y2="1600" x1="2320" />
            <wire x2="2640" y1="1600" y2="1600" x1="2320" />
            <wire x2="2640" y1="1600" y2="1632" x1="2640" />
            <wire x2="2720" y1="1632" y2="1632" x1="2640" />
        </branch>
        <instance x="1200" y="896" name="XLXI_2" orien="R0" />
        <instance x="560" y="608" name="XLXI_65" orien="R0" />
        <instance x="864" y="736" name="XLXI_67" orien="R0" />
        <instance x="560" y="864" name="XLXI_66" orien="R0" />
        <branch name="XLXN_91">
            <wire x2="832" y1="768" y2="768" x1="816" />
            <wire x2="832" y1="672" y2="768" x1="832" />
            <wire x2="864" y1="672" y2="672" x1="832" />
        </branch>
        <branch name="XLXN_92">
            <wire x2="832" y1="512" y2="512" x1="816" />
            <wire x2="832" y1="512" y2="608" x1="832" />
            <wire x2="864" y1="608" y2="608" x1="832" />
        </branch>
        <branch name="x">
            <wire x2="480" y1="480" y2="480" x1="320" />
            <wire x2="560" y1="480" y2="480" x1="480" />
            <wire x2="480" y1="480" y2="736" x1="480" />
            <wire x2="560" y1="736" y2="736" x1="480" />
        </branch>
        <branch name="A">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="320" y="544" type="branch" />
            <wire x2="400" y1="544" y2="544" x1="320" />
            <wire x2="560" y1="544" y2="544" x1="400" />
            <wire x2="400" y1="544" y2="800" x1="400" />
            <wire x2="560" y1="800" y2="800" x1="400" />
        </branch>
        <branch name="XLXN_97">
            <wire x2="1200" y1="640" y2="640" x1="1120" />
        </branch>
        <iomarker fontsize="28" x="320" y="480" name="x" orien="R180" />
        <instance x="2720" y="1760" name="XLXI_68" orien="R0" />
        <branch name="Z">
            <wire x2="3008" y1="1664" y2="1664" x1="2976" />
        </branch>
        <iomarker fontsize="28" x="3008" y="1664" name="Z" orien="R0" />
    </sheet>
</drawing>