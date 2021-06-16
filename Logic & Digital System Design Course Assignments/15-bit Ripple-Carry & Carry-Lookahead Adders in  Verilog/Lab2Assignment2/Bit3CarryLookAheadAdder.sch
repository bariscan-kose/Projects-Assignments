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
        <signal name="C0_3" />
        <signal name="XLXN_16" />
        <signal name="B1_3" />
        <signal name="A1_3" />
        <signal name="P0_3" />
        <signal name="G1_3" />
        <signal name="G0_3" />
        <signal name="P1_3" />
        <signal name="P2_3" />
        <signal name="G2_3" />
        <signal name="XLXN_42" />
        <signal name="XLXN_43" />
        <signal name="C2_3" />
        <signal name="XLXN_48" />
        <signal name="XLXN_49" />
        <signal name="XLXN_50" />
        <signal name="C1_3" />
        <signal name="S0_3" />
        <signal name="S1_3" />
        <signal name="S2_3" />
        <signal name="C3_3" />
        <port polarity="Input" name="B2_3" />
        <port polarity="Input" name="A2_3" />
        <port polarity="Input" name="B0_3" />
        <port polarity="Input" name="A0_3" />
        <port polarity="Input" name="C0_3" />
        <port polarity="Input" name="B1_3" />
        <port polarity="Input" name="A1_3" />
        <port polarity="Output" name="S0_3" />
        <port polarity="Output" name="S1_3" />
        <port polarity="Output" name="S2_3" />
        <port polarity="Output" name="C3_3" />
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
        <block symbolname="or3" name="XLXI_16">
            <blockpin signalname="XLXN_42" name="I0" />
            <blockpin signalname="XLXN_43" name="I1" />
            <blockpin signalname="G1_3" name="I2" />
            <blockpin signalname="C2_3" name="O" />
        </block>
        <block symbolname="or4" name="XLXI_17">
            <blockpin signalname="XLXN_48" name="I0" />
            <blockpin signalname="XLXN_49" name="I1" />
            <blockpin signalname="XLXN_50" name="I2" />
            <blockpin signalname="G2_3" name="I3" />
            <blockpin signalname="C3_3" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_19">
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
        <block symbolname="and2" name="XLXI_21">
            <blockpin signalname="P2_3" name="I0" />
            <blockpin signalname="G1_3" name="I1" />
            <blockpin signalname="XLXN_48" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_7">
            <blockpin signalname="B2_3" name="I0" />
            <blockpin signalname="A2_3" name="I1" />
            <blockpin signalname="P2_3" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_3">
            <blockpin signalname="B2_3" name="I0" />
            <blockpin signalname="A2_3" name="I1" />
            <blockpin signalname="G2_3" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_5">
            <blockpin signalname="B0_3" name="I0" />
            <blockpin signalname="A0_3" name="I1" />
            <blockpin signalname="P0_3" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_1">
            <blockpin signalname="B0_3" name="I0" />
            <blockpin signalname="A0_3" name="I1" />
            <blockpin signalname="G0_3" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_14">
            <blockpin signalname="C0_3" name="I0" />
            <blockpin signalname="P0_3" name="I1" />
            <blockpin signalname="XLXN_16" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_15">
            <blockpin signalname="XLXN_16" name="I0" />
            <blockpin signalname="G0_3" name="I1" />
            <blockpin signalname="C1_3" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_6">
            <blockpin signalname="B1_3" name="I0" />
            <blockpin signalname="A1_3" name="I1" />
            <blockpin signalname="P1_3" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_2">
            <blockpin signalname="B1_3" name="I0" />
            <blockpin signalname="A1_3" name="I1" />
            <blockpin signalname="G1_3" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_40">
            <blockpin signalname="P2_3" name="I0" />
            <blockpin signalname="P1_3" name="I1" />
            <blockpin signalname="G0_3" name="I2" />
            <blockpin signalname="XLXN_49" name="O" />
        </block>
        <block symbolname="and4" name="XLXI_41">
            <blockpin signalname="P2_3" name="I0" />
            <blockpin signalname="P1_3" name="I1" />
            <blockpin signalname="P0_3" name="I2" />
            <blockpin signalname="C0_3" name="I3" />
            <blockpin signalname="XLXN_50" name="O" />
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
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="416" y="608" name="XLXI_7" orien="R0" />
        <instance x="416" y="768" name="XLXI_3" orien="R0" />
        <branch name="B2_3">
            <wire x2="288" y1="544" y2="544" x1="224" />
            <wire x2="288" y1="544" y2="704" x1="288" />
            <wire x2="416" y1="704" y2="704" x1="288" />
            <wire x2="416" y1="544" y2="544" x1="288" />
        </branch>
        <branch name="A2_3">
            <wire x2="368" y1="480" y2="480" x1="224" />
            <wire x2="416" y1="480" y2="480" x1="368" />
            <wire x2="368" y1="480" y2="640" x1="368" />
            <wire x2="416" y1="640" y2="640" x1="368" />
        </branch>
        <iomarker fontsize="28" x="224" y="480" name="A2_3" orien="R180" />
        <iomarker fontsize="28" x="224" y="544" name="B2_3" orien="R180" />
        <instance x="400" y="2368" name="XLXI_1" orien="R0" />
        <branch name="B0_3">
            <wire x2="272" y1="2144" y2="2144" x1="208" />
            <wire x2="272" y1="2144" y2="2304" x1="272" />
            <wire x2="400" y1="2304" y2="2304" x1="272" />
            <wire x2="400" y1="2144" y2="2144" x1="272" />
        </branch>
        <branch name="A0_3">
            <wire x2="352" y1="2080" y2="2080" x1="208" />
            <wire x2="352" y1="2080" y2="2240" x1="352" />
            <wire x2="400" y1="2240" y2="2240" x1="352" />
            <wire x2="400" y1="2080" y2="2080" x1="352" />
        </branch>
        <instance x="960" y="2432" name="XLXI_14" orien="R0" />
        <branch name="XLXN_16">
            <wire x2="1280" y1="2336" y2="2336" x1="1216" />
        </branch>
        <iomarker fontsize="28" x="208" y="2080" name="A0_3" orien="R180" />
        <iomarker fontsize="28" x="208" y="2144" name="B0_3" orien="R180" />
        <iomarker fontsize="28" x="208" y="2368" name="C0_3" orien="R180" />
        <instance x="384" y="1536" name="XLXI_6" orien="R0" />
        <instance x="384" y="1696" name="XLXI_2" orien="R0" />
        <branch name="B1_3">
            <wire x2="256" y1="1472" y2="1472" x1="192" />
            <wire x2="256" y1="1472" y2="1632" x1="256" />
            <wire x2="384" y1="1632" y2="1632" x1="256" />
            <wire x2="384" y1="1472" y2="1472" x1="256" />
        </branch>
        <branch name="A1_3">
            <wire x2="336" y1="1408" y2="1408" x1="192" />
            <wire x2="384" y1="1408" y2="1408" x1="336" />
            <wire x2="336" y1="1408" y2="1568" x1="336" />
            <wire x2="384" y1="1568" y2="1568" x1="336" />
        </branch>
        <iomarker fontsize="28" x="192" y="1408" name="A1_3" orien="R180" />
        <iomarker fontsize="28" x="192" y="1472" name="B1_3" orien="R180" />
        <instance x="1280" y="2400" name="XLXI_15" orien="R0" />
        <instance x="1344" y="2112" name="XLXI_16" orien="R0" />
        <instance x="944" y="1456" name="XLXI_41" orien="R0" />
        <instance x="400" y="2208" name="XLXI_5" orien="R0" />
        <instance x="960" y="2224" name="XLXI_19" orien="R0" />
        <instance x="960" y="2064" name="XLXI_20" orien="R0" />
        <instance x="944" y="1648" name="XLXI_40" orien="R0" />
        <instance x="1360" y="1648" name="XLXI_17" orien="R0" />
        <branch name="XLXN_42">
            <wire x2="1344" y1="2128" y2="2128" x1="1216" />
            <wire x2="1344" y1="2048" y2="2128" x1="1344" />
        </branch>
        <branch name="XLXN_43">
            <wire x2="1280" y1="1936" y2="1936" x1="1216" />
            <wire x2="1280" y1="1936" y2="1984" x1="1280" />
            <wire x2="1344" y1="1984" y2="1984" x1="1280" />
        </branch>
        <instance x="944" y="1792" name="XLXI_21" orien="R0" />
        <branch name="XLXN_48">
            <wire x2="1360" y1="1696" y2="1696" x1="1200" />
            <wire x2="1360" y1="1584" y2="1696" x1="1360" />
        </branch>
        <branch name="XLXN_49">
            <wire x2="1360" y1="1520" y2="1520" x1="1200" />
        </branch>
        <branch name="XLXN_50">
            <wire x2="1280" y1="1296" y2="1296" x1="1200" />
            <wire x2="1280" y1="1296" y2="1456" x1="1280" />
            <wire x2="1360" y1="1456" y2="1456" x1="1280" />
        </branch>
        <instance x="1008" y="1024" name="XLXI_44" orien="R0" />
        <instance x="1008" y="768" name="XLXI_45" orien="R0" />
        <instance x="1008" y="528" name="XLXI_46" orien="R0" />
        <branch name="S0_3">
            <wire x2="1296" y1="928" y2="928" x1="1264" />
        </branch>
        <iomarker fontsize="28" x="1296" y="928" name="S0_3" orien="R0" />
        <branch name="S1_3">
            <wire x2="1296" y1="672" y2="672" x1="1264" />
        </branch>
        <iomarker fontsize="28" x="1296" y="672" name="S1_3" orien="R0" />
        <branch name="S2_3">
            <wire x2="1296" y1="432" y2="432" x1="1264" />
        </branch>
        <iomarker fontsize="28" x="1296" y="432" name="S2_3" orien="R0" />
        <branch name="P0_3">
            <wire x2="704" y1="2112" y2="2112" x1="656" />
            <wire x2="704" y1="2112" y2="2304" x1="704" />
            <wire x2="960" y1="2304" y2="2304" x1="704" />
            <wire x2="704" y1="960" y2="1264" x1="704" />
            <wire x2="704" y1="1264" y2="1936" x1="704" />
            <wire x2="704" y1="1936" y2="2112" x1="704" />
            <wire x2="960" y1="1936" y2="1936" x1="704" />
            <wire x2="944" y1="1264" y2="1264" x1="704" />
            <wire x2="1008" y1="960" y2="960" x1="704" />
        </branch>
        <branch name="G0_3">
            <wire x2="688" y1="2272" y2="2272" x1="656" />
            <wire x2="1280" y1="2272" y2="2272" x1="688" />
            <wire x2="688" y1="1456" y2="2160" x1="688" />
            <wire x2="688" y1="2160" y2="2272" x1="688" />
            <wire x2="960" y1="2160" y2="2160" x1="688" />
            <wire x2="944" y1="1456" y2="1456" x1="688" />
        </branch>
        <branch name="P2_3">
            <wire x2="768" y1="512" y2="512" x1="672" />
            <wire x2="768" y1="512" y2="1392" x1="768" />
            <wire x2="768" y1="1392" y2="1584" x1="768" />
            <wire x2="944" y1="1584" y2="1584" x1="768" />
            <wire x2="768" y1="1584" y2="1728" x1="768" />
            <wire x2="944" y1="1728" y2="1728" x1="768" />
            <wire x2="944" y1="1392" y2="1392" x1="768" />
            <wire x2="768" y1="464" y2="512" x1="768" />
            <wire x2="1008" y1="464" y2="464" x1="768" />
        </branch>
        <branch name="C1_3">
            <wire x2="784" y1="640" y2="1136" x1="784" />
            <wire x2="1648" y1="1136" y2="1136" x1="784" />
            <wire x2="1648" y1="1136" y2="2304" x1="1648" />
            <wire x2="1008" y1="640" y2="640" x1="784" />
            <wire x2="1648" y1="2304" y2="2304" x1="1536" />
        </branch>
        <branch name="G1_3">
            <wire x2="720" y1="1600" y2="1600" x1="640" />
            <wire x2="720" y1="1600" y2="1664" x1="720" />
            <wire x2="944" y1="1664" y2="1664" x1="720" />
            <wire x2="720" y1="1664" y2="1792" x1="720" />
            <wire x2="1344" y1="1792" y2="1792" x1="720" />
            <wire x2="1344" y1="1792" y2="1920" x1="1344" />
        </branch>
        <branch name="P1_3">
            <wire x2="736" y1="1440" y2="1440" x1="640" />
            <wire x2="736" y1="1440" y2="1520" x1="736" />
            <wire x2="944" y1="1520" y2="1520" x1="736" />
            <wire x2="736" y1="1520" y2="1872" x1="736" />
            <wire x2="960" y1="1872" y2="1872" x1="736" />
            <wire x2="736" y1="1872" y2="2096" x1="736" />
            <wire x2="960" y1="2096" y2="2096" x1="736" />
            <wire x2="1008" y1="704" y2="704" x1="736" />
            <wire x2="736" y1="704" y2="1328" x1="736" />
            <wire x2="944" y1="1328" y2="1328" x1="736" />
            <wire x2="736" y1="1328" y2="1440" x1="736" />
        </branch>
        <branch name="C0_3">
            <wire x2="672" y1="2368" y2="2368" x1="208" />
            <wire x2="960" y1="2368" y2="2368" x1="672" />
            <wire x2="672" y1="896" y2="1200" x1="672" />
            <wire x2="672" y1="1200" y2="2000" x1="672" />
            <wire x2="672" y1="2000" y2="2368" x1="672" />
            <wire x2="960" y1="2000" y2="2000" x1="672" />
            <wire x2="944" y1="1200" y2="1200" x1="672" />
            <wire x2="1008" y1="896" y2="896" x1="672" />
        </branch>
        <branch name="G2_3">
            <wire x2="752" y1="672" y2="672" x1="672" />
            <wire x2="752" y1="672" y2="1168" x1="752" />
            <wire x2="1360" y1="1168" y2="1168" x1="752" />
            <wire x2="1360" y1="1168" y2="1392" x1="1360" />
        </branch>
        <branch name="C2_3">
            <wire x2="1008" y1="400" y2="400" x1="800" />
            <wire x2="800" y1="400" y2="1120" x1="800" />
            <wire x2="1664" y1="1120" y2="1120" x1="800" />
            <wire x2="1664" y1="1120" y2="1984" x1="1664" />
            <wire x2="1664" y1="1984" y2="1984" x1="1600" />
        </branch>
        <iomarker fontsize="28" x="1248" y="192" name="C3_3" orien="R0" />
        <branch name="C3_3">
            <wire x2="1248" y1="192" y2="192" x1="816" />
            <wire x2="816" y1="192" y2="1104" x1="816" />
            <wire x2="1680" y1="1104" y2="1104" x1="816" />
            <wire x2="1680" y1="1104" y2="1488" x1="1680" />
            <wire x2="1680" y1="1488" y2="1488" x1="1616" />
        </branch>
    </sheet>
</drawing>