<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_2" />
        <signal name="XLXN_17" />
        <signal name="XLXN_18" />
        <signal name="XLXN_19" />
        <signal name="XLXN_20" />
        <signal name="XLXN_21" />
        <signal name="XLXN_22" />
        <signal name="XLXN_23" />
        <signal name="XLXN_24" />
        <signal name="XLXN_25" />
        <signal name="XLXN_26" />
        <signal name="XLXN_27" />
        <signal name="XLXN_29" />
        <signal name="XLXN_30" />
        <signal name="XLXN_31" />
        <signal name="XLXN_32" />
        <signal name="XLXN_33" />
        <signal name="XLXN_35" />
        <signal name="XLXN_36" />
        <signal name="XLXN_38" />
        <signal name="XLXN_39" />
        <signal name="XLXN_7" />
        <signal name="XLXN_41" />
        <signal name="XLXN_42" />
        <signal name="XLXN_45" />
        <signal name="XLXN_46" />
        <signal name="XLXN_47" />
        <signal name="XLXN_50" />
        <signal name="XLXN_51" />
        <signal name="XLXN_52" />
        <signal name="XLXN_55" />
        <signal name="XLXN_56" />
        <signal name="XLXN_57" />
        <signal name="XLXN_58" />
        <signal name="XLXN_59" />
        <signal name="XLXN_60" />
        <signal name="XLXN_61" />
        <signal name="XLXN_64" />
        <signal name="XLXN_69" />
        <signal name="XLXN_70" />
        <signal name="XLXN_72" />
        <signal name="XLXN_73" />
        <signal name="XLXN_75" />
        <signal name="XLXN_77" />
        <signal name="XLXN_79" />
        <signal name="XLXN_80" />
        <signal name="Q1" />
        <signal name="P1" />
        <signal name="Q0" />
        <signal name="XLXN_88" />
        <signal name="XLXN_89" />
        <signal name="XLXN_90" />
        <signal name="XLXN_91" />
        <signal name="XLXN_92" />
        <signal name="XLXN_93" />
        <signal name="XLXN_94" />
        <signal name="XLXN_95" />
        <signal name="XLXN_96" />
        <signal name="GT" />
        <signal name="P0" />
        <signal name="XLXN_99" />
        <signal name="XLXN_100" />
        <signal name="XLXN_102" />
        <port polarity="Input" name="Q1" />
        <port polarity="Input" name="P1" />
        <port polarity="Input" name="Q0" />
        <port polarity="Output" name="GT" />
        <port polarity="Input" name="P0" />
        <blockdef name="nand2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="216" y1="-96" y2="-96" x1="256" />
            <circle r="12" cx="204" cy="-96" />
            <line x2="64" y1="-48" y2="-144" x1="64" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
        </blockdef>
        <blockdef name="nand3">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="216" y1="-128" y2="-128" x1="256" />
            <circle r="12" cx="204" cy="-128" />
            <line x2="144" y1="-176" y2="-176" x1="64" />
            <line x2="64" y1="-80" y2="-80" x1="144" />
            <arc ex="144" ey="-176" sx="144" sy="-80" r="48" cx="144" cy="-128" />
            <line x2="64" y1="-64" y2="-192" x1="64" />
        </blockdef>
        <block symbolname="nand2" name="XLXI_44">
            <blockpin signalname="XLXN_93" name="I0" />
            <blockpin signalname="P1" name="I1" />
            <blockpin signalname="XLXN_95" name="O" />
        </block>
        <block symbolname="nand3" name="XLXI_45">
            <blockpin signalname="XLXN_92" name="I0" />
            <blockpin signalname="XLXN_91" name="I1" />
            <blockpin signalname="P0" name="I2" />
            <blockpin signalname="XLXN_94" name="O" />
        </block>
        <block symbolname="nand3" name="XLXI_46">
            <blockpin signalname="P0" name="I0" />
            <blockpin signalname="XLXN_99" name="I1" />
            <blockpin signalname="P1" name="I2" />
            <blockpin signalname="XLXN_96" name="O" />
        </block>
        <block symbolname="nand3" name="XLXI_47">
            <blockpin signalname="XLXN_96" name="I0" />
            <blockpin signalname="XLXN_95" name="I1" />
            <blockpin signalname="XLXN_94" name="I2" />
            <blockpin signalname="GT" name="O" />
        </block>
        <block symbolname="nand2" name="XLXI_43">
            <blockpin signalname="Q0" name="I0" />
            <blockpin signalname="Q0" name="I1" />
            <blockpin signalname="XLXN_99" name="O" />
        </block>
        <block symbolname="nand2" name="XLXI_42">
            <blockpin signalname="Q1" name="I0" />
            <blockpin signalname="Q1" name="I1" />
            <blockpin signalname="XLXN_93" name="O" />
        </block>
        <block symbolname="nand2" name="XLXI_41">
            <blockpin signalname="Q0" name="I0" />
            <blockpin signalname="Q0" name="I1" />
            <blockpin signalname="XLXN_92" name="O" />
        </block>
        <block symbolname="nand2" name="XLXI_40">
            <blockpin signalname="Q1" name="I0" />
            <blockpin signalname="Q1" name="I1" />
            <blockpin signalname="XLXN_91" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1184" y="1376" name="XLXI_44" orien="R0" />
        <instance x="1184" y="1168" name="XLXI_45" orien="R0" />
        <instance x="1184" y="1648" name="XLXI_46" orien="R0" />
        <instance x="1584" y="1408" name="XLXI_47" orien="R0" />
        <branch name="Q1">
            <wire x2="688" y1="1328" y2="1328" x1="480" />
            <wire x2="688" y1="1328" y2="1392" x1="688" />
            <wire x2="784" y1="1392" y2="1392" x1="688" />
            <wire x2="784" y1="1328" y2="1328" x1="688" />
            <wire x2="688" y1="1072" y2="1328" x1="688" />
            <wire x2="752" y1="1072" y2="1072" x1="688" />
            <wire x2="784" y1="1072" y2="1072" x1="752" />
            <wire x2="784" y1="1008" y2="1008" x1="752" />
            <wire x2="752" y1="1008" y2="1072" x1="752" />
        </branch>
        <branch name="Q0">
            <wire x2="752" y1="1552" y2="1552" x1="496" />
            <wire x2="784" y1="1552" y2="1552" x1="752" />
            <wire x2="784" y1="1168" y2="1168" x1="752" />
            <wire x2="752" y1="1168" y2="1232" x1="752" />
            <wire x2="784" y1="1232" y2="1232" x1="752" />
            <wire x2="752" y1="1232" y2="1488" x1="752" />
            <wire x2="784" y1="1488" y2="1488" x1="752" />
            <wire x2="752" y1="1488" y2="1552" x1="752" />
        </branch>
        <instance x="784" y="1616" name="XLXI_43" orien="R0" />
        <instance x="784" y="1456" name="XLXI_42" orien="R0" />
        <instance x="784" y="1296" name="XLXI_41" orien="R0" />
        <instance x="784" y="1136" name="XLXI_40" orien="R0" />
        <branch name="XLXN_91">
            <wire x2="1184" y1="1040" y2="1040" x1="1040" />
        </branch>
        <branch name="XLXN_92">
            <wire x2="1184" y1="1200" y2="1200" x1="1040" />
            <wire x2="1184" y1="1104" y2="1200" x1="1184" />
        </branch>
        <branch name="XLXN_93">
            <wire x2="1152" y1="1360" y2="1360" x1="1040" />
            <wire x2="1184" y1="1312" y2="1312" x1="1152" />
            <wire x2="1152" y1="1312" y2="1360" x1="1152" />
        </branch>
        <branch name="XLXN_94">
            <wire x2="1584" y1="1040" y2="1040" x1="1440" />
            <wire x2="1584" y1="1040" y2="1216" x1="1584" />
        </branch>
        <branch name="XLXN_95">
            <wire x2="1584" y1="1280" y2="1280" x1="1440" />
        </branch>
        <branch name="XLXN_96">
            <wire x2="1584" y1="1520" y2="1520" x1="1440" />
            <wire x2="1584" y1="1344" y2="1520" x1="1584" />
        </branch>
        <branch name="GT">
            <wire x2="1856" y1="1280" y2="1280" x1="1840" />
            <wire x2="1904" y1="1280" y2="1280" x1="1856" />
        </branch>
        <branch name="P0">
            <wire x2="560" y1="1200" y2="1200" x1="480" />
            <wire x2="560" y1="1200" y2="1632" x1="560" />
            <wire x2="1184" y1="1632" y2="1632" x1="560" />
            <wire x2="1184" y1="976" y2="976" x1="560" />
            <wire x2="560" y1="976" y2="1200" x1="560" />
            <wire x2="1184" y1="1584" y2="1632" x1="1184" />
        </branch>
        <branch name="XLXN_99">
            <wire x2="1184" y1="1520" y2="1520" x1="1040" />
        </branch>
        <branch name="P1">
            <wire x2="640" y1="1120" y2="1120" x1="480" />
            <wire x2="640" y1="1120" y2="1280" x1="640" />
            <wire x2="1104" y1="1280" y2="1280" x1="640" />
            <wire x2="640" y1="1280" y2="1456" x1="640" />
            <wire x2="1184" y1="1456" y2="1456" x1="640" />
            <wire x2="1184" y1="1248" y2="1248" x1="1104" />
            <wire x2="1104" y1="1248" y2="1280" x1="1104" />
        </branch>
        <iomarker fontsize="28" x="496" y="1552" name="Q0" orien="R180" />
        <iomarker fontsize="28" x="480" y="1328" name="Q1" orien="R180" />
        <iomarker fontsize="28" x="480" y="1200" name="P0" orien="R180" />
        <iomarker fontsize="28" x="480" y="1120" name="P1" orien="R180" />
        <iomarker fontsize="28" x="1904" y="1280" name="GT" orien="R0" />
    </sheet>
</drawing>