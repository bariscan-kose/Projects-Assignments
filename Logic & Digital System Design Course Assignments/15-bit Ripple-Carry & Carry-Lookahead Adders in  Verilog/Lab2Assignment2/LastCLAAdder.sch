<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="B2_3" />
        <signal name="A2_3" />
        <signal name="B0_3" />
        <signal name="A0_3" />
        <signal name="XLXN_5" />
        <signal name="B1_3" />
        <signal name="A1_3" />
        <signal name="XLXN_42" />
        <signal name="XLXN_43" />
        <signal name="XLXN_48" />
        <signal name="XLXN_49" />
        <signal name="XLXN_50" />
        <signal name="S0_3" />
        <signal name="S1_3" />
        <signal name="S2_3" />
        <signal name="XLXN_16" />
        <signal name="P0_3" />
        <signal name="XLXN_18" />
        <signal name="G0_3" />
        <signal name="P2_3" />
        <signal name="C1_3" />
        <signal name="G1_3" />
        <signal name="XLXN_23" />
        <signal name="P1_3" />
        <signal name="XLXN_25" />
        <signal name="C0_3" />
        <signal name="G2_3" />
        <signal name="C2_3" />
        <signal name="C3_3">
        </signal>
        <signal name="XLXN_51" />
        <signal name="XLXN_52" />
        <signal name="XLXN_53" />
        <signal name="OVF" />
        <port polarity="Input" name="B2_3" />
        <port polarity="Input" name="A2_3" />
        <port polarity="Input" name="B0_3" />
        <port polarity="Input" name="A0_3" />
        <port polarity="Input" name="B1_3" />
        <port polarity="Input" name="A1_3" />
        <port polarity="Output" name="S0_3" />
        <port polarity="Output" name="S1_3" />
        <port polarity="Output" name="S2_3" />
        <port polarity="Input" name="C0_3" />
        <port polarity="Output" name="OVF" />
        <blockdef name="xor2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="60" y1="-128" y2="-128" x1="0" />
            <line x2="208" y1="-96" y2="-96" x1="256" />
            <arc ex="44" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <arc ex="64" ey="-144" sx="64" sy="-48" r="56" cx="32" cy="-96" />
            <line x2="64" y1="-144" y2="-144" x1="128" />
            <line x2="64" y1="-48" y2="-48" x1="128" />
            <arc ex="128" ey="-144" sx="208" sy="-96" r="88" cx="132" cy="-56" />
            <arc ex="208" ey="-96" sx="128" sy="-48" r="88" cx="132" cy="-136" />
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
        <blockdef name="and4">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-112" y2="-112" x1="144" />
            <arc ex="144" ey="-208" sx="144" sy="-112" r="48" cx="144" cy="-160" />
            <line x2="144" y1="-208" y2="-208" x1="64" />
            <line x2="64" y1="-64" y2="-256" x1="64" />
            <line x2="192" y1="-160" y2="-160" x1="256" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-64" y2="-64" x1="0" />
        </blockdef>
        <blockdef name="and3">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="192" y1="-128" y2="-128" x1="256" />
            <line x2="144" y1="-176" y2="-176" x1="64" />
            <line x2="64" y1="-80" y2="-80" x1="144" />
            <arc ex="144" ey="-176" sx="144" sy="-80" r="48" cx="144" cy="-128" />
            <line x2="64" y1="-64" y2="-192" x1="64" />
        </blockdef>
        <blockdef name="or4">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="48" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="48" y1="-256" y2="-256" x1="0" />
            <line x2="192" y1="-160" y2="-160" x1="256" />
            <arc ex="112" ey="-208" sx="192" sy="-160" r="88" cx="116" cy="-120" />
            <line x2="48" y1="-208" y2="-208" x1="112" />
            <line x2="48" y1="-112" y2="-112" x1="112" />
            <line x2="48" y1="-256" y2="-208" x1="48" />
            <line x2="48" y1="-64" y2="-112" x1="48" />
            <arc ex="48" ey="-208" sx="48" sy="-112" r="56" cx="16" cy="-160" />
            <arc ex="192" ey="-160" sx="112" sy="-112" r="88" cx="116" cy="-200" />
        </blockdef>
        <block symbolname="xor2" name="XLXI_2">
            <blockpin signalname="B2_3" name="I0" />
            <blockpin signalname="A2_3" name="I1" />
            <blockpin signalname="P2_3" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_3">
            <blockpin signalname="B2_3" name="I0" />
            <blockpin signalname="A2_3" name="I1" />
            <blockpin signalname="G2_3" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_1">
            <blockpin signalname="B0_3" name="I0" />
            <blockpin signalname="A0_3" name="I1" />
            <blockpin signalname="G0_3" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_5">
            <blockpin signalname="C0_3" name="I0" />
            <blockpin signalname="P0_3" name="I1" />
            <blockpin signalname="XLXN_5" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_6">
            <blockpin signalname="B1_3" name="I0" />
            <blockpin signalname="A1_3" name="I1" />
            <blockpin signalname="P1_3" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_7">
            <blockpin signalname="B1_3" name="I0" />
            <blockpin signalname="A1_3" name="I1" />
            <blockpin signalname="G1_3" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_8">
            <blockpin signalname="XLXN_5" name="I0" />
            <blockpin signalname="G0_3" name="I1" />
            <blockpin signalname="C1_3" name="O" />
        </block>
        <block symbolname="or3" name="XLXI_9">
            <blockpin signalname="XLXN_42" name="I0" />
            <blockpin signalname="XLXN_43" name="I1" />
            <blockpin signalname="G1_3" name="I2" />
            <blockpin signalname="C2_3" name="O" />
        </block>
        <block symbolname="and4" name="XLXI_41">
            <blockpin signalname="P2_3" name="I0" />
            <blockpin signalname="P1_3" name="I1" />
            <blockpin signalname="P0_3" name="I2" />
            <blockpin signalname="C0_3" name="I3" />
            <blockpin signalname="XLXN_50" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_11">
            <blockpin signalname="B0_3" name="I0" />
            <blockpin signalname="A0_3" name="I1" />
            <blockpin signalname="P0_3" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_12">
            <blockpin signalname="G0_3" name="I0" />
            <blockpin signalname="P1_3" name="I1" />
            <blockpin signalname="XLXN_42" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_20">
            <blockpin signalname="C0_3" name="I0" />
            <blockpin signalname="P0_3" name="I1" />
            <blockpin signalname="P1_3" name="I2" />
            <blockpin signalname="XLXN_43" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_40">
            <blockpin signalname="P2_3" name="I0" />
            <blockpin signalname="P1_3" name="I1" />
            <blockpin signalname="G0_3" name="I2" />
            <blockpin signalname="XLXN_49" name="O" />
        </block>
        <block symbolname="or4" name="XLXI_15">
            <blockpin signalname="XLXN_48" name="I0" />
            <blockpin signalname="XLXN_49" name="I1" />
            <blockpin signalname="XLXN_50" name="I2" />
            <blockpin signalname="G2_3" name="I3" />
            <blockpin signalname="C3_3" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_21">
            <blockpin signalname="P2_3" name="I0" />
            <blockpin signalname="G1_3" name="I1" />
            <blockpin signalname="XLXN_48" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_44">
            <blockpin signalname="P0_3" name="I0" />
            <blockpin signalname="C0_3" name="I1" />
            <blockpin signalname="S0_3" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_45">
            <blockpin signalname="P1_3" name="I0" />
            <blockpin signalname="C1_3" name="I1" />
            <blockpin signalname="S1_3" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_46">
            <blockpin signalname="P2_3" name="I0" />
            <blockpin signalname="C2_3" name="I1" />
            <blockpin signalname="S2_3" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_47">
            <blockpin signalname="C2_3" name="I0" />
            <blockpin signalname="C3_3" name="I1" />
            <blockpin signalname="OVF" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="B2_3">
            <wire x2="912" y1="592" y2="592" x1="848" />
            <wire x2="912" y1="592" y2="752" x1="912" />
            <wire x2="1040" y1="752" y2="752" x1="912" />
            <wire x2="1040" y1="592" y2="592" x1="912" />
        </branch>
        <branch name="A2_3">
            <wire x2="992" y1="528" y2="528" x1="848" />
            <wire x2="1040" y1="528" y2="528" x1="992" />
            <wire x2="992" y1="528" y2="688" x1="992" />
            <wire x2="1040" y1="688" y2="688" x1="992" />
        </branch>
        <branch name="B0_3">
            <wire x2="896" y1="2192" y2="2192" x1="832" />
            <wire x2="896" y1="2192" y2="2352" x1="896" />
            <wire x2="1024" y1="2352" y2="2352" x1="896" />
            <wire x2="1024" y1="2192" y2="2192" x1="896" />
        </branch>
        <branch name="A0_3">
            <wire x2="976" y1="2128" y2="2128" x1="832" />
            <wire x2="976" y1="2128" y2="2288" x1="976" />
            <wire x2="1024" y1="2288" y2="2288" x1="976" />
            <wire x2="1024" y1="2128" y2="2128" x1="976" />
        </branch>
        <branch name="XLXN_5">
            <wire x2="1904" y1="2384" y2="2384" x1="1840" />
        </branch>
        <branch name="B1_3">
            <wire x2="880" y1="1520" y2="1520" x1="816" />
            <wire x2="880" y1="1520" y2="1680" x1="880" />
            <wire x2="1008" y1="1680" y2="1680" x1="880" />
            <wire x2="1008" y1="1520" y2="1520" x1="880" />
        </branch>
        <branch name="A1_3">
            <wire x2="960" y1="1456" y2="1456" x1="816" />
            <wire x2="1008" y1="1456" y2="1456" x1="960" />
            <wire x2="960" y1="1456" y2="1616" x1="960" />
            <wire x2="1008" y1="1616" y2="1616" x1="960" />
        </branch>
        <branch name="XLXN_42">
            <wire x2="1968" y1="2176" y2="2176" x1="1840" />
            <wire x2="1968" y1="2096" y2="2176" x1="1968" />
        </branch>
        <branch name="XLXN_43">
            <wire x2="1904" y1="1984" y2="1984" x1="1840" />
            <wire x2="1904" y1="1984" y2="2032" x1="1904" />
            <wire x2="1968" y1="2032" y2="2032" x1="1904" />
        </branch>
        <branch name="XLXN_48">
            <wire x2="1984" y1="1744" y2="1744" x1="1824" />
            <wire x2="1984" y1="1632" y2="1744" x1="1984" />
        </branch>
        <branch name="XLXN_49">
            <wire x2="1984" y1="1568" y2="1568" x1="1824" />
        </branch>
        <branch name="XLXN_50">
            <wire x2="1904" y1="1344" y2="1344" x1="1824" />
            <wire x2="1904" y1="1344" y2="1504" x1="1904" />
            <wire x2="1984" y1="1504" y2="1504" x1="1904" />
        </branch>
        <branch name="S0_3">
            <wire x2="1920" y1="976" y2="976" x1="1888" />
        </branch>
        <branch name="S1_3">
            <wire x2="1920" y1="720" y2="720" x1="1888" />
        </branch>
        <branch name="S2_3">
            <wire x2="1920" y1="480" y2="480" x1="1888" />
        </branch>
        <branch name="P0_3">
            <wire x2="1328" y1="2160" y2="2160" x1="1280" />
            <wire x2="1328" y1="2160" y2="2352" x1="1328" />
            <wire x2="1584" y1="2352" y2="2352" x1="1328" />
            <wire x2="1328" y1="1008" y2="1312" x1="1328" />
            <wire x2="1328" y1="1312" y2="1984" x1="1328" />
            <wire x2="1328" y1="1984" y2="2160" x1="1328" />
            <wire x2="1584" y1="1984" y2="1984" x1="1328" />
            <wire x2="1568" y1="1312" y2="1312" x1="1328" />
            <wire x2="1632" y1="1008" y2="1008" x1="1328" />
        </branch>
        <branch name="G0_3">
            <wire x2="1312" y1="2320" y2="2320" x1="1280" />
            <wire x2="1904" y1="2320" y2="2320" x1="1312" />
            <wire x2="1312" y1="1504" y2="2208" x1="1312" />
            <wire x2="1312" y1="2208" y2="2320" x1="1312" />
            <wire x2="1584" y1="2208" y2="2208" x1="1312" />
            <wire x2="1568" y1="1504" y2="1504" x1="1312" />
        </branch>
        <branch name="P2_3">
            <wire x2="1392" y1="560" y2="560" x1="1296" />
            <wire x2="1392" y1="560" y2="1440" x1="1392" />
            <wire x2="1392" y1="1440" y2="1632" x1="1392" />
            <wire x2="1568" y1="1632" y2="1632" x1="1392" />
            <wire x2="1392" y1="1632" y2="1776" x1="1392" />
            <wire x2="1568" y1="1776" y2="1776" x1="1392" />
            <wire x2="1568" y1="1440" y2="1440" x1="1392" />
            <wire x2="1392" y1="512" y2="560" x1="1392" />
            <wire x2="1632" y1="512" y2="512" x1="1392" />
        </branch>
        <branch name="C1_3">
            <wire x2="1408" y1="688" y2="1184" x1="1408" />
            <wire x2="2272" y1="1184" y2="1184" x1="1408" />
            <wire x2="2272" y1="1184" y2="2352" x1="2272" />
            <wire x2="1632" y1="688" y2="688" x1="1408" />
            <wire x2="2272" y1="2352" y2="2352" x1="2160" />
        </branch>
        <branch name="G1_3">
            <wire x2="1344" y1="1648" y2="1648" x1="1264" />
            <wire x2="1344" y1="1648" y2="1712" x1="1344" />
            <wire x2="1568" y1="1712" y2="1712" x1="1344" />
            <wire x2="1344" y1="1712" y2="1840" x1="1344" />
            <wire x2="1968" y1="1840" y2="1840" x1="1344" />
            <wire x2="1968" y1="1840" y2="1968" x1="1968" />
        </branch>
        <branch name="P1_3">
            <wire x2="1360" y1="1488" y2="1488" x1="1264" />
            <wire x2="1360" y1="1488" y2="1568" x1="1360" />
            <wire x2="1568" y1="1568" y2="1568" x1="1360" />
            <wire x2="1360" y1="1568" y2="1920" x1="1360" />
            <wire x2="1584" y1="1920" y2="1920" x1="1360" />
            <wire x2="1360" y1="1920" y2="2144" x1="1360" />
            <wire x2="1584" y1="2144" y2="2144" x1="1360" />
            <wire x2="1632" y1="752" y2="752" x1="1360" />
            <wire x2="1360" y1="752" y2="1376" x1="1360" />
            <wire x2="1568" y1="1376" y2="1376" x1="1360" />
            <wire x2="1360" y1="1376" y2="1488" x1="1360" />
        </branch>
        <branch name="C0_3">
            <wire x2="1296" y1="2416" y2="2416" x1="832" />
            <wire x2="1584" y1="2416" y2="2416" x1="1296" />
            <wire x2="1296" y1="944" y2="1248" x1="1296" />
            <wire x2="1296" y1="1248" y2="2048" x1="1296" />
            <wire x2="1296" y1="2048" y2="2416" x1="1296" />
            <wire x2="1584" y1="2048" y2="2048" x1="1296" />
            <wire x2="1568" y1="1248" y2="1248" x1="1296" />
            <wire x2="1632" y1="944" y2="944" x1="1296" />
        </branch>
        <branch name="G2_3">
            <wire x2="1376" y1="720" y2="720" x1="1296" />
            <wire x2="1376" y1="720" y2="1216" x1="1376" />
            <wire x2="1984" y1="1216" y2="1216" x1="1376" />
            <wire x2="1984" y1="1216" y2="1440" x1="1984" />
        </branch>
        <branch name="C2_3">
            <wire x2="1632" y1="448" y2="448" x1="1424" />
            <wire x2="1424" y1="448" y2="1168" x1="1424" />
            <wire x2="2288" y1="1168" y2="1168" x1="1424" />
            <wire x2="2288" y1="1168" y2="2032" x1="2288" />
            <wire x2="2416" y1="2032" y2="2032" x1="2288" />
            <wire x2="2288" y1="2032" y2="2032" x1="2224" />
            <wire x2="2416" y1="1744" y2="2032" x1="2416" />
            <wire x2="2560" y1="1744" y2="1744" x1="2416" />
        </branch>
        <instance x="1040" y="656" name="XLXI_2" orien="R0" />
        <instance x="1040" y="816" name="XLXI_3" orien="R0" />
        <instance x="1024" y="2416" name="XLXI_1" orien="R0" />
        <instance x="1584" y="2480" name="XLXI_5" orien="R0" />
        <instance x="1008" y="1584" name="XLXI_6" orien="R0" />
        <instance x="1008" y="1744" name="XLXI_7" orien="R0" />
        <instance x="1904" y="2448" name="XLXI_8" orien="R0" />
        <instance x="1968" y="2160" name="XLXI_9" orien="R0" />
        <instance x="1568" y="1504" name="XLXI_41" orien="R0" />
        <instance x="1024" y="2256" name="XLXI_11" orien="R0" />
        <instance x="1584" y="2272" name="XLXI_12" orien="R0" />
        <instance x="1584" y="2112" name="XLXI_20" orien="R0" />
        <instance x="1568" y="1696" name="XLXI_40" orien="R0" />
        <instance x="1984" y="1696" name="XLXI_15" orien="R0" />
        <instance x="1568" y="1840" name="XLXI_21" orien="R0" />
        <instance x="1632" y="1072" name="XLXI_44" orien="R0" />
        <instance x="1632" y="816" name="XLXI_45" orien="R0" />
        <instance x="1632" y="576" name="XLXI_46" orien="R0" />
        <iomarker fontsize="28" x="848" y="528" name="A2_3" orien="R180" />
        <iomarker fontsize="28" x="848" y="592" name="B2_3" orien="R180" />
        <iomarker fontsize="28" x="832" y="2128" name="A0_3" orien="R180" />
        <iomarker fontsize="28" x="832" y="2192" name="B0_3" orien="R180" />
        <iomarker fontsize="28" x="832" y="2416" name="C0_3" orien="R180" />
        <iomarker fontsize="28" x="816" y="1456" name="A1_3" orien="R180" />
        <iomarker fontsize="28" x="816" y="1520" name="B1_3" orien="R180" />
        <iomarker fontsize="28" x="1920" y="976" name="S0_3" orien="R0" />
        <iomarker fontsize="28" x="1920" y="720" name="S1_3" orien="R0" />
        <iomarker fontsize="28" x="1920" y="480" name="S2_3" orien="R0" />
        <branch name="C3_3">
            <wire x2="2256" y1="1536" y2="1536" x1="2240" />
            <wire x2="2256" y1="1536" y2="1600" x1="2256" />
            <wire x2="2448" y1="1600" y2="1600" x1="2256" />
            <wire x2="2448" y1="1600" y2="1680" x1="2448" />
            <wire x2="2560" y1="1680" y2="1680" x1="2448" />
        </branch>
        <instance x="2560" y="1808" name="XLXI_47" orien="R0" />
        <branch name="OVF">
            <wire x2="2848" y1="1712" y2="1712" x1="2816" />
        </branch>
        <iomarker fontsize="28" x="2848" y="1712" name="OVF" orien="R0" />
    </sheet>
</drawing>