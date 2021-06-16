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
        <signal name="XLXN_5" />
        <signal name="XLXN_6" />
        <signal name="XLXN_7" />
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
            <blockpin signalname="XLXN_5" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_3">
            <blockpin signalname="B" name="I0" />
            <blockpin signalname="CarryI" name="I1" />
            <blockpin signalname="XLXN_6" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_4">
            <blockpin signalname="A" name="I0" />
            <blockpin signalname="B" name="I1" />
            <blockpin signalname="XLXN_7" name="O" />
        </block>
        <block symbolname="or3" name="XLXI_5">
            <blockpin signalname="XLXN_7" name="I0" />
            <blockpin signalname="XLXN_6" name="I1" />
            <blockpin signalname="XLXN_5" name="I2" />
            <blockpin signalname="CarryO" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1392" y="1360" name="XLXI_1" orien="R0" />
        <branch name="Sum">
            <wire x2="1792" y1="1232" y2="1232" x1="1648" />
        </branch>
        <branch name="CarryI">
            <wire x2="1200" y1="1168" y2="1168" x1="1168" />
            <wire x2="1392" y1="1168" y2="1168" x1="1200" />
            <wire x2="1200" y1="1168" y2="1440" x1="1200" />
            <wire x2="1312" y1="1440" y2="1440" x1="1200" />
            <wire x2="1200" y1="1440" y2="1584" x1="1200" />
            <wire x2="1312" y1="1584" y2="1584" x1="1200" />
        </branch>
        <branch name="A">
            <wire x2="1232" y1="1232" y2="1232" x1="1168" />
            <wire x2="1392" y1="1232" y2="1232" x1="1232" />
            <wire x2="1232" y1="1232" y2="1504" x1="1232" />
            <wire x2="1312" y1="1504" y2="1504" x1="1232" />
            <wire x2="1232" y1="1504" y2="1792" x1="1232" />
            <wire x2="1312" y1="1792" y2="1792" x1="1232" />
        </branch>
        <branch name="B">
            <wire x2="1264" y1="1296" y2="1296" x1="1168" />
            <wire x2="1376" y1="1296" y2="1296" x1="1264" />
            <wire x2="1392" y1="1296" y2="1296" x1="1376" />
            <wire x2="1264" y1="1296" y2="1648" x1="1264" />
            <wire x2="1312" y1="1648" y2="1648" x1="1264" />
            <wire x2="1264" y1="1648" y2="1728" x1="1264" />
            <wire x2="1312" y1="1728" y2="1728" x1="1264" />
        </branch>
        <instance x="1312" y="1568" name="XLXI_2" orien="R0" />
        <instance x="1312" y="1712" name="XLXI_3" orien="R0" />
        <instance x="1312" y="1856" name="XLXI_4" orien="R0" />
        <instance x="1616" y="1744" name="XLXI_5" orien="R0" />
        <branch name="XLXN_5">
            <wire x2="1616" y1="1472" y2="1472" x1="1568" />
            <wire x2="1616" y1="1472" y2="1552" x1="1616" />
        </branch>
        <branch name="XLXN_6">
            <wire x2="1616" y1="1616" y2="1616" x1="1568" />
        </branch>
        <branch name="XLXN_7">
            <wire x2="1616" y1="1760" y2="1760" x1="1568" />
            <wire x2="1616" y1="1680" y2="1760" x1="1616" />
        </branch>
        <branch name="CarryO">
            <wire x2="1904" y1="1616" y2="1616" x1="1872" />
        </branch>
        <iomarker fontsize="28" x="1792" y="1232" name="Sum" orien="R0" />
        <iomarker fontsize="28" x="1168" y="1168" name="CarryI" orien="R180" />
        <iomarker fontsize="28" x="1168" y="1232" name="A" orien="R180" />
        <iomarker fontsize="28" x="1168" y="1296" name="B" orien="R180" />
        <iomarker fontsize="28" x="1904" y="1616" name="CarryO" orien="R0" />
    </sheet>
</drawing>