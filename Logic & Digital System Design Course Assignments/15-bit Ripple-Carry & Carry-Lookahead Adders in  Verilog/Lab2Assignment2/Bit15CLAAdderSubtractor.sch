<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1" />
        <signal name="XLXN_2" />
        <signal name="XLXN_3" />
        <signal name="XLXN_4" />
        <signal name="SUB" />
        <signal name="XLXN_6" />
        <signal name="XLXN_7" />
        <signal name="XLXN_8" />
        <signal name="XLXN_9" />
        <signal name="XLXN_10" />
        <signal name="XLXN_11" />
        <signal name="XLXN_12" />
        <signal name="XLXN_13" />
        <signal name="XLXN_14" />
        <signal name="XLXN_15" />
        <signal name="XLXN_16" />
        <signal name="XLXN_17" />
        <signal name="XLXN_18" />
        <signal name="XLXN_19" />
        <signal name="XLXN_20" />
        <signal name="A0" />
        <signal name="A1" />
        <signal name="A2" />
        <signal name="B0" />
        <signal name="B1" />
        <signal name="B2" />
        <signal name="A3" />
        <signal name="A4" />
        <signal name="A5" />
        <signal name="B3" />
        <signal name="B4" />
        <signal name="B7" />
        <signal name="B6" />
        <signal name="A8" />
        <signal name="A7" />
        <signal name="A6" />
        <signal name="A9" />
        <signal name="A10" />
        <signal name="A11" />
        <signal name="C11" />
        <signal name="C10" />
        <signal name="C9" />
        <signal name="C8" />
        <signal name="C7" />
        <signal name="C6" />
        <signal name="C5" />
        <signal name="C4" />
        <signal name="C3" />
        <signal name="C2" />
        <signal name="C1" />
        <signal name="C0" />
        <signal name="OVF" />
        <signal name="C14" />
        <signal name="C13" />
        <signal name="C12" />
        <signal name="A14" />
        <signal name="A13" />
        <signal name="A12" />
        <signal name="B9" />
        <signal name="B10" />
        <signal name="B12" />
        <signal name="B13" />
        <signal name="B14" />
        <signal name="B11" />
        <signal name="B8" />
        <signal name="B5" />
        <signal name="XLXN_88" />
        <signal name="XLXN_89" />
        <port polarity="Input" name="SUB" />
        <port polarity="Input" name="A0" />
        <port polarity="Input" name="A1" />
        <port polarity="Input" name="A2" />
        <port polarity="Input" name="B0" />
        <port polarity="Input" name="B1" />
        <port polarity="Input" name="B2" />
        <port polarity="Input" name="A3" />
        <port polarity="Input" name="A4" />
        <port polarity="Input" name="A5" />
        <port polarity="Input" name="B3" />
        <port polarity="Input" name="B4" />
        <port polarity="Input" name="B7" />
        <port polarity="Input" name="B6" />
        <port polarity="Input" name="A8" />
        <port polarity="Input" name="A7" />
        <port polarity="Input" name="A6" />
        <port polarity="Input" name="A9" />
        <port polarity="Input" name="A10" />
        <port polarity="Input" name="A11" />
        <port polarity="Output" name="C11" />
        <port polarity="Output" name="C10" />
        <port polarity="Output" name="C9" />
        <port polarity="Output" name="C8" />
        <port polarity="Output" name="C7" />
        <port polarity="Output" name="C6" />
        <port polarity="Output" name="C5" />
        <port polarity="Output" name="C4" />
        <port polarity="Output" name="C3" />
        <port polarity="Output" name="C2" />
        <port polarity="Output" name="C1" />
        <port polarity="Output" name="C0" />
        <port polarity="Output" name="OVF" />
        <port polarity="Output" name="C14" />
        <port polarity="Output" name="C13" />
        <port polarity="Output" name="C12" />
        <port polarity="Input" name="A14" />
        <port polarity="Input" name="A13" />
        <port polarity="Input" name="A12" />
        <port polarity="Input" name="B9" />
        <port polarity="Input" name="B10" />
        <port polarity="Input" name="B12" />
        <port polarity="Input" name="B13" />
        <port polarity="Input" name="B14" />
        <port polarity="Input" name="B11" />
        <port polarity="Input" name="B8" />
        <port polarity="Input" name="B5" />
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
        <blockdef name="Bit3CarryLookAheadAdder">
            <timestamp>2020-12-1T22:44:54</timestamp>
            <rect width="256" x="64" y="-448" height="448" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-416" y2="-416" x1="320" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
        </blockdef>
        <blockdef name="LastCLAAdder">
            <timestamp>2020-12-1T23:11:57</timestamp>
            <rect width="256" x="64" y="-448" height="448" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-416" y2="-416" x1="320" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
        </blockdef>
        <block symbolname="xor2" name="XLXI_7">
            <blockpin signalname="B1" name="I0" />
            <blockpin signalname="SUB" name="I1" />
            <blockpin signalname="XLXN_7" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_8">
            <blockpin signalname="B0" name="I0" />
            <blockpin signalname="SUB" name="I1" />
            <blockpin signalname="XLXN_6" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_6">
            <blockpin signalname="B2" name="I0" />
            <blockpin signalname="SUB" name="I1" />
            <blockpin signalname="XLXN_8" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_9">
            <blockpin signalname="B4" name="I0" />
            <blockpin signalname="SUB" name="I1" />
            <blockpin signalname="XLXN_10" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_10">
            <blockpin signalname="B3" name="I0" />
            <blockpin signalname="SUB" name="I1" />
            <blockpin signalname="XLXN_9" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_11">
            <blockpin signalname="B5" name="I0" />
            <blockpin signalname="SUB" name="I1" />
            <blockpin signalname="XLXN_11" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_12">
            <blockpin signalname="B7" name="I0" />
            <blockpin signalname="SUB" name="I1" />
            <blockpin signalname="XLXN_13" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_13">
            <blockpin signalname="B6" name="I0" />
            <blockpin signalname="SUB" name="I1" />
            <blockpin signalname="XLXN_12" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_14">
            <blockpin signalname="B8" name="I0" />
            <blockpin signalname="SUB" name="I1" />
            <blockpin signalname="XLXN_14" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_15">
            <blockpin signalname="B10" name="I0" />
            <blockpin signalname="SUB" name="I1" />
            <blockpin signalname="XLXN_16" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_16">
            <blockpin signalname="B9" name="I0" />
            <blockpin signalname="SUB" name="I1" />
            <blockpin signalname="XLXN_15" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_17">
            <blockpin signalname="B11" name="I0" />
            <blockpin signalname="SUB" name="I1" />
            <blockpin signalname="XLXN_17" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_18">
            <blockpin signalname="B13" name="I0" />
            <blockpin signalname="SUB" name="I1" />
            <blockpin signalname="XLXN_19" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_19">
            <blockpin signalname="B12" name="I0" />
            <blockpin signalname="SUB" name="I1" />
            <blockpin signalname="XLXN_18" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_20">
            <blockpin signalname="B14" name="I0" />
            <blockpin signalname="SUB" name="I1" />
            <blockpin signalname="XLXN_20" name="O" />
        </block>
        <block symbolname="Bit3CarryLookAheadAdder" name="XLXI_42">
            <blockpin signalname="A9" name="A0_3" />
            <blockpin signalname="A10" name="A1_3" />
            <blockpin signalname="A11" name="A2_3" />
            <blockpin signalname="XLXN_15" name="B0_3" />
            <blockpin signalname="XLXN_16" name="B1_3" />
            <blockpin signalname="XLXN_17" name="B2_3" />
            <blockpin signalname="XLXN_2" name="C0_3" />
            <blockpin signalname="XLXN_1" name="C3_3" />
            <blockpin signalname="C9" name="S0_3" />
            <blockpin signalname="C10" name="S1_3" />
            <blockpin signalname="C11" name="S2_3" />
        </block>
        <block symbolname="Bit3CarryLookAheadAdder" name="XLXI_43">
            <blockpin signalname="A6" name="A0_3" />
            <blockpin signalname="A7" name="A1_3" />
            <blockpin signalname="A8" name="A2_3" />
            <blockpin signalname="XLXN_12" name="B0_3" />
            <blockpin signalname="XLXN_13" name="B1_3" />
            <blockpin signalname="XLXN_14" name="B2_3" />
            <blockpin signalname="XLXN_3" name="C0_3" />
            <blockpin signalname="XLXN_2" name="C3_3" />
            <blockpin signalname="C6" name="S0_3" />
            <blockpin signalname="C7" name="S1_3" />
            <blockpin signalname="C8" name="S2_3" />
        </block>
        <block symbolname="Bit3CarryLookAheadAdder" name="XLXI_44">
            <blockpin signalname="A3" name="A0_3" />
            <blockpin signalname="A4" name="A1_3" />
            <blockpin signalname="A5" name="A2_3" />
            <blockpin signalname="XLXN_9" name="B0_3" />
            <blockpin signalname="XLXN_10" name="B1_3" />
            <blockpin signalname="XLXN_11" name="B2_3" />
            <blockpin signalname="XLXN_4" name="C0_3" />
            <blockpin signalname="XLXN_3" name="C3_3" />
            <blockpin signalname="C3" name="S0_3" />
            <blockpin signalname="C4" name="S1_3" />
            <blockpin signalname="C5" name="S2_3" />
        </block>
        <block symbolname="Bit3CarryLookAheadAdder" name="XLXI_45">
            <blockpin signalname="A0" name="A0_3" />
            <blockpin signalname="A1" name="A1_3" />
            <blockpin signalname="A2" name="A2_3" />
            <blockpin signalname="XLXN_6" name="B0_3" />
            <blockpin signalname="XLXN_7" name="B1_3" />
            <blockpin signalname="XLXN_8" name="B2_3" />
            <blockpin signalname="SUB" name="C0_3" />
            <blockpin signalname="XLXN_4" name="C3_3" />
            <blockpin signalname="C0" name="S0_3" />
            <blockpin signalname="C1" name="S1_3" />
            <blockpin signalname="C2" name="S2_3" />
        </block>
        <block symbolname="LastCLAAdder" name="XLXI_46">
            <blockpin signalname="A12" name="A0_3" />
            <blockpin signalname="A13" name="A1_3" />
            <blockpin signalname="A14" name="A2_3" />
            <blockpin signalname="XLXN_18" name="B0_3" />
            <blockpin signalname="XLXN_19" name="B1_3" />
            <blockpin signalname="XLXN_20" name="B2_3" />
            <blockpin signalname="XLXN_1" name="C0_3" />
            <blockpin signalname="OVF" name="OVF" />
            <blockpin signalname="C12" name="S0_3" />
            <blockpin signalname="C13" name="S1_3" />
            <blockpin signalname="C14" name="S2_3" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="XLXN_1">
            <wire x2="848" y1="1632" y2="1632" x1="752" />
            <wire x2="848" y1="1632" y2="2096" x1="848" />
            <wire x2="1168" y1="2096" y2="2096" x1="848" />
            <wire x2="752" y1="1632" y2="1712" x1="752" />
        </branch>
        <branch name="XLXN_2">
            <wire x2="1360" y1="1648" y2="1712" x1="1360" />
            <wire x2="1456" y1="1648" y2="1648" x1="1360" />
            <wire x2="1456" y1="1648" y2="2096" x1="1456" />
            <wire x2="1776" y1="2096" y2="2096" x1="1456" />
        </branch>
        <branch name="XLXN_3">
            <wire x2="1968" y1="1648" y2="1712" x1="1968" />
            <wire x2="2080" y1="1648" y2="1648" x1="1968" />
            <wire x2="2080" y1="1648" y2="2112" x1="2080" />
            <wire x2="2352" y1="2112" y2="2112" x1="2080" />
            <wire x2="2352" y1="2096" y2="2112" x1="2352" />
        </branch>
        <branch name="XLXN_4">
            <wire x2="2544" y1="1648" y2="1712" x1="2544" />
            <wire x2="2656" y1="1648" y2="1648" x1="2544" />
            <wire x2="2656" y1="1648" y2="2112" x1="2656" />
            <wire x2="2928" y1="2112" y2="2112" x1="2656" />
            <wire x2="2928" y1="2096" y2="2112" x1="2928" />
        </branch>
        <branch name="SUB">
            <wire x2="400" y1="624" y2="640" x1="400" />
            <wire x2="464" y1="624" y2="624" x1="400" />
            <wire x2="464" y1="624" y2="944" x1="464" />
            <wire x2="528" y1="624" y2="624" x1="464" />
            <wire x2="1008" y1="624" y2="624" x1="528" />
            <wire x2="1008" y1="624" y2="640" x1="1008" />
            <wire x2="1072" y1="624" y2="624" x1="1008" />
            <wire x2="1072" y1="624" y2="944" x1="1072" />
            <wire x2="1136" y1="624" y2="624" x1="1072" />
            <wire x2="1616" y1="624" y2="624" x1="1136" />
            <wire x2="1616" y1="624" y2="640" x1="1616" />
            <wire x2="1680" y1="624" y2="624" x1="1616" />
            <wire x2="1680" y1="624" y2="944" x1="1680" />
            <wire x2="1744" y1="624" y2="624" x1="1680" />
            <wire x2="2192" y1="624" y2="624" x1="1744" />
            <wire x2="2192" y1="624" y2="640" x1="2192" />
            <wire x2="2256" y1="624" y2="624" x1="2192" />
            <wire x2="2320" y1="624" y2="624" x1="2256" />
            <wire x2="2768" y1="624" y2="624" x1="2320" />
            <wire x2="2768" y1="624" y2="640" x1="2768" />
            <wire x2="2832" y1="624" y2="624" x1="2768" />
            <wire x2="2896" y1="624" y2="624" x1="2832" />
            <wire x2="3120" y1="624" y2="624" x1="2896" />
            <wire x2="3120" y1="624" y2="1712" x1="3120" />
            <wire x2="2896" y1="624" y2="1328" x1="2896" />
            <wire x2="2832" y1="624" y2="944" x1="2832" />
            <wire x2="2320" y1="624" y2="1328" x1="2320" />
            <wire x2="2256" y1="624" y2="944" x1="2256" />
            <wire x2="1744" y1="624" y2="1328" x1="1744" />
            <wire x2="1136" y1="624" y2="1328" x1="1136" />
            <wire x2="528" y1="624" y2="1328" x1="528" />
            <wire x2="3120" y1="544" y2="624" x1="3120" />
        </branch>
        <branch name="XLXN_6">
            <wire x2="2864" y1="1584" y2="1712" x1="2864" />
        </branch>
        <branch name="XLXN_7">
            <wire x2="2800" y1="1200" y2="1712" x1="2800" />
        </branch>
        <branch name="XLXN_8">
            <wire x2="2736" y1="896" y2="1712" x1="2736" />
        </branch>
        <branch name="XLXN_9">
            <wire x2="2288" y1="1584" y2="1712" x1="2288" />
        </branch>
        <branch name="XLXN_10">
            <wire x2="2224" y1="1200" y2="1712" x1="2224" />
        </branch>
        <branch name="XLXN_11">
            <wire x2="2160" y1="896" y2="1712" x1="2160" />
        </branch>
        <branch name="XLXN_12">
            <wire x2="1712" y1="1584" y2="1712" x1="1712" />
        </branch>
        <branch name="XLXN_13">
            <wire x2="1648" y1="1200" y2="1712" x1="1648" />
        </branch>
        <branch name="XLXN_14">
            <wire x2="1584" y1="896" y2="1712" x1="1584" />
        </branch>
        <branch name="XLXN_15">
            <wire x2="1104" y1="1584" y2="1712" x1="1104" />
        </branch>
        <branch name="XLXN_16">
            <wire x2="1040" y1="1200" y2="1712" x1="1040" />
        </branch>
        <branch name="XLXN_17">
            <wire x2="976" y1="896" y2="1712" x1="976" />
        </branch>
        <branch name="XLXN_18">
            <wire x2="496" y1="1584" y2="1712" x1="496" />
        </branch>
        <branch name="XLXN_19">
            <wire x2="432" y1="1200" y2="1712" x1="432" />
        </branch>
        <branch name="XLXN_20">
            <wire x2="368" y1="896" y2="1712" x1="368" />
        </branch>
        <instance x="2768" y="1328" name="XLXI_8" orien="R90" />
        <instance x="2640" y="640" name="XLXI_6" orien="R90" />
        <instance x="2128" y="944" name="XLXI_9" orien="R90" />
        <instance x="2192" y="1328" name="XLXI_10" orien="R90" />
        <instance x="2064" y="640" name="XLXI_11" orien="R90" />
        <instance x="1552" y="944" name="XLXI_12" orien="R90" />
        <instance x="1616" y="1328" name="XLXI_13" orien="R90" />
        <instance x="1488" y="640" name="XLXI_14" orien="R90" />
        <instance x="944" y="944" name="XLXI_15" orien="R90" />
        <instance x="1008" y="1328" name="XLXI_16" orien="R90" />
        <instance x="880" y="640" name="XLXI_17" orien="R90" />
        <instance x="336" y="944" name="XLXI_18" orien="R90" />
        <instance x="400" y="1328" name="XLXI_19" orien="R90" />
        <instance x="272" y="640" name="XLXI_20" orien="R90" />
        <branch name="A0">
            <wire x2="3056" y1="1680" y2="1712" x1="3056" />
        </branch>
        <iomarker fontsize="28" x="3056" y="1680" name="A0" orien="R270" />
        <branch name="A1">
            <wire x2="2992" y1="1680" y2="1712" x1="2992" />
        </branch>
        <iomarker fontsize="28" x="2992" y="1680" name="A1" orien="R270" />
        <branch name="A2">
            <wire x2="2928" y1="1680" y2="1712" x1="2928" />
        </branch>
        <iomarker fontsize="28" x="2928" y="1680" name="A2" orien="R270" />
        <branch name="B0">
            <wire x2="2832" y1="1296" y2="1328" x1="2832" />
        </branch>
        <iomarker fontsize="28" x="2832" y="1296" name="B0" orien="R270" />
        <branch name="B1">
            <wire x2="2768" y1="912" y2="944" x1="2768" />
        </branch>
        <iomarker fontsize="28" x="2768" y="912" name="B1" orien="R270" />
        <branch name="B2">
            <wire x2="2704" y1="608" y2="640" x1="2704" />
        </branch>
        <iomarker fontsize="28" x="2704" y="608" name="B2" orien="R270" />
        <branch name="A3">
            <wire x2="2480" y1="1680" y2="1712" x1="2480" />
        </branch>
        <iomarker fontsize="28" x="2480" y="1680" name="A3" orien="R270" />
        <branch name="A4">
            <wire x2="2416" y1="1680" y2="1712" x1="2416" />
        </branch>
        <iomarker fontsize="28" x="2416" y="1680" name="A4" orien="R270" />
        <branch name="A5">
            <wire x2="2352" y1="1680" y2="1712" x1="2352" />
        </branch>
        <iomarker fontsize="28" x="2352" y="1680" name="A5" orien="R270" />
        <branch name="B3">
            <wire x2="2256" y1="1296" y2="1328" x1="2256" />
        </branch>
        <iomarker fontsize="28" x="2256" y="1296" name="B3" orien="R270" />
        <branch name="B4">
            <wire x2="2192" y1="912" y2="944" x1="2192" />
        </branch>
        <iomarker fontsize="28" x="2192" y="912" name="B4" orien="R270" />
        <branch name="B7">
            <wire x2="1616" y1="912" y2="944" x1="1616" />
        </branch>
        <iomarker fontsize="28" x="1616" y="912" name="B7" orien="R270" />
        <branch name="B6">
            <wire x2="1680" y1="1296" y2="1328" x1="1680" />
        </branch>
        <iomarker fontsize="28" x="1680" y="1296" name="B6" orien="R270" />
        <branch name="A8">
            <wire x2="1776" y1="1680" y2="1712" x1="1776" />
        </branch>
        <iomarker fontsize="28" x="1776" y="1680" name="A8" orien="R270" />
        <branch name="A7">
            <wire x2="1840" y1="1680" y2="1712" x1="1840" />
        </branch>
        <iomarker fontsize="28" x="1840" y="1680" name="A7" orien="R270" />
        <branch name="A6">
            <wire x2="1904" y1="1680" y2="1712" x1="1904" />
        </branch>
        <iomarker fontsize="28" x="1904" y="1680" name="A6" orien="R270" />
        <branch name="A9">
            <wire x2="1296" y1="1680" y2="1712" x1="1296" />
        </branch>
        <iomarker fontsize="28" x="1296" y="1680" name="A9" orien="R270" />
        <branch name="A10">
            <wire x2="1232" y1="1680" y2="1712" x1="1232" />
        </branch>
        <iomarker fontsize="28" x="1232" y="1680" name="A10" orien="R270" />
        <branch name="A11">
            <wire x2="1168" y1="1680" y2="1712" x1="1168" />
        </branch>
        <iomarker fontsize="28" x="1168" y="1680" name="A11" orien="R270" />
        <branch name="C11">
            <wire x2="1232" y1="2096" y2="2128" x1="1232" />
        </branch>
        <iomarker fontsize="28" x="1232" y="2128" name="C11" orien="R90" />
        <branch name="C10">
            <wire x2="1296" y1="2096" y2="2128" x1="1296" />
        </branch>
        <iomarker fontsize="28" x="1296" y="2128" name="C10" orien="R90" />
        <branch name="C9">
            <wire x2="1360" y1="2096" y2="2128" x1="1360" />
        </branch>
        <iomarker fontsize="28" x="1360" y="2128" name="C9" orien="R90" />
        <branch name="C8">
            <wire x2="1840" y1="2096" y2="2128" x1="1840" />
        </branch>
        <iomarker fontsize="28" x="1840" y="2128" name="C8" orien="R90" />
        <branch name="C7">
            <wire x2="1904" y1="2096" y2="2128" x1="1904" />
        </branch>
        <iomarker fontsize="28" x="1904" y="2128" name="C7" orien="R90" />
        <branch name="C6">
            <wire x2="1968" y1="2096" y2="2128" x1="1968" />
        </branch>
        <iomarker fontsize="28" x="1968" y="2128" name="C6" orien="R90" />
        <branch name="C5">
            <wire x2="2416" y1="2096" y2="2128" x1="2416" />
        </branch>
        <iomarker fontsize="28" x="2416" y="2128" name="C5" orien="R90" />
        <branch name="C4">
            <wire x2="2480" y1="2096" y2="2128" x1="2480" />
        </branch>
        <iomarker fontsize="28" x="2480" y="2128" name="C4" orien="R90" />
        <branch name="C3">
            <wire x2="2544" y1="2096" y2="2128" x1="2544" />
        </branch>
        <iomarker fontsize="28" x="2544" y="2128" name="C3" orien="R90" />
        <branch name="C2">
            <wire x2="2992" y1="2096" y2="2128" x1="2992" />
        </branch>
        <iomarker fontsize="28" x="2992" y="2128" name="C2" orien="R90" />
        <branch name="C1">
            <wire x2="3056" y1="2096" y2="2128" x1="3056" />
        </branch>
        <iomarker fontsize="28" x="3056" y="2128" name="C1" orien="R90" />
        <branch name="C0">
            <wire x2="3120" y1="2096" y2="2128" x1="3120" />
        </branch>
        <iomarker fontsize="28" x="3120" y="2128" name="C0" orien="R90" />
        <branch name="OVF">
            <wire x2="560" y1="2096" y2="2128" x1="560" />
        </branch>
        <iomarker fontsize="28" x="560" y="2128" name="OVF" orien="R90" />
        <branch name="C14">
            <wire x2="624" y1="2096" y2="2128" x1="624" />
        </branch>
        <iomarker fontsize="28" x="624" y="2128" name="C14" orien="R90" />
        <branch name="C13">
            <wire x2="688" y1="2096" y2="2128" x1="688" />
        </branch>
        <iomarker fontsize="28" x="688" y="2128" name="C13" orien="R90" />
        <branch name="C12">
            <wire x2="752" y1="2096" y2="2128" x1="752" />
        </branch>
        <iomarker fontsize="28" x="752" y="2128" name="C12" orien="R90" />
        <branch name="A14">
            <wire x2="560" y1="1680" y2="1712" x1="560" />
        </branch>
        <iomarker fontsize="28" x="560" y="1680" name="A14" orien="R270" />
        <branch name="A13">
            <wire x2="624" y1="1680" y2="1712" x1="624" />
        </branch>
        <iomarker fontsize="28" x="624" y="1680" name="A13" orien="R270" />
        <branch name="A12">
            <wire x2="688" y1="1680" y2="1712" x1="688" />
        </branch>
        <iomarker fontsize="28" x="688" y="1680" name="A12" orien="R270" />
        <branch name="B9">
            <wire x2="1072" y1="1296" y2="1328" x1="1072" />
        </branch>
        <iomarker fontsize="28" x="1072" y="1296" name="B9" orien="R270" />
        <branch name="B10">
            <wire x2="1008" y1="912" y2="944" x1="1008" />
        </branch>
        <iomarker fontsize="28" x="1008" y="912" name="B10" orien="R270" />
        <branch name="B12">
            <wire x2="464" y1="1296" y2="1328" x1="464" />
        </branch>
        <iomarker fontsize="28" x="464" y="1296" name="B12" orien="R270" />
        <branch name="B13">
            <wire x2="400" y1="912" y2="944" x1="400" />
        </branch>
        <iomarker fontsize="28" x="400" y="912" name="B13" orien="R270" />
        <branch name="B14">
            <wire x2="336" y1="608" y2="640" x1="336" />
        </branch>
        <iomarker fontsize="28" x="336" y="608" name="B14" orien="R270" />
        <branch name="B11">
            <wire x2="944" y1="608" y2="640" x1="944" />
        </branch>
        <iomarker fontsize="28" x="944" y="608" name="B11" orien="R270" />
        <branch name="B8">
            <wire x2="1552" y1="608" y2="640" x1="1552" />
        </branch>
        <iomarker fontsize="28" x="1552" y="608" name="B8" orien="R270" />
        <branch name="B5">
            <wire x2="2128" y1="608" y2="640" x1="2128" />
        </branch>
        <iomarker fontsize="28" x="2128" y="608" name="B5" orien="R270" />
        <iomarker fontsize="28" x="3120" y="544" name="SUB" orien="R270" />
        <instance x="2704" y="944" name="XLXI_7" orien="R90" />
        <instance x="944" y="1712" name="XLXI_42" orien="R90">
        </instance>
        <instance x="1552" y="1712" name="XLXI_43" orien="R90">
        </instance>
        <instance x="2128" y="1712" name="XLXI_44" orien="R90">
        </instance>
        <instance x="2704" y="1712" name="XLXI_45" orien="R90">
        </instance>
        <instance x="336" y="1712" name="XLXI_46" orien="R90">
        </instance>
    </sheet>
</drawing>