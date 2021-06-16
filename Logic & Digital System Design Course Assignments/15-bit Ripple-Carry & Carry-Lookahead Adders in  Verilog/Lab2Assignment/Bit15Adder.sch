<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="SUB" />
        <signal name="XLXN_25" />
        <signal name="XLXN_24" />
        <signal name="XLXN_23" />
        <signal name="XLXN_22" />
        <signal name="XLXN_21" />
        <signal name="XLXN_20" />
        <signal name="XLXN_19" />
        <signal name="XLXN_18" />
        <signal name="XLXN_17" />
        <signal name="XLXN_16" />
        <signal name="B14" />
        <signal name="B9" />
        <signal name="B8" />
        <signal name="B7" />
        <signal name="B6" />
        <signal name="B5" />
        <signal name="B4" />
        <signal name="B3" />
        <signal name="B2" />
        <signal name="B1" />
        <signal name="B0" />
        <signal name="A1" />
        <signal name="A2" />
        <signal name="A3" />
        <signal name="A0" />
        <signal name="XLXN_73" />
        <signal name="XLXN_75" />
        <signal name="XLXN_77" />
        <signal name="XLXN_79" />
        <signal name="XLXN_81" />
        <signal name="A4" />
        <signal name="A5" />
        <signal name="C5" />
        <signal name="XLXN_87" />
        <signal name="C6" />
        <signal name="XLXN_89" />
        <signal name="C7" />
        <signal name="XLXN_91" />
        <signal name="A7" />
        <signal name="A6" />
        <signal name="A8" />
        <signal name="A9" />
        <signal name="C9" />
        <signal name="XLXN_98" />
        <signal name="C8" />
        <signal name="XLXN_26" />
        <signal name="XLXN_27" />
        <signal name="XLXN_28" />
        <signal name="XLXN_29" />
        <signal name="XLXN_30" />
        <signal name="C13" />
        <signal name="XLXN_108" />
        <signal name="C12" />
        <signal name="XLXN_110" />
        <signal name="C11" />
        <signal name="XLXN_112" />
        <signal name="C10" />
        <signal name="C14" />
        <signal name="A14" />
        <signal name="A13" />
        <signal name="A12" />
        <signal name="B12" />
        <signal name="B13" />
        <signal name="B11" />
        <signal name="B10" />
        <signal name="A11" />
        <signal name="A10" />
        <signal name="C4" />
        <signal name="C3" />
        <signal name="C2" />
        <signal name="C1" />
        <signal name="C0" />
        <signal name="XLXN_134" />
        <signal name="XLXN_149" />
        <signal name="OVF" />
        <signal name="XLXN_155" />
        <port polarity="Input" name="SUB" />
        <port polarity="Input" name="B14" />
        <port polarity="Input" name="B9" />
        <port polarity="Input" name="B8" />
        <port polarity="Input" name="B7" />
        <port polarity="Input" name="B6" />
        <port polarity="Input" name="B5" />
        <port polarity="Input" name="B4" />
        <port polarity="Input" name="B3" />
        <port polarity="Input" name="B2" />
        <port polarity="Input" name="B1" />
        <port polarity="Input" name="B0" />
        <port polarity="Input" name="A1" />
        <port polarity="Input" name="A2" />
        <port polarity="Input" name="A3" />
        <port polarity="Input" name="A0" />
        <port polarity="Input" name="A4" />
        <port polarity="Input" name="A5" />
        <port polarity="Output" name="C5" />
        <port polarity="Output" name="C6" />
        <port polarity="Output" name="C7" />
        <port polarity="Input" name="A7" />
        <port polarity="Input" name="A6" />
        <port polarity="Input" name="A8" />
        <port polarity="Input" name="A9" />
        <port polarity="Output" name="C9" />
        <port polarity="Output" name="C8" />
        <port polarity="Output" name="C13" />
        <port polarity="Output" name="C12" />
        <port polarity="Output" name="C11" />
        <port polarity="Output" name="C10" />
        <port polarity="Output" name="C14" />
        <port polarity="Input" name="A14" />
        <port polarity="Input" name="A13" />
        <port polarity="Input" name="A12" />
        <port polarity="Input" name="B12" />
        <port polarity="Input" name="B13" />
        <port polarity="Input" name="B11" />
        <port polarity="Input" name="B10" />
        <port polarity="Input" name="A11" />
        <port polarity="Input" name="A10" />
        <port polarity="Output" name="C4" />
        <port polarity="Output" name="C3" />
        <port polarity="Output" name="C2" />
        <port polarity="Output" name="C1" />
        <port polarity="Output" name="C0" />
        <port polarity="Output" name="OVF" />
        <blockdef name="FullAdder">
            <timestamp>2020-12-1T19:16:40</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
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
        <block symbolname="xor2" name="XLXI_82">
            <blockpin signalname="B0" name="I0" />
            <blockpin signalname="SUB" name="I1" />
            <blockpin signalname="XLXN_25" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_81">
            <blockpin signalname="B1" name="I0" />
            <blockpin signalname="SUB" name="I1" />
            <blockpin signalname="XLXN_24" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_80">
            <blockpin signalname="B2" name="I0" />
            <blockpin signalname="SUB" name="I1" />
            <blockpin signalname="XLXN_23" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_79">
            <blockpin signalname="B3" name="I0" />
            <blockpin signalname="SUB" name="I1" />
            <blockpin signalname="XLXN_22" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_78">
            <blockpin signalname="B4" name="I0" />
            <blockpin signalname="SUB" name="I1" />
            <blockpin signalname="XLXN_21" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_75">
            <blockpin signalname="B5" name="I0" />
            <blockpin signalname="SUB" name="I1" />
            <blockpin signalname="XLXN_20" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_74">
            <blockpin signalname="B6" name="I0" />
            <blockpin signalname="SUB" name="I1" />
            <blockpin signalname="XLXN_19" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_73">
            <blockpin signalname="B7" name="I0" />
            <blockpin signalname="SUB" name="I1" />
            <blockpin signalname="XLXN_18" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_72">
            <blockpin signalname="B8" name="I0" />
            <blockpin signalname="SUB" name="I1" />
            <blockpin signalname="XLXN_17" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_71">
            <blockpin signalname="B9" name="I0" />
            <blockpin signalname="SUB" name="I1" />
            <blockpin signalname="XLXN_16" name="O" />
        </block>
        <block symbolname="FullAdder" name="XLXI_25">
            <blockpin signalname="A9" name="A" />
            <blockpin signalname="XLXN_16" name="B" />
            <blockpin signalname="XLXN_98" name="CarryI" />
            <blockpin signalname="XLXN_134" name="CarryO" />
            <blockpin signalname="C9" name="Sum" />
        </block>
        <block symbolname="FullAdder" name="XLXI_24">
            <blockpin signalname="A8" name="A" />
            <blockpin signalname="XLXN_17" name="B" />
            <blockpin signalname="XLXN_91" name="CarryI" />
            <blockpin signalname="XLXN_98" name="CarryO" />
            <blockpin signalname="C8" name="Sum" />
        </block>
        <block symbolname="FullAdder" name="XLXI_23">
            <blockpin signalname="A7" name="A" />
            <blockpin signalname="XLXN_18" name="B" />
            <blockpin signalname="XLXN_89" name="CarryI" />
            <blockpin signalname="XLXN_91" name="CarryO" />
            <blockpin signalname="C7" name="Sum" />
        </block>
        <block symbolname="FullAdder" name="XLXI_22">
            <blockpin signalname="A6" name="A" />
            <blockpin signalname="XLXN_19" name="B" />
            <blockpin signalname="XLXN_87" name="CarryI" />
            <blockpin signalname="XLXN_89" name="CarryO" />
            <blockpin signalname="C6" name="Sum" />
        </block>
        <block symbolname="FullAdder" name="XLXI_21">
            <blockpin signalname="A5" name="A" />
            <blockpin signalname="XLXN_20" name="B" />
            <blockpin signalname="XLXN_81" name="CarryI" />
            <blockpin signalname="XLXN_87" name="CarryO" />
            <blockpin signalname="C5" name="Sum" />
        </block>
        <block symbolname="FullAdder" name="XLXI_5">
            <blockpin signalname="A4" name="A" />
            <blockpin signalname="XLXN_21" name="B" />
            <blockpin signalname="XLXN_79" name="CarryI" />
            <blockpin signalname="XLXN_81" name="CarryO" />
            <blockpin signalname="C4" name="Sum" />
        </block>
        <block symbolname="FullAdder" name="XLXI_4">
            <blockpin signalname="A3" name="A" />
            <blockpin signalname="XLXN_22" name="B" />
            <blockpin signalname="XLXN_77" name="CarryI" />
            <blockpin signalname="XLXN_79" name="CarryO" />
            <blockpin signalname="C3" name="Sum" />
        </block>
        <block symbolname="FullAdder" name="XLXI_3">
            <blockpin signalname="A2" name="A" />
            <blockpin signalname="XLXN_23" name="B" />
            <blockpin signalname="XLXN_75" name="CarryI" />
            <blockpin signalname="XLXN_77" name="CarryO" />
            <blockpin signalname="C2" name="Sum" />
        </block>
        <block symbolname="FullAdder" name="XLXI_2">
            <blockpin signalname="A1" name="A" />
            <blockpin signalname="XLXN_24" name="B" />
            <blockpin signalname="XLXN_73" name="CarryI" />
            <blockpin signalname="XLXN_75" name="CarryO" />
            <blockpin signalname="C1" name="Sum" />
        </block>
        <block symbolname="FullAdder" name="XLXI_1">
            <blockpin signalname="A0" name="A" />
            <blockpin signalname="XLXN_25" name="B" />
            <blockpin signalname="SUB" name="CarryI" />
            <blockpin signalname="XLXN_73" name="CarryO" />
            <blockpin signalname="C0" name="Sum" />
        </block>
        <block symbolname="FullAdder" name="XLXI_26">
            <blockpin signalname="A10" name="A" />
            <blockpin signalname="XLXN_26" name="B" />
            <blockpin signalname="XLXN_134" name="CarryI" />
            <blockpin signalname="XLXN_112" name="CarryO" />
            <blockpin signalname="C10" name="Sum" />
        </block>
        <block symbolname="FullAdder" name="XLXI_27">
            <blockpin signalname="A11" name="A" />
            <blockpin signalname="XLXN_27" name="B" />
            <blockpin signalname="XLXN_112" name="CarryI" />
            <blockpin signalname="XLXN_110" name="CarryO" />
            <blockpin signalname="C11" name="Sum" />
        </block>
        <block symbolname="FullAdder" name="XLXI_28">
            <blockpin signalname="A12" name="A" />
            <blockpin signalname="XLXN_28" name="B" />
            <blockpin signalname="XLXN_110" name="CarryI" />
            <blockpin signalname="XLXN_108" name="CarryO" />
            <blockpin signalname="C12" name="Sum" />
        </block>
        <block symbolname="FullAdder" name="XLXI_29">
            <blockpin signalname="A13" name="A" />
            <blockpin signalname="XLXN_29" name="B" />
            <blockpin signalname="XLXN_108" name="CarryI" />
            <blockpin signalname="XLXN_149" name="CarryO" />
            <blockpin signalname="C13" name="Sum" />
        </block>
        <block symbolname="xor2" name="XLXI_83">
            <blockpin signalname="B10" name="I0" />
            <blockpin signalname="SUB" name="I1" />
            <blockpin signalname="XLXN_26" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_84">
            <blockpin signalname="B11" name="I0" />
            <blockpin signalname="SUB" name="I1" />
            <blockpin signalname="XLXN_27" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_86">
            <blockpin signalname="B12" name="I0" />
            <blockpin signalname="SUB" name="I1" />
            <blockpin signalname="XLXN_28" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_87">
            <blockpin signalname="B13" name="I0" />
            <blockpin signalname="SUB" name="I1" />
            <blockpin signalname="XLXN_29" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_88">
            <blockpin signalname="B14" name="I0" />
            <blockpin signalname="SUB" name="I1" />
            <blockpin signalname="XLXN_30" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_129">
            <blockpin signalname="XLXN_155" name="I0" />
            <blockpin signalname="XLXN_149" name="I1" />
            <blockpin signalname="OVF" name="O" />
        </block>
        <block symbolname="FullAdder" name="XLXI_130">
            <blockpin signalname="A14" name="A" />
            <blockpin signalname="XLXN_30" name="B" />
            <blockpin signalname="XLXN_149" name="CarryI" />
            <blockpin signalname="XLXN_155" name="CarryO" />
            <blockpin signalname="C14" name="Sum" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="SUB">
            <wire x2="832" y1="624" y2="624" x1="544" />
            <wire x2="832" y1="624" y2="688" x1="832" />
            <wire x2="1120" y1="624" y2="624" x1="832" />
            <wire x2="1120" y1="624" y2="688" x1="1120" />
            <wire x2="1408" y1="624" y2="624" x1="1120" />
            <wire x2="1408" y1="624" y2="688" x1="1408" />
            <wire x2="1696" y1="624" y2="624" x1="1408" />
            <wire x2="1696" y1="624" y2="688" x1="1696" />
            <wire x2="1984" y1="624" y2="624" x1="1696" />
            <wire x2="1984" y1="624" y2="688" x1="1984" />
            <wire x2="2272" y1="624" y2="624" x1="1984" />
            <wire x2="2272" y1="624" y2="688" x1="2272" />
            <wire x2="2560" y1="624" y2="624" x1="2272" />
            <wire x2="2560" y1="624" y2="688" x1="2560" />
            <wire x2="2848" y1="624" y2="624" x1="2560" />
            <wire x2="2848" y1="624" y2="688" x1="2848" />
            <wire x2="3136" y1="624" y2="624" x1="2848" />
            <wire x2="3136" y1="624" y2="688" x1="3136" />
            <wire x2="3344" y1="624" y2="624" x1="3136" />
            <wire x2="3344" y1="624" y2="976" x1="3344" />
            <wire x2="3344" y1="976" y2="1776" x1="3344" />
            <wire x2="544" y1="624" y2="688" x1="544" />
            <wire x2="1008" y1="1776" y2="1824" x1="1008" />
            <wire x2="1296" y1="1776" y2="1776" x1="1008" />
            <wire x2="1296" y1="1776" y2="1824" x1="1296" />
            <wire x2="1584" y1="1776" y2="1776" x1="1296" />
            <wire x2="1584" y1="1776" y2="1824" x1="1584" />
            <wire x2="1872" y1="1776" y2="1776" x1="1584" />
            <wire x2="1872" y1="1776" y2="1824" x1="1872" />
            <wire x2="2160" y1="1776" y2="1776" x1="1872" />
            <wire x2="2160" y1="1776" y2="1824" x1="2160" />
            <wire x2="3344" y1="1776" y2="1776" x1="2160" />
            <wire x2="3344" y1="976" y2="976" x1="3232" />
            <wire x2="3344" y1="512" y2="624" x1="3344" />
        </branch>
        <iomarker fontsize="28" x="3344" y="512" name="SUB" orien="R270" />
        <instance x="3008" y="688" name="XLXI_82" orien="R90" />
        <instance x="2720" y="688" name="XLXI_81" orien="R90" />
        <instance x="2432" y="688" name="XLXI_80" orien="R90" />
        <instance x="2144" y="688" name="XLXI_79" orien="R90" />
        <instance x="1856" y="688" name="XLXI_78" orien="R90" />
        <instance x="1568" y="688" name="XLXI_75" orien="R90" />
        <instance x="1280" y="688" name="XLXI_74" orien="R90" />
        <instance x="992" y="688" name="XLXI_73" orien="R90" />
        <instance x="704" y="688" name="XLXI_72" orien="R90" />
        <instance x="416" y="688" name="XLXI_71" orien="R90" />
        <instance x="768" y="976" name="XLXI_24" orien="R90">
        </instance>
        <instance x="1056" y="976" name="XLXI_23" orien="R90">
        </instance>
        <instance x="1344" y="976" name="XLXI_22" orien="R90">
        </instance>
        <instance x="1632" y="976" name="XLXI_21" orien="R90">
        </instance>
        <instance x="1920" y="976" name="XLXI_5" orien="R90">
        </instance>
        <instance x="2208" y="976" name="XLXI_4" orien="R90">
        </instance>
        <instance x="2496" y="976" name="XLXI_3" orien="R90">
        </instance>
        <instance x="2784" y="976" name="XLXI_2" orien="R90">
        </instance>
        <instance x="3072" y="976" name="XLXI_1" orien="R90">
        </instance>
        <branch name="XLXN_25">
            <wire x2="3104" y1="944" y2="976" x1="3104" />
        </branch>
        <branch name="XLXN_24">
            <wire x2="2816" y1="944" y2="976" x1="2816" />
        </branch>
        <branch name="XLXN_23">
            <wire x2="2528" y1="944" y2="976" x1="2528" />
        </branch>
        <branch name="XLXN_22">
            <wire x2="2240" y1="944" y2="976" x1="2240" />
        </branch>
        <branch name="XLXN_21">
            <wire x2="1952" y1="944" y2="976" x1="1952" />
        </branch>
        <branch name="XLXN_20">
            <wire x2="1664" y1="944" y2="976" x1="1664" />
        </branch>
        <branch name="XLXN_19">
            <wire x2="1376" y1="944" y2="976" x1="1376" />
        </branch>
        <branch name="XLXN_18">
            <wire x2="1088" y1="944" y2="976" x1="1088" />
        </branch>
        <branch name="XLXN_17">
            <wire x2="800" y1="944" y2="976" x1="800" />
        </branch>
        <branch name="XLXN_16">
            <wire x2="512" y1="944" y2="976" x1="512" />
        </branch>
        <branch name="B9">
            <wire x2="480" y1="656" y2="688" x1="480" />
        </branch>
        <iomarker fontsize="28" x="480" y="656" name="B9" orien="R270" />
        <branch name="B8">
            <wire x2="768" y1="656" y2="688" x1="768" />
        </branch>
        <iomarker fontsize="28" x="768" y="656" name="B8" orien="R270" />
        <branch name="B7">
            <wire x2="1056" y1="656" y2="688" x1="1056" />
        </branch>
        <iomarker fontsize="28" x="1056" y="656" name="B7" orien="R270" />
        <branch name="B6">
            <wire x2="1344" y1="656" y2="688" x1="1344" />
        </branch>
        <iomarker fontsize="28" x="1344" y="656" name="B6" orien="R270" />
        <branch name="B5">
            <wire x2="1632" y1="656" y2="688" x1="1632" />
        </branch>
        <iomarker fontsize="28" x="1632" y="656" name="B5" orien="R270" />
        <branch name="B4">
            <wire x2="1920" y1="656" y2="688" x1="1920" />
        </branch>
        <iomarker fontsize="28" x="1920" y="656" name="B4" orien="R270" />
        <branch name="B3">
            <wire x2="2208" y1="656" y2="688" x1="2208" />
        </branch>
        <iomarker fontsize="28" x="2208" y="656" name="B3" orien="R270" />
        <branch name="B2">
            <wire x2="2496" y1="656" y2="688" x1="2496" />
        </branch>
        <iomarker fontsize="28" x="2496" y="656" name="B2" orien="R270" />
        <branch name="B1">
            <wire x2="2784" y1="656" y2="688" x1="2784" />
        </branch>
        <iomarker fontsize="28" x="2784" y="656" name="B1" orien="R270" />
        <branch name="B0">
            <wire x2="3072" y1="656" y2="688" x1="3072" />
        </branch>
        <iomarker fontsize="28" x="3072" y="656" name="B0" orien="R270" />
        <branch name="A1">
            <wire x2="2880" y1="944" y2="976" x1="2880" />
        </branch>
        <iomarker fontsize="28" x="2880" y="944" name="A1" orien="R270" />
        <branch name="A2">
            <wire x2="2592" y1="944" y2="976" x1="2592" />
        </branch>
        <iomarker fontsize="28" x="2592" y="944" name="A2" orien="R270" />
        <branch name="A3">
            <wire x2="2304" y1="944" y2="976" x1="2304" />
        </branch>
        <iomarker fontsize="28" x="2304" y="944" name="A3" orien="R270" />
        <branch name="A0">
            <wire x2="3168" y1="944" y2="976" x1="3168" />
        </branch>
        <iomarker fontsize="28" x="3168" y="944" name="A0" orien="R270" />
        <branch name="A4">
            <wire x2="2016" y1="944" y2="976" x1="2016" />
        </branch>
        <iomarker fontsize="28" x="2016" y="944" name="A4" orien="R270" />
        <iomarker fontsize="28" x="3232" y="1440" name="C0" orien="R90" />
        <iomarker fontsize="28" x="2944" y="1440" name="C1" orien="R90" />
        <iomarker fontsize="28" x="2656" y="1440" name="C2" orien="R90" />
        <iomarker fontsize="28" x="2368" y="1440" name="C3" orien="R90" />
        <iomarker fontsize="28" x="2080" y="1440" name="C4" orien="R90" />
        <branch name="A5">
            <wire x2="1728" y1="944" y2="976" x1="1728" />
        </branch>
        <iomarker fontsize="28" x="1728" y="944" name="A5" orien="R270" />
        <branch name="C5">
            <wire x2="1792" y1="1360" y2="1440" x1="1792" />
        </branch>
        <branch name="C6">
            <wire x2="1504" y1="1360" y2="1440" x1="1504" />
        </branch>
        <branch name="C7">
            <wire x2="1216" y1="1360" y2="1440" x1="1216" />
        </branch>
        <branch name="A7">
            <wire x2="1152" y1="944" y2="976" x1="1152" />
        </branch>
        <iomarker fontsize="28" x="1152" y="944" name="A7" orien="R270" />
        <branch name="A6">
            <wire x2="1440" y1="944" y2="976" x1="1440" />
        </branch>
        <iomarker fontsize="28" x="1440" y="944" name="A6" orien="R270" />
        <branch name="A8">
            <wire x2="864" y1="944" y2="976" x1="864" />
        </branch>
        <iomarker fontsize="28" x="864" y="944" name="A8" orien="R270" />
        <branch name="A9">
            <wire x2="576" y1="944" y2="976" x1="576" />
        </branch>
        <iomarker fontsize="28" x="576" y="944" name="A9" orien="R270" />
        <branch name="C9">
            <wire x2="640" y1="1360" y2="1440" x1="640" />
        </branch>
        <branch name="C8">
            <wire x2="928" y1="1360" y2="1440" x1="928" />
        </branch>
        <instance x="480" y="976" name="XLXI_25" orien="R90">
        </instance>
        <iomarker fontsize="28" x="1792" y="1440" name="C5" orien="R90" />
        <iomarker fontsize="28" x="1504" y="1440" name="C6" orien="R90" />
        <iomarker fontsize="28" x="1216" y="1440" name="C7" orien="R90" />
        <iomarker fontsize="28" x="640" y="1440" name="C9" orien="R90" />
        <iomarker fontsize="28" x="928" y="1440" name="C8" orien="R90" />
        <instance x="2096" y="2112" name="XLXI_26" orien="R90">
        </instance>
        <instance x="1808" y="2112" name="XLXI_27" orien="R90">
        </instance>
        <instance x="1520" y="2112" name="XLXI_28" orien="R90">
        </instance>
        <instance x="1232" y="2112" name="XLXI_29" orien="R90">
        </instance>
        <branch name="XLXN_26">
            <wire x2="2128" y1="2080" y2="2112" x1="2128" />
        </branch>
        <instance x="2032" y="1824" name="XLXI_83" orien="R90" />
        <branch name="XLXN_27">
            <wire x2="1840" y1="2080" y2="2112" x1="1840" />
        </branch>
        <instance x="1744" y="1824" name="XLXI_84" orien="R90" />
        <branch name="XLXN_28">
            <wire x2="1552" y1="2080" y2="2112" x1="1552" />
        </branch>
        <instance x="1456" y="1824" name="XLXI_86" orien="R90" />
        <branch name="XLXN_29">
            <wire x2="1264" y1="2080" y2="2112" x1="1264" />
        </branch>
        <instance x="1168" y="1824" name="XLXI_87" orien="R90" />
        <branch name="XLXN_30">
            <wire x2="976" y1="2080" y2="2112" x1="976" />
        </branch>
        <instance x="880" y="1824" name="XLXI_88" orien="R90" />
        <branch name="B14">
            <wire x2="944" y1="1776" y2="1824" x1="944" />
        </branch>
        <iomarker fontsize="28" x="944" y="1776" name="B14" orien="R270" />
        <branch name="C13">
            <wire x2="1392" y1="2496" y2="2528" x1="1392" />
        </branch>
        <iomarker fontsize="28" x="1392" y="2528" name="C13" orien="R90" />
        <branch name="C12">
            <wire x2="1680" y1="2496" y2="2528" x1="1680" />
        </branch>
        <iomarker fontsize="28" x="1680" y="2528" name="C12" orien="R90" />
        <branch name="C11">
            <wire x2="1968" y1="2496" y2="2528" x1="1968" />
        </branch>
        <iomarker fontsize="28" x="1968" y="2528" name="C11" orien="R90" />
        <branch name="C10">
            <wire x2="2256" y1="2496" y2="2528" x1="2256" />
        </branch>
        <iomarker fontsize="28" x="2256" y="2528" name="C10" orien="R90" />
        <branch name="C14">
            <wire x2="1104" y1="2496" y2="2528" x1="1104" />
        </branch>
        <branch name="A14">
            <wire x2="1040" y1="2080" y2="2112" x1="1040" />
        </branch>
        <iomarker fontsize="28" x="1040" y="2080" name="A14" orien="R270" />
        <branch name="A13">
            <wire x2="1328" y1="2080" y2="2112" x1="1328" />
        </branch>
        <iomarker fontsize="28" x="1328" y="2080" name="A13" orien="R270" />
        <branch name="A12">
            <wire x2="1616" y1="2080" y2="2112" x1="1616" />
        </branch>
        <iomarker fontsize="28" x="1616" y="2080" name="A12" orien="R270" />
        <branch name="B12">
            <wire x2="1520" y1="1792" y2="1824" x1="1520" />
        </branch>
        <iomarker fontsize="28" x="1520" y="1792" name="B12" orien="R270" />
        <branch name="B13">
            <wire x2="1232" y1="1792" y2="1824" x1="1232" />
        </branch>
        <iomarker fontsize="28" x="1232" y="1792" name="B13" orien="R270" />
        <branch name="B11">
            <wire x2="1808" y1="1792" y2="1824" x1="1808" />
        </branch>
        <iomarker fontsize="28" x="1808" y="1792" name="B11" orien="R270" />
        <branch name="B10">
            <wire x2="2096" y1="1792" y2="1824" x1="2096" />
        </branch>
        <iomarker fontsize="28" x="2096" y="1792" name="B10" orien="R270" />
        <branch name="A11">
            <wire x2="1904" y1="2080" y2="2112" x1="1904" />
        </branch>
        <iomarker fontsize="28" x="1904" y="2080" name="A11" orien="R270" />
        <branch name="A10">
            <wire x2="2192" y1="2080" y2="2112" x1="2192" />
        </branch>
        <iomarker fontsize="28" x="2192" y="2080" name="A10" orien="R270" />
        <branch name="C4">
            <wire x2="2080" y1="1360" y2="1440" x1="2080" />
        </branch>
        <branch name="C3">
            <wire x2="2368" y1="1360" y2="1440" x1="2368" />
        </branch>
        <branch name="C2">
            <wire x2="2656" y1="1360" y2="1440" x1="2656" />
        </branch>
        <branch name="C1">
            <wire x2="2944" y1="1360" y2="1440" x1="2944" />
        </branch>
        <branch name="C0">
            <wire x2="3232" y1="1360" y2="1440" x1="3232" />
        </branch>
        <branch name="XLXN_134">
            <wire x2="576" y1="1360" y2="1376" x1="576" />
            <wire x2="2256" y1="1376" y2="1376" x1="576" />
            <wire x2="2256" y1="1376" y2="2112" x1="2256" />
        </branch>
        <branch name="XLXN_77">
            <wire x2="2368" y1="944" y2="976" x1="2368" />
            <wire x2="2448" y1="944" y2="944" x1="2368" />
            <wire x2="2448" y1="944" y2="1392" x1="2448" />
            <wire x2="2592" y1="1392" y2="1392" x1="2448" />
            <wire x2="2592" y1="1360" y2="1392" x1="2592" />
        </branch>
        <branch name="XLXN_75">
            <wire x2="2656" y1="944" y2="976" x1="2656" />
            <wire x2="2736" y1="944" y2="944" x1="2656" />
            <wire x2="2736" y1="944" y2="1392" x1="2736" />
            <wire x2="2880" y1="1392" y2="1392" x1="2736" />
            <wire x2="2880" y1="1360" y2="1392" x1="2880" />
        </branch>
        <branch name="XLXN_73">
            <wire x2="2944" y1="944" y2="976" x1="2944" />
            <wire x2="3024" y1="944" y2="944" x1="2944" />
            <wire x2="3024" y1="944" y2="1392" x1="3024" />
            <wire x2="3168" y1="1392" y2="1392" x1="3024" />
            <wire x2="3168" y1="1360" y2="1392" x1="3168" />
        </branch>
        <branch name="XLXN_79">
            <wire x2="2080" y1="944" y2="976" x1="2080" />
            <wire x2="2160" y1="944" y2="944" x1="2080" />
            <wire x2="2160" y1="944" y2="1392" x1="2160" />
            <wire x2="2304" y1="1392" y2="1392" x1="2160" />
            <wire x2="2304" y1="1360" y2="1392" x1="2304" />
        </branch>
        <branch name="XLXN_81">
            <wire x2="1792" y1="944" y2="976" x1="1792" />
            <wire x2="1872" y1="944" y2="944" x1="1792" />
            <wire x2="1872" y1="944" y2="1392" x1="1872" />
            <wire x2="2016" y1="1392" y2="1392" x1="1872" />
            <wire x2="2016" y1="1360" y2="1392" x1="2016" />
        </branch>
        <branch name="XLXN_87">
            <wire x2="1504" y1="960" y2="976" x1="1504" />
            <wire x2="1584" y1="960" y2="960" x1="1504" />
            <wire x2="1584" y1="960" y2="1392" x1="1584" />
            <wire x2="1728" y1="1392" y2="1392" x1="1584" />
            <wire x2="1728" y1="1360" y2="1392" x1="1728" />
        </branch>
        <branch name="XLXN_89">
            <wire x2="1216" y1="960" y2="976" x1="1216" />
            <wire x2="1296" y1="960" y2="960" x1="1216" />
            <wire x2="1296" y1="960" y2="1392" x1="1296" />
            <wire x2="1440" y1="1392" y2="1392" x1="1296" />
            <wire x2="1440" y1="1360" y2="1392" x1="1440" />
        </branch>
        <branch name="XLXN_91">
            <wire x2="928" y1="960" y2="976" x1="928" />
            <wire x2="1008" y1="960" y2="960" x1="928" />
            <wire x2="1008" y1="960" y2="1392" x1="1008" />
            <wire x2="1152" y1="1392" y2="1392" x1="1008" />
            <wire x2="1152" y1="1360" y2="1392" x1="1152" />
        </branch>
        <branch name="XLXN_98">
            <wire x2="640" y1="960" y2="976" x1="640" />
            <wire x2="720" y1="960" y2="960" x1="640" />
            <wire x2="720" y1="960" y2="1392" x1="720" />
            <wire x2="864" y1="1392" y2="1392" x1="720" />
            <wire x2="864" y1="1360" y2="1392" x1="864" />
        </branch>
        <branch name="XLXN_112">
            <wire x2="1968" y1="2096" y2="2112" x1="1968" />
            <wire x2="2048" y1="2096" y2="2096" x1="1968" />
            <wire x2="2048" y1="2096" y2="2512" x1="2048" />
            <wire x2="2192" y1="2512" y2="2512" x1="2048" />
            <wire x2="2192" y1="2496" y2="2512" x1="2192" />
        </branch>
        <branch name="XLXN_110">
            <wire x2="1680" y1="2096" y2="2112" x1="1680" />
            <wire x2="1760" y1="2096" y2="2096" x1="1680" />
            <wire x2="1760" y1="2096" y2="2512" x1="1760" />
            <wire x2="1904" y1="2512" y2="2512" x1="1760" />
            <wire x2="1904" y1="2496" y2="2512" x1="1904" />
        </branch>
        <branch name="XLXN_108">
            <wire x2="1392" y1="2096" y2="2112" x1="1392" />
            <wire x2="1472" y1="2096" y2="2096" x1="1392" />
            <wire x2="1472" y1="2096" y2="2512" x1="1472" />
            <wire x2="1616" y1="2512" y2="2512" x1="1472" />
            <wire x2="1616" y1="2496" y2="2512" x1="1616" />
        </branch>
        <instance x="944" y="2112" name="XLXI_130" orien="R90">
        </instance>
        <branch name="XLXN_149">
            <wire x2="864" y1="2256" y2="2256" x1="816" />
            <wire x2="864" y1="2256" y2="2640" x1="864" />
            <wire x2="1184" y1="2640" y2="2640" x1="864" />
            <wire x2="816" y1="2256" y2="2272" x1="816" />
            <wire x2="1104" y1="2096" y2="2112" x1="1104" />
            <wire x2="1184" y1="2096" y2="2096" x1="1104" />
            <wire x2="1184" y1="2096" y2="2512" x1="1184" />
            <wire x2="1328" y1="2512" y2="2512" x1="1184" />
            <wire x2="1184" y1="2512" y2="2640" x1="1184" />
            <wire x2="1328" y1="2496" y2="2512" x1="1328" />
        </branch>
        <instance x="688" y="2272" name="XLXI_129" orien="R90" />
        <iomarker fontsize="28" x="1104" y="2528" name="C14" orien="R90" />
        <branch name="OVF">
            <wire x2="784" y1="2528" y2="2560" x1="784" />
        </branch>
        <iomarker fontsize="28" x="784" y="2560" name="OVF" orien="R90" />
        <branch name="XLXN_155">
            <wire x2="912" y1="2224" y2="2224" x1="752" />
            <wire x2="912" y1="2224" y2="2496" x1="912" />
            <wire x2="912" y1="2496" y2="2512" x1="912" />
            <wire x2="1040" y1="2512" y2="2512" x1="912" />
            <wire x2="752" y1="2224" y2="2272" x1="752" />
            <wire x2="1040" y1="2496" y2="2512" x1="1040" />
        </branch>
    </sheet>
</drawing>