<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="xc9500" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1" />
        <signal name="d" />
        <signal name="clk" />
        <signal name="rc" />
        <signal name="qc" />
        <signal name="qr" />
        <port polarity="Input" name="d" />
        <port polarity="Input" name="clk" />
        <port polarity="Input" name="rc" />
        <port polarity="Output" name="qc" />
        <port polarity="Output" name="qr" />
        <blockdef name="fdc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <rect width="256" x="64" y="-320" height="256" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <line x2="64" y1="-32" y2="-32" x1="192" />
        </blockdef>
        <blockdef name="fdr">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <rect width="256" x="64" y="-320" height="256" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <line x2="64" y1="-32" y2="-32" x1="192" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
        </blockdef>
        <block symbolname="fdc" name="XLXI_1">
            <blockpin signalname="clk" name="C" />
            <blockpin signalname="rc" name="CLR" />
            <blockpin signalname="d" name="D" />
            <blockpin signalname="qc" name="Q" />
        </block>
        <block symbolname="fdr" name="XLXI_2">
            <blockpin signalname="clk" name="C" />
            <blockpin signalname="d" name="D" />
            <blockpin signalname="rc" name="R" />
            <blockpin signalname="qr" name="Q" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1200" y="1216" name="XLXI_1" orien="R0" />
        <instance x="1200" y="1616" name="XLXI_2" orien="R0" />
        <branch name="d">
            <wire x2="960" y1="960" y2="960" x1="880" />
            <wire x2="960" y1="960" y2="1360" x1="960" />
            <wire x2="1200" y1="1360" y2="1360" x1="960" />
            <wire x2="1200" y1="960" y2="960" x1="960" />
        </branch>
        <branch name="clk">
            <wire x2="1040" y1="1488" y2="1488" x1="960" />
            <wire x2="1200" y1="1488" y2="1488" x1="1040" />
            <wire x2="1040" y1="1088" y2="1488" x1="1040" />
            <wire x2="1200" y1="1088" y2="1088" x1="1040" />
        </branch>
        <branch name="rc">
            <wire x2="1120" y1="1584" y2="1584" x1="1040" />
            <wire x2="1200" y1="1584" y2="1584" x1="1120" />
            <wire x2="1200" y1="1184" y2="1184" x1="1120" />
            <wire x2="1120" y1="1184" y2="1584" x1="1120" />
        </branch>
        <iomarker fontsize="28" x="880" y="960" name="d" orien="R180" />
        <iomarker fontsize="28" x="960" y="1488" name="clk" orien="R180" />
        <iomarker fontsize="28" x="1040" y="1584" name="rc" orien="R180" />
        <branch name="qc">
            <wire x2="1616" y1="960" y2="960" x1="1584" />
        </branch>
        <iomarker fontsize="28" x="1616" y="960" name="qc" orien="R0" />
        <branch name="qr">
            <wire x2="1616" y1="1360" y2="1360" x1="1584" />
        </branch>
        <iomarker fontsize="28" x="1616" y="1360" name="qr" orien="R0" />
    </sheet>
</drawing>