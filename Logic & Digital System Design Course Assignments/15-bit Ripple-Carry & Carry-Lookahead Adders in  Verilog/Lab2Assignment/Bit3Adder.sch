<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="Sum" />
        <signal name="CarryI" />
        <signal name="A" />
        <signal name="B" />
        <signal name="XLXN_6" />
        <signal name="XLXN_7" />
        <signal name="XLXN_8" />
        <signal name="CarryO" />
        <port polarity="Output" name="Sum" />
        <port polarity="Input" name="CarryI" />
        <port polarity="Input" name="A" />
        <port polarity="Input" name="B" />
        <port polarity="Output" name="CarryO" />
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
            <blockpin signalname="B" name="I0" />
            <blockpin signalname="A" name="I1" />
            <blockpin signalname="CarryI" name="I2" />
            <blockpin signalname="Sum" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_2">
            <blockpin signalname="A" name="I0" />
            <blockpin signalname="CarryI" name="I1" />
            <blockpin signalname="XLXN_6" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_3">
            <blockpin signalname="B" name="I0" />
            <blockpin signalname="CarryI" name="I1" />
            <blockpin signalname="XLXN_7" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_4">
            <blockpin signalname="A" name="I0" />
            <blockpin signalname="B" name="I1" />
            <blockpin signalname="XLXN_8" name="O" />
        </block>
        <block symbolname="or3" name="XLXI_5">
            <blockpin signalname="XLXN_8" name="I0" />
            <blockpin signalname="XLXN_7" name="I1" />
            <blockpin signalname="XLXN_6" name="I2" />
            <blockpin signalname="CarryO" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1216" y="960" name="XLXI_1" orien="R0" />
        <branch name="Sum">
            <wire x2="1616" y1="832" y2="832" x1="1472" />
        </branch>
        <branch name="CarryI">
            <wire x2="1024" y1="768" y2="768" x1="992" />
            <wire x2="1216" y1="768" y2="768" x1="1024" />
            <wire x2="1024" y1="768" y2="1040" x1="1024" />
            <wire x2="1136" y1="1040" y2="1040" x1="1024" />
            <wire x2="1024" y1="1040" y2="1184" x1="1024" />
            <wire x2="1136" y1="1184" y2="1184" x1="1024" />
        </branch>
        <branch name="A">
            <wire x2="1056" y1="832" y2="832" x1="992" />
            <wire x2="1216" y1="832" y2="832" x1="1056" />
            <wire x2="1056" y1="832" y2="1104" x1="1056" />
            <wire x2="1136" y1="1104" y2="1104" x1="1056" />
            <wire x2="1056" y1="1104" y2="1392" x1="1056" />
            <wire x2="1136" y1="1392" y2="1392" x1="1056" />
        </branch>
        <branch name="B">
            <wire x2="1088" y1="896" y2="896" x1="992" />
            <wire x2="1200" y1="896" y2="896" x1="1088" />
            <wire x2="1216" y1="896" y2="896" x1="1200" />
            <wire x2="1088" y1="896" y2="1248" x1="1088" />
            <wire x2="1136" y1="1248" y2="1248" x1="1088" />
            <wire x2="1088" y1="1248" y2="1328" x1="1088" />
            <wire x2="1136" y1="1328" y2="1328" x1="1088" />
        </branch>
        <iomarker fontsize="28" x="1616" y="832" name="Sum" orien="R0" />
        <iomarker fontsize="28" x="992" y="768" name="CarryI" orien="R180" />
        <iomarker fontsize="28" x="992" y="832" name="A" orien="R180" />
        <iomarker fontsize="28" x="992" y="896" name="B" orien="R180" />
        <instance x="1136" y="1168" name="XLXI_2" orien="R0" />
        <instance x="1136" y="1312" name="XLXI_3" orien="R0" />
        <instance x="1136" y="1456" name="XLXI_4" orien="R0" />
        <instance x="1440" y="1344" name="XLXI_5" orien="R0" />
        <branch name="XLXN_6">
            <wire x2="1440" y1="1072" y2="1072" x1="1392" />
            <wire x2="1440" y1="1072" y2="1152" x1="1440" />
        </branch>
        <branch name="XLXN_7">
            <wire x2="1440" y1="1216" y2="1216" x1="1392" />
        </branch>
        <branch name="XLXN_8">
            <wire x2="1440" y1="1360" y2="1360" x1="1392" />
            <wire x2="1440" y1="1280" y2="1360" x1="1440" />
        </branch>
        <branch name="CarryO">
            <wire x2="1728" y1="1216" y2="1216" x1="1696" />
        </branch>
        <iomarker fontsize="28" x="1728" y="1216" name="CarryO" orien="R0" />
    </sheet>
</drawing>