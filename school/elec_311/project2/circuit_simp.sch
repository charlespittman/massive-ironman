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
        <signal name="P1" />
        <signal name="P0" />
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
        <signal name="XLXN_5" />
        <signal name="XLXN_55" />
        <signal name="XLXN_56" />
        <signal name="XLXN_57" />
        <signal name="XLXN_58" />
        <signal name="XLXN_59" />
        <signal name="XLXN_60" />
        <signal name="XLXN_61" />
        <signal name="XLXN_64" />
        <signal name="XLXN_65" />
        <signal name="Q1" />
        <signal name="Q0" />
        <signal name="XLXN_69" />
        <signal name="XLXN_70" />
        <signal name="XLXN_72" />
        <signal name="XLXN_73" />
        <signal name="XLXN_75" />
        <signal name="XLXN_77" />
        <signal name="GT" />
        <signal name="XLXN_79" />
        <signal name="XLXN_80" />
        <port polarity="Input" name="P1" />
        <port polarity="Input" name="P0" />
        <port polarity="Input" name="Q1" />
        <port polarity="Input" name="Q0" />
        <port polarity="Output" name="GT" />
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
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
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
        <block symbolname="and2" name="XLXI_18">
            <blockpin signalname="XLXN_65" name="I0" />
            <blockpin signalname="P1" name="I1" />
            <blockpin signalname="XLXN_2" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_3">
            <blockpin signalname="XLXN_5" name="I0" />
            <blockpin signalname="P0" name="I1" />
            <blockpin signalname="P1" name="I2" />
            <blockpin signalname="XLXN_3" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_1">
            <blockpin signalname="XLXN_5" name="I0" />
            <blockpin signalname="XLXN_65" name="I1" />
            <blockpin signalname="P0" name="I2" />
            <blockpin signalname="XLXN_1" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_15">
            <blockpin signalname="Q0" name="I" />
            <blockpin signalname="XLXN_5" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_16">
            <blockpin signalname="Q1" name="I" />
            <blockpin signalname="XLXN_65" name="O" />
        </block>
        <block symbolname="or3" name="XLXI_4">
            <blockpin signalname="XLXN_3" name="I0" />
            <blockpin signalname="XLXN_2" name="I1" />
            <blockpin signalname="XLXN_1" name="I2" />
            <blockpin signalname="GT" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="XLXN_1">
            <wire x2="1376" y1="1040" y2="1040" x1="1360" />
            <wire x2="1440" y1="1040" y2="1040" x1="1376" />
            <wire x2="1440" y1="1040" y2="1232" x1="1440" />
        </branch>
        <branch name="XLXN_3">
            <wire x2="1376" y1="1520" y2="1520" x1="1360" />
            <wire x2="1440" y1="1520" y2="1520" x1="1376" />
            <wire x2="1440" y1="1360" y2="1520" x1="1440" />
        </branch>
        <branch name="P0">
            <wire x2="800" y1="1200" y2="1200" x1="400" />
            <wire x2="800" y1="1200" y2="1520" x1="800" />
            <wire x2="1104" y1="1520" y2="1520" x1="800" />
            <wire x2="1104" y1="976" y2="976" x1="800" />
            <wire x2="800" y1="976" y2="1200" x1="800" />
        </branch>
        <branch name="P1">
            <wire x2="704" y1="1120" y2="1120" x1="400" />
            <wire x2="704" y1="1120" y2="1264" x1="704" />
            <wire x2="704" y1="1264" y2="1456" x1="704" />
            <wire x2="1104" y1="1456" y2="1456" x1="704" />
            <wire x2="1104" y1="1264" y2="1264" x1="704" />
        </branch>
        <instance x="1104" y="1392" name="XLXI_18" orien="R0" />
        <instance x="1104" y="1648" name="XLXI_3" orien="R0" />
        <instance x="1104" y="1168" name="XLXI_1" orien="R0" />
        <branch name="XLXN_5">
            <wire x2="880" y1="1584" y2="1584" x1="640" />
            <wire x2="1104" y1="1584" y2="1584" x1="880" />
            <wire x2="1104" y1="1104" y2="1104" x1="880" />
            <wire x2="880" y1="1104" y2="1584" x1="880" />
        </branch>
        <branch name="XLXN_65">
            <wire x2="960" y1="1328" y2="1328" x1="640" />
            <wire x2="1104" y1="1328" y2="1328" x1="960" />
            <wire x2="1104" y1="1040" y2="1040" x1="960" />
            <wire x2="960" y1="1040" y2="1328" x1="960" />
        </branch>
        <instance x="416" y="1616" name="XLXI_15" orien="R0" />
        <instance x="416" y="1360" name="XLXI_16" orien="R0" />
        <iomarker fontsize="28" x="400" y="1584" name="Q0" orien="R180" />
        <iomarker fontsize="28" x="400" y="1120" name="P1" orien="R180" />
        <iomarker fontsize="28" x="400" y="1200" name="P0" orien="R180" />
        <iomarker fontsize="28" x="400" y="1328" name="Q1" orien="R180" />
        <branch name="Q1">
            <wire x2="416" y1="1328" y2="1328" x1="400" />
        </branch>
        <branch name="Q0">
            <wire x2="416" y1="1584" y2="1584" x1="400" />
        </branch>
        <branch name="XLXN_2">
            <wire x2="1376" y1="1296" y2="1296" x1="1360" />
            <wire x2="1440" y1="1296" y2="1296" x1="1376" />
        </branch>
        <instance x="1440" y="1424" name="XLXI_4" orien="R0" />
        <branch name="GT">
            <wire x2="1712" y1="1296" y2="1296" x1="1696" />
        </branch>
        <iomarker fontsize="28" x="1712" y="1296" name="GT" orien="R0" />
    </sheet>
</drawing>