<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="xc9500" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="a(3:0)" />
        <signal name="b(3:0)" />
        <signal name="s(4:0)" />
        <signal name="a(3)" />
        <signal name="a(2)" />
        <signal name="a(1)" />
        <signal name="a(0)" />
        <signal name="b(3)" />
        <signal name="b(2)" />
        <signal name="b(1)" />
        <signal name="b(0)" />
        <signal name="s(4)" />
        <signal name="s(3)" />
        <signal name="s(2)" />
        <signal name="s(1)" />
        <signal name="XLXN_38" />
        <signal name="XLXN_39" />
        <signal name="XLXN_40" />
        <signal name="XLXN_41" />
        <signal name="s(0)" />
        <signal name="smaller" />
        <signal name="XLXN_68" />
        <signal name="XLXN_69" />
        <signal name="XLXN_72" />
        <signal name="XLXN_73" />
        <signal name="cout" />
        <signal name="t0" />
        <signal name="t1" />
        <signal name="t2" />
        <signal name="t3" />
        <signal name="XLXN_324" />
        <signal name="XLXN_325" />
        <signal name="XLXN_326" />
        <signal name="XLXN_327" />
        <signal name="XLXN_354" />
        <signal name="XLXN_355" />
        <signal name="XLXN_361" />
        <signal name="XLXN_362" />
        <signal name="M" />
        <signal name="XLXN_374" />
        <signal name="XLXN_300" />
        <signal name="XLXN_301" />
        <signal name="XLXN_302" />
        <signal name="XLXN_303" />
        <signal name="XLXN_413" />
        <signal name="sign" />
        <port polarity="Input" name="a(3)" />
        <port polarity="Input" name="a(2)" />
        <port polarity="Input" name="a(1)" />
        <port polarity="Input" name="a(0)" />
        <port polarity="Input" name="b(3)" />
        <port polarity="Input" name="b(2)" />
        <port polarity="Input" name="b(1)" />
        <port polarity="Input" name="b(0)" />
        <port polarity="Output" name="s(4)" />
        <port polarity="Output" name="s(3)" />
        <port polarity="Output" name="s(2)" />
        <port polarity="Output" name="s(1)" />
        <port polarity="Output" name="s(0)" />
        <port polarity="Input" name="M" />
        <port polarity="Output" name="sign" />
        <blockdef name="m2_1b1">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <circle r="20" cx="76" cy="-160" />
            <line x2="56" y1="-160" y2="-160" x1="0" />
            <line x2="96" y1="-64" y2="-192" x1="96" />
            <line x2="96" y1="-96" y2="-64" x1="256" />
            <line x2="256" y1="-160" y2="-96" x1="256" />
            <line x2="256" y1="-192" y2="-160" x1="96" />
            <line x2="96" y1="-32" y2="-32" x1="176" />
            <line x2="176" y1="-80" y2="-32" x1="176" />
            <line x2="96" y1="-32" y2="-32" x1="0" />
            <line x2="256" y1="-128" y2="-128" x1="320" />
            <line x2="96" y1="-96" y2="-96" x1="0" />
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
        <blockdef name="compm4">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="64" y1="-320" y2="-320" x1="0" />
            <line x2="64" y1="-512" y2="-512" x1="0" />
            <line x2="64" y1="-576" y2="-576" x1="0" />
            <line x2="64" y1="-448" y2="-448" x1="0" />
            <line x2="64" y1="-384" y2="-384" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <rect width="256" x="64" y="-640" height="576" />
            <line x2="320" y1="-320" y2="-320" x1="384" />
            <line x2="320" y1="-384" y2="-384" x1="384" />
        </blockdef>
        <blockdef name="add4">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="384" y1="-128" y2="-128" x1="448" />
            <line x2="384" y1="-64" y2="-64" x1="448" />
            <line x2="64" y1="-816" y2="-480" x1="64" />
            <line x2="144" y1="-480" y2="-448" x1="64" />
            <line x2="64" y1="-448" y2="-416" x1="144" />
            <line x2="64" y1="-416" y2="-80" x1="64" />
            <line x2="384" y1="-80" y2="-160" x1="64" />
            <line x2="384" y1="-160" y2="-736" x1="384" />
            <line x2="64" y1="-736" y2="-816" x1="384" />
            <line x2="336" y1="-128" y2="-128" x1="384" />
            <line x2="336" y1="-128" y2="-148" x1="336" />
            <line x2="240" y1="-124" y2="-64" x1="240" />
            <line x2="384" y1="-64" y2="-64" x1="240" />
            <line x2="64" y1="-704" y2="-704" x1="0" />
            <line x2="64" y1="-640" y2="-640" x1="0" />
            <line x2="64" y1="-576" y2="-576" x1="0" />
            <line x2="64" y1="-512" y2="-512" x1="0" />
            <line x2="64" y1="-384" y2="-384" x1="0" />
            <line x2="64" y1="-320" y2="-320" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="384" y1="-544" y2="-544" x1="448" />
            <line x2="384" y1="-480" y2="-480" x1="448" />
            <line x2="384" y1="-416" y2="-416" x1="448" />
            <line x2="384" y1="-352" y2="-352" x1="448" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-832" y2="-832" x1="0" />
            <line x2="112" y1="-832" y2="-832" x1="64" />
            <line x2="112" y1="-832" y2="-804" x1="112" />
        </blockdef>
        <blockdef name="constant">
            <timestamp>2006-1-1T10:10:10</timestamp>
            <rect width="112" x="0" y="0" height="64" />
            <line x2="112" y1="32" y2="32" x1="144" />
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
        <blockdef name="m2_1">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="96" y1="-64" y2="-192" x1="96" />
            <line x2="96" y1="-96" y2="-64" x1="256" />
            <line x2="256" y1="-160" y2="-96" x1="256" />
            <line x2="256" y1="-192" y2="-160" x1="96" />
            <line x2="96" y1="-32" y2="-32" x1="176" />
            <line x2="176" y1="-80" y2="-32" x1="176" />
            <line x2="96" y1="-32" y2="-32" x1="0" />
            <line x2="256" y1="-128" y2="-128" x1="320" />
            <line x2="96" y1="-96" y2="-96" x1="0" />
            <line x2="96" y1="-160" y2="-160" x1="0" />
        </blockdef>
        <block symbolname="m2_1b1" name="XLXI_1">
            <blockpin signalname="b(0)" name="D0" />
            <blockpin signalname="b(0)" name="D1" />
            <blockpin signalname="XLXN_38" name="S0" />
            <blockpin signalname="XLXN_68" name="O" />
        </block>
        <block symbolname="m2_1b1" name="XLXI_2">
            <blockpin signalname="b(1)" name="D0" />
            <blockpin signalname="b(1)" name="D1" />
            <blockpin signalname="XLXN_39" name="S0" />
            <blockpin signalname="XLXN_69" name="O" />
        </block>
        <block symbolname="m2_1b1" name="XLXI_3">
            <blockpin signalname="b(2)" name="D0" />
            <blockpin signalname="b(2)" name="D1" />
            <blockpin signalname="XLXN_40" name="S0" />
            <blockpin signalname="XLXN_72" name="O" />
        </block>
        <block symbolname="m2_1b1" name="XLXI_4">
            <blockpin signalname="b(3)" name="D0" />
            <blockpin signalname="b(3)" name="D1" />
            <blockpin signalname="XLXN_41" name="S0" />
            <blockpin signalname="XLXN_73" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_16">
            <blockpin signalname="M" name="I" />
            <blockpin signalname="XLXN_41" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_15">
            <blockpin signalname="M" name="I" />
            <blockpin signalname="XLXN_40" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_14">
            <blockpin signalname="M" name="I" />
            <blockpin signalname="XLXN_39" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_13">
            <blockpin signalname="M" name="I" />
            <blockpin signalname="XLXN_38" name="O" />
        </block>
        <block symbolname="compm4" name="XLXI_25">
            <blockpin signalname="a(0)" name="A0" />
            <blockpin signalname="a(1)" name="A1" />
            <blockpin signalname="a(2)" name="A2" />
            <blockpin signalname="a(3)" name="A3" />
            <blockpin signalname="b(0)" name="B0" />
            <blockpin signalname="b(1)" name="B1" />
            <blockpin signalname="b(2)" name="B2" />
            <blockpin signalname="b(3)" name="B3" />
            <blockpin name="GT" />
            <blockpin signalname="smaller" name="LT" />
        </block>
        <block symbolname="add4" name="XLXI_26">
            <blockpin signalname="a(0)" name="A0" />
            <blockpin signalname="a(1)" name="A1" />
            <blockpin signalname="a(2)" name="A2" />
            <blockpin signalname="a(3)" name="A3" />
            <blockpin signalname="XLXN_68" name="B0" />
            <blockpin signalname="XLXN_69" name="B1" />
            <blockpin signalname="XLXN_72" name="B2" />
            <blockpin signalname="XLXN_73" name="B3" />
            <blockpin signalname="M" name="CI" />
            <blockpin signalname="cout" name="CO" />
            <blockpin name="OFL" />
            <blockpin signalname="XLXN_361" name="S0" />
            <blockpin signalname="XLXN_362" name="S1" />
            <blockpin signalname="XLXN_354" name="S2" />
            <blockpin signalname="XLXN_355" name="S3" />
        </block>
        <block symbolname="and2" name="XLXI_121">
            <blockpin signalname="smaller" name="I0" />
            <blockpin signalname="M" name="I1" />
            <blockpin signalname="XLXN_413" name="O" />
        </block>
        <block symbolname="m2_1" name="XLXI_127">
            <blockpin signalname="XLXN_361" name="D0" />
            <blockpin signalname="XLXN_324" name="D1" />
            <blockpin signalname="XLXN_413" name="S0" />
            <blockpin signalname="t0" name="O" />
        </block>
        <block symbolname="m2_1" name="XLXI_128">
            <blockpin signalname="XLXN_362" name="D0" />
            <blockpin signalname="XLXN_325" name="D1" />
            <blockpin signalname="XLXN_413" name="S0" />
            <blockpin signalname="t1" name="O" />
        </block>
        <block symbolname="m2_1" name="XLXI_129">
            <blockpin signalname="XLXN_354" name="D0" />
            <blockpin signalname="XLXN_326" name="D1" />
            <blockpin signalname="XLXN_413" name="S0" />
            <blockpin signalname="t2" name="O" />
        </block>
        <block symbolname="m2_1" name="XLXI_130">
            <blockpin signalname="XLXN_355" name="D0" />
            <blockpin signalname="XLXN_327" name="D1" />
            <blockpin signalname="XLXN_413" name="S0" />
            <blockpin signalname="t3" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_135">
            <blockpin signalname="XLXN_361" name="I" />
            <blockpin signalname="XLXN_324" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_136">
            <blockpin signalname="XLXN_362" name="I" />
            <blockpin signalname="XLXN_325" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_137">
            <blockpin signalname="XLXN_354" name="I" />
            <blockpin signalname="XLXN_326" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_138">
            <blockpin signalname="XLXN_355" name="I" />
            <blockpin signalname="XLXN_327" name="O" />
        </block>
        <block symbolname="m2_1" name="XLXI_166">
            <blockpin signalname="cout" name="D0" />
            <blockpin signalname="XLXN_374" name="D1" />
            <blockpin signalname="M" name="S0" />
            <blockpin signalname="s(4)" name="O" />
        </block>
        <block symbolname="constant" name="XLXI_167">
            <attr value="00000000" name="CValue">
                <trait delete="all:1 sym:0" />
                <trait editname="all:1 sch:0" />
                <trait valuetype="BitVector 32 Hexadecimal" />
            </attr>
            <blockpin signalname="XLXN_374" name="O" />
        </block>
        <block symbolname="constant" name="XLXI_117">
            <attr value="00000000" name="CValue">
                <trait delete="all:1 sym:0" />
                <trait editname="all:1 sch:0" />
                <trait valuetype="BitVector 32 Hexadecimal" />
            </attr>
            <blockpin signalname="XLXN_300" name="O" />
        </block>
        <block symbolname="constant" name="XLXI_118">
            <attr value="00000000" name="CValue">
                <trait delete="all:1 sym:0" />
                <trait editname="all:1 sch:0" />
                <trait valuetype="BitVector 32 Hexadecimal" />
            </attr>
            <blockpin signalname="XLXN_301" name="O" />
        </block>
        <block symbolname="constant" name="XLXI_119">
            <attr value="00000000" name="CValue">
                <trait delete="all:1 sym:0" />
                <trait editname="all:1 sch:0" />
                <trait valuetype="BitVector 32 Hexadecimal" />
            </attr>
            <blockpin signalname="XLXN_302" name="O" />
        </block>
        <block symbolname="constant" name="XLXI_120">
            <attr value="00000000" name="CValue">
                <trait delete="all:1 sym:0" />
                <trait editname="all:1 sch:0" />
                <trait valuetype="BitVector 32 Hexadecimal" />
            </attr>
            <blockpin signalname="XLXN_303" name="O" />
        </block>
        <block symbolname="add4" name="XLXI_116">
            <blockpin signalname="t0" name="A0" />
            <blockpin signalname="t1" name="A1" />
            <blockpin signalname="t2" name="A2" />
            <blockpin signalname="t3" name="A3" />
            <blockpin signalname="XLXN_300" name="B0" />
            <blockpin signalname="XLXN_301" name="B1" />
            <blockpin signalname="XLXN_302" name="B2" />
            <blockpin signalname="XLXN_303" name="B3" />
            <blockpin signalname="XLXN_413" name="CI" />
            <blockpin name="CO" />
            <blockpin name="OFL" />
            <blockpin signalname="s(0)" name="S0" />
            <blockpin signalname="s(1)" name="S1" />
            <blockpin signalname="s(2)" name="S2" />
            <blockpin signalname="s(3)" name="S3" />
        </block>
        <block symbolname="and2" name="XLXI_169">
            <blockpin signalname="smaller" name="I0" />
            <blockpin signalname="M" name="I1" />
            <blockpin signalname="sign" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="a(3:0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="160" y="240" type="branch" />
            <wire x2="320" y1="240" y2="240" x1="160" />
            <wire x2="320" y1="240" y2="320" x1="320" />
            <wire x2="320" y1="320" y2="400" x1="320" />
            <wire x2="320" y1="400" y2="480" x1="320" />
            <wire x2="320" y1="480" y2="560" x1="320" />
            <wire x2="320" y1="560" y2="640" x1="320" />
        </branch>
        <branch name="b(3:0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="160" y="720" type="branch" />
            <wire x2="320" y1="720" y2="720" x1="160" />
            <wire x2="320" y1="720" y2="800" x1="320" />
            <wire x2="320" y1="800" y2="880" x1="320" />
            <wire x2="320" y1="880" y2="960" x1="320" />
            <wire x2="320" y1="960" y2="1040" x1="320" />
            <wire x2="320" y1="1040" y2="1120" x1="320" />
        </branch>
        <branch name="s(4:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="320" y="1200" type="branch" />
            <wire x2="320" y1="1200" y2="1200" x1="160" />
            <wire x2="160" y1="1200" y2="1280" x1="160" />
            <wire x2="160" y1="1280" y2="1360" x1="160" />
            <wire x2="160" y1="1360" y2="1440" x1="160" />
            <wire x2="160" y1="1440" y2="1520" x1="160" />
            <wire x2="160" y1="1520" y2="1600" x1="160" />
            <wire x2="160" y1="1600" y2="1680" x1="160" />
        </branch>
        <bustap x2="416" y1="320" y2="320" x1="320" />
        <branch name="a(3)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="450" y="320" type="branch" />
            <wire x2="448" y1="320" y2="320" x1="416" />
            <wire x2="480" y1="320" y2="320" x1="448" />
        </branch>
        <bustap x2="416" y1="400" y2="400" x1="320" />
        <branch name="a(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="448" y="400" type="branch" />
            <wire x2="448" y1="400" y2="400" x1="416" />
            <wire x2="480" y1="400" y2="400" x1="448" />
        </branch>
        <bustap x2="416" y1="480" y2="480" x1="320" />
        <branch name="a(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="448" y="480" type="branch" />
            <wire x2="448" y1="480" y2="480" x1="416" />
            <wire x2="480" y1="480" y2="480" x1="448" />
        </branch>
        <bustap x2="416" y1="560" y2="560" x1="320" />
        <branch name="a(0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="446" y="560" type="branch" />
            <wire x2="448" y1="560" y2="560" x1="416" />
            <wire x2="480" y1="560" y2="560" x1="448" />
        </branch>
        <bustap x2="416" y1="800" y2="800" x1="320" />
        <branch name="b(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="448" y="800" type="branch" />
            <wire x2="448" y1="800" y2="800" x1="416" />
            <wire x2="480" y1="800" y2="800" x1="448" />
        </branch>
        <bustap x2="416" y1="880" y2="880" x1="320" />
        <branch name="b(2)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="446" y="880" type="branch" />
            <wire x2="448" y1="880" y2="880" x1="416" />
            <wire x2="480" y1="880" y2="880" x1="448" />
        </branch>
        <bustap x2="416" y1="960" y2="960" x1="320" />
        <branch name="b(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="448" y="960" type="branch" />
            <wire x2="448" y1="960" y2="960" x1="416" />
            <wire x2="480" y1="960" y2="960" x1="448" />
        </branch>
        <bustap x2="416" y1="1040" y2="1040" x1="320" />
        <branch name="b(0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="446" y="1040" type="branch" />
            <wire x2="448" y1="1040" y2="1040" x1="416" />
            <wire x2="480" y1="1040" y2="1040" x1="448" />
        </branch>
        <bustap x2="256" y1="1280" y2="1280" x1="160" />
        <branch name="s(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="288" y="1280" type="branch" />
            <wire x2="288" y1="1280" y2="1280" x1="256" />
            <wire x2="320" y1="1280" y2="1280" x1="288" />
        </branch>
        <bustap x2="256" y1="1360" y2="1360" x1="160" />
        <branch name="s(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="288" y="1360" type="branch" />
            <wire x2="288" y1="1360" y2="1360" x1="256" />
            <wire x2="320" y1="1360" y2="1360" x1="288" />
        </branch>
        <bustap x2="256" y1="1440" y2="1440" x1="160" />
        <branch name="s(2)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="284" y="1440" type="branch" />
            <wire x2="288" y1="1440" y2="1440" x1="256" />
            <wire x2="320" y1="1440" y2="1440" x1="288" />
        </branch>
        <bustap x2="256" y1="1520" y2="1520" x1="160" />
        <branch name="s(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="288" y="1520" type="branch" />
            <wire x2="288" y1="1520" y2="1520" x1="256" />
            <wire x2="320" y1="1520" y2="1520" x1="288" />
        </branch>
        <instance x="1072" y="720" name="XLXI_1" orien="R0" />
        <instance x="1072" y="960" name="XLXI_2" orien="R0" />
        <instance x="1072" y="1200" name="XLXI_3" orien="R0" />
        <instance x="1072" y="1440" name="XLXI_4" orien="R0" />
        <branch name="b(0)">
            <wire x2="1072" y1="560" y2="560" x1="1040" />
        </branch>
        <branch name="b(0)">
            <wire x2="1072" y1="624" y2="624" x1="1040" />
        </branch>
        <branch name="b(1)">
            <wire x2="1072" y1="800" y2="800" x1="1040" />
        </branch>
        <branch name="b(1)">
            <wire x2="1072" y1="864" y2="864" x1="1040" />
        </branch>
        <branch name="b(2)">
            <wire x2="1072" y1="1040" y2="1040" x1="1040" />
        </branch>
        <branch name="b(2)">
            <wire x2="1072" y1="1104" y2="1104" x1="1040" />
        </branch>
        <branch name="b(3)">
            <wire x2="1072" y1="1280" y2="1280" x1="1040" />
        </branch>
        <branch name="b(3)">
            <wire x2="1072" y1="1344" y2="1344" x1="1040" />
        </branch>
        <branch name="XLXN_38">
            <wire x2="1072" y1="688" y2="688" x1="1040" />
        </branch>
        <branch name="XLXN_39">
            <wire x2="1072" y1="928" y2="928" x1="1040" />
        </branch>
        <branch name="XLXN_40">
            <wire x2="1072" y1="1168" y2="1168" x1="1040" />
        </branch>
        <branch name="XLXN_41">
            <wire x2="1072" y1="1408" y2="1408" x1="1040" />
        </branch>
        <instance x="816" y="1440" name="XLXI_16" orien="R0" />
        <instance x="816" y="1200" name="XLXI_15" orien="R0" />
        <instance x="816" y="960" name="XLXI_14" orien="R0" />
        <instance x="816" y="720" name="XLXI_13" orien="R0" />
        <branch name="M">
            <wire x2="816" y1="688" y2="688" x1="784" />
        </branch>
        <branch name="M">
            <wire x2="816" y1="928" y2="928" x1="784" />
        </branch>
        <branch name="M">
            <wire x2="816" y1="1168" y2="1168" x1="784" />
        </branch>
        <branch name="M">
            <wire x2="816" y1="1408" y2="1408" x1="784" />
        </branch>
        <bustap x2="256" y1="1600" y2="1600" x1="160" />
        <branch name="s(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="288" y="1600" type="branch" />
            <wire x2="288" y1="1600" y2="1600" x1="256" />
            <wire x2="320" y1="1600" y2="1600" x1="288" />
        </branch>
        <instance x="976" y="2160" name="XLXI_25" orien="R0" />
        <branch name="a(0)">
            <wire x2="976" y1="1584" y2="1584" x1="944" />
        </branch>
        <branch name="a(1)">
            <wire x2="976" y1="1648" y2="1648" x1="944" />
        </branch>
        <branch name="a(2)">
            <wire x2="976" y1="1712" y2="1712" x1="944" />
        </branch>
        <branch name="a(3)">
            <wire x2="976" y1="1776" y2="1776" x1="944" />
        </branch>
        <branch name="b(0)">
            <wire x2="976" y1="1840" y2="1840" x1="944" />
        </branch>
        <branch name="b(1)">
            <wire x2="976" y1="1904" y2="1904" x1="944" />
        </branch>
        <branch name="b(2)">
            <wire x2="976" y1="1968" y2="1968" x1="944" />
        </branch>
        <branch name="b(3)">
            <wire x2="976" y1="2032" y2="2032" x1="944" />
        </branch>
        <branch name="smaller">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1408" y="1840" type="branch" />
            <wire x2="1408" y1="1840" y2="1840" x1="1360" />
            <wire x2="1440" y1="1840" y2="1840" x1="1408" />
        </branch>
        <instance x="1680" y="1232" name="XLXI_26" orien="R0" />
        <branch name="XLXN_68">
            <wire x2="1520" y1="592" y2="592" x1="1392" />
            <wire x2="1520" y1="592" y2="848" x1="1520" />
            <wire x2="1680" y1="848" y2="848" x1="1520" />
        </branch>
        <branch name="XLXN_69">
            <wire x2="1440" y1="832" y2="832" x1="1392" />
            <wire x2="1440" y1="832" y2="912" x1="1440" />
            <wire x2="1680" y1="912" y2="912" x1="1440" />
        </branch>
        <branch name="XLXN_72">
            <wire x2="1440" y1="1072" y2="1072" x1="1392" />
            <wire x2="1440" y1="976" y2="1072" x1="1440" />
            <wire x2="1680" y1="976" y2="976" x1="1440" />
        </branch>
        <branch name="XLXN_73">
            <wire x2="1520" y1="1312" y2="1312" x1="1392" />
            <wire x2="1520" y1="1040" y2="1312" x1="1520" />
            <wire x2="1680" y1="1040" y2="1040" x1="1520" />
        </branch>
        <branch name="a(0)">
            <wire x2="1680" y1="528" y2="528" x1="1648" />
        </branch>
        <branch name="a(1)">
            <wire x2="1680" y1="592" y2="592" x1="1648" />
        </branch>
        <branch name="a(2)">
            <wire x2="1680" y1="656" y2="656" x1="1648" />
        </branch>
        <branch name="a(3)">
            <wire x2="1680" y1="720" y2="720" x1="1648" />
        </branch>
        <branch name="M">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1600" y="400" type="branch" />
            <wire x2="1680" y1="400" y2="400" x1="1600" />
        </branch>
        <iomarker fontsize="28" x="1040" y="560" name="b(0)" orien="R180" />
        <iomarker fontsize="28" x="1040" y="624" name="b(0)" orien="R180" />
        <iomarker fontsize="28" x="1040" y="800" name="b(1)" orien="R180" />
        <iomarker fontsize="28" x="1040" y="864" name="b(1)" orien="R180" />
        <iomarker fontsize="28" x="1040" y="1040" name="b(2)" orien="R180" />
        <iomarker fontsize="28" x="1040" y="1104" name="b(2)" orien="R180" />
        <iomarker fontsize="28" x="1040" y="1280" name="b(3)" orien="R180" />
        <iomarker fontsize="28" x="1040" y="1344" name="b(3)" orien="R180" />
        <iomarker fontsize="28" x="784" y="688" name="M" orien="R180" />
        <iomarker fontsize="28" x="784" y="928" name="M" orien="R180" />
        <iomarker fontsize="28" x="784" y="1168" name="M" orien="R180" />
        <iomarker fontsize="28" x="784" y="1408" name="M" orien="R180" />
        <iomarker fontsize="28" x="944" y="1584" name="a(0)" orien="R180" />
        <iomarker fontsize="28" x="944" y="1648" name="a(1)" orien="R180" />
        <iomarker fontsize="28" x="944" y="1712" name="a(2)" orien="R180" />
        <iomarker fontsize="28" x="944" y="1776" name="a(3)" orien="R180" />
        <iomarker fontsize="28" x="944" y="1840" name="b(0)" orien="R180" />
        <iomarker fontsize="28" x="944" y="1904" name="b(1)" orien="R180" />
        <iomarker fontsize="28" x="944" y="1968" name="b(2)" orien="R180" />
        <iomarker fontsize="28" x="944" y="2032" name="b(3)" orien="R180" />
        <iomarker fontsize="28" x="1648" y="528" name="a(0)" orien="R180" />
        <iomarker fontsize="28" x="1648" y="592" name="a(1)" orien="R180" />
        <iomarker fontsize="28" x="1648" y="656" name="a(2)" orien="R180" />
        <iomarker fontsize="28" x="1648" y="720" name="a(3)" orien="R180" />
        <branch name="M">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2240" y="240" type="branch" />
            <wire x2="2320" y1="240" y2="240" x1="2240" />
        </branch>
        <branch name="smaller">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2240" y="304" type="branch" />
            <wire x2="2320" y1="304" y2="304" x1="2240" />
        </branch>
        <instance x="2320" y="368" name="XLXI_121" orien="R0" />
        <instance x="2960" y="560" name="XLXI_127" orien="R0" />
        <instance x="2960" y="800" name="XLXI_128" orien="R0" />
        <instance x="2960" y="1040" name="XLXI_129" orien="R0" />
        <instance x="2960" y="1280" name="XLXI_130" orien="R0" />
        <branch name="XLXN_324">
            <wire x2="2960" y1="464" y2="464" x1="2928" />
        </branch>
        <instance x="2704" y="496" name="XLXI_135" orien="R0" />
        <branch name="XLXN_325">
            <wire x2="2960" y1="704" y2="704" x1="2928" />
        </branch>
        <instance x="2704" y="736" name="XLXI_136" orien="R0" />
        <branch name="XLXN_326">
            <wire x2="2960" y1="944" y2="944" x1="2928" />
        </branch>
        <instance x="2704" y="976" name="XLXI_137" orien="R0" />
        <branch name="XLXN_327">
            <wire x2="2960" y1="1184" y2="1184" x1="2928" />
        </branch>
        <instance x="2704" y="1216" name="XLXI_138" orien="R0" />
        <branch name="XLXN_354">
            <wire x2="2480" y1="816" y2="816" x1="2128" />
            <wire x2="2480" y1="816" y2="880" x1="2480" />
            <wire x2="2480" y1="880" y2="944" x1="2480" />
            <wire x2="2704" y1="944" y2="944" x1="2480" />
            <wire x2="2960" y1="880" y2="880" x1="2480" />
        </branch>
        <branch name="XLXN_355">
            <wire x2="2400" y1="880" y2="880" x1="2128" />
            <wire x2="2400" y1="880" y2="1120" x1="2400" />
            <wire x2="2400" y1="1120" y2="1184" x1="2400" />
            <wire x2="2704" y1="1184" y2="1184" x1="2400" />
            <wire x2="2960" y1="1120" y2="1120" x1="2400" />
        </branch>
        <branch name="cout">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2192" y="1168" type="branch" />
            <wire x2="2192" y1="1168" y2="1168" x1="2128" />
            <wire x2="2224" y1="1168" y2="1168" x1="2192" />
        </branch>
        <branch name="XLXN_361">
            <wire x2="2400" y1="688" y2="688" x1="2128" />
            <wire x2="2960" y1="400" y2="400" x1="2400" />
            <wire x2="2400" y1="400" y2="464" x1="2400" />
            <wire x2="2704" y1="464" y2="464" x1="2400" />
            <wire x2="2400" y1="464" y2="688" x1="2400" />
        </branch>
        <branch name="XLXN_362">
            <wire x2="2480" y1="752" y2="752" x1="2128" />
            <wire x2="2960" y1="640" y2="640" x1="2480" />
            <wire x2="2480" y1="640" y2="704" x1="2480" />
            <wire x2="2704" y1="704" y2="704" x1="2480" />
            <wire x2="2480" y1="704" y2="752" x1="2480" />
        </branch>
        <branch name="t0">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3327" y="432" type="branch" />
            <wire x2="3328" y1="432" y2="432" x1="3280" />
            <wire x2="3360" y1="432" y2="432" x1="3328" />
        </branch>
        <branch name="t1">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3328" y="672" type="branch" />
            <wire x2="3328" y1="672" y2="672" x1="3280" />
            <wire x2="3360" y1="672" y2="672" x1="3328" />
        </branch>
        <branch name="t2">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3328" y="912" type="branch" />
            <wire x2="3328" y1="912" y2="912" x1="3280" />
            <wire x2="3360" y1="912" y2="912" x1="3328" />
        </branch>
        <branch name="t3">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3327" y="1152" type="branch" />
            <wire x2="3328" y1="1152" y2="1152" x1="3280" />
            <wire x2="3360" y1="1152" y2="1152" x1="3328" />
        </branch>
        <instance x="1920" y="1600" name="XLXI_166" orien="R0" />
        <branch name="M">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1840" y="1568" type="branch" />
            <wire x2="1920" y1="1568" y2="1568" x1="1840" />
        </branch>
        <branch name="XLXN_374">
            <wire x2="1920" y1="1504" y2="1504" x1="1840" />
        </branch>
        <branch name="cout">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1696" y="1440" type="branch" />
            <wire x2="1920" y1="1440" y2="1440" x1="1696" />
        </branch>
        <branch name="s(4)">
            <wire x2="2272" y1="1472" y2="1472" x1="2240" />
        </branch>
        <iomarker fontsize="28" x="2272" y="1472" name="s(4)" orien="R0" />
        <instance x="1696" y="1472" name="XLXI_167" orien="R0">
        </instance>
        <branch name="XLXN_300">
            <wire x2="2800" y1="1888" y2="1888" x1="2768" />
        </branch>
        <instance x="2624" y="1856" name="XLXI_117" orien="R0">
        </instance>
        <branch name="XLXN_301">
            <wire x2="2800" y1="1952" y2="1952" x1="2768" />
        </branch>
        <instance x="2624" y="1920" name="XLXI_118" orien="R0">
        </instance>
        <branch name="XLXN_302">
            <wire x2="2800" y1="2016" y2="2016" x1="2768" />
        </branch>
        <instance x="2624" y="1984" name="XLXI_119" orien="R0">
        </instance>
        <branch name="XLXN_303">
            <wire x2="2800" y1="2080" y2="2080" x1="2768" />
        </branch>
        <instance x="2624" y="2048" name="XLXI_120" orien="R0">
        </instance>
        <branch name="s(0)">
            <wire x2="3280" y1="1728" y2="1728" x1="3248" />
        </branch>
        <branch name="s(1)">
            <wire x2="3280" y1="1792" y2="1792" x1="3248" />
        </branch>
        <branch name="s(2)">
            <wire x2="3280" y1="1856" y2="1856" x1="3248" />
        </branch>
        <branch name="s(3)">
            <wire x2="3280" y1="1920" y2="1920" x1="3248" />
        </branch>
        <branch name="t3">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2720" y="1760" type="branch" />
            <wire x2="2800" y1="1760" y2="1760" x1="2720" />
        </branch>
        <branch name="t2">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2720" y="1696" type="branch" />
            <wire x2="2800" y1="1696" y2="1696" x1="2720" />
        </branch>
        <branch name="t1">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2720" y="1632" type="branch" />
            <wire x2="2800" y1="1632" y2="1632" x1="2720" />
        </branch>
        <branch name="t0">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2720" y="1568" type="branch" />
            <wire x2="2800" y1="1568" y2="1568" x1="2720" />
        </branch>
        <iomarker fontsize="28" x="3280" y="1728" name="s(0)" orien="R0" />
        <iomarker fontsize="28" x="3280" y="1792" name="s(1)" orien="R0" />
        <iomarker fontsize="28" x="3280" y="1856" name="s(2)" orien="R0" />
        <iomarker fontsize="28" x="3280" y="1920" name="s(3)" orien="R0" />
        <instance x="2800" y="2272" name="XLXI_116" orien="R0" />
        <branch name="XLXN_413">
            <wire x2="2640" y1="272" y2="272" x1="2576" />
            <wire x2="2640" y1="272" y2="528" x1="2640" />
            <wire x2="2960" y1="528" y2="528" x1="2640" />
            <wire x2="2640" y1="528" y2="768" x1="2640" />
            <wire x2="2960" y1="768" y2="768" x1="2640" />
            <wire x2="2640" y1="768" y2="1008" x1="2640" />
            <wire x2="2960" y1="1008" y2="1008" x1="2640" />
            <wire x2="2640" y1="1008" y2="1248" x1="2640" />
            <wire x2="2960" y1="1248" y2="1248" x1="2640" />
            <wire x2="2640" y1="1248" y2="1440" x1="2640" />
            <wire x2="2800" y1="1440" y2="1440" x1="2640" />
        </branch>
        <instance x="1840" y="1808" name="XLXI_169" orien="R0" />
        <branch name="M">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1760" y="1680" type="branch" />
            <wire x2="1840" y1="1680" y2="1680" x1="1760" />
        </branch>
        <branch name="smaller">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1760" y="1744" type="branch" />
            <wire x2="1840" y1="1744" y2="1744" x1="1760" />
        </branch>
        <branch name="sign">
            <wire x2="2160" y1="1712" y2="1712" x1="2096" />
        </branch>
        <iomarker fontsize="28" x="2160" y="1712" name="sign" orien="R0" />
    </sheet>
</drawing>