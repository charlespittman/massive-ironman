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
        <signal name="XLXN_13" />
        <signal name="XLXN_5" />
        <signal name="S" />
        <signal name="I1" />
        <signal name="I0" />
        <signal name="E" />
        <signal name="Z" />
        <signal name="XLXN_24" />
        <signal name="XLXN_25" />
        <signal name="XLXN_26" />
        <signal name="XLXN_27" />
        <signal name="XLXN_19" />
        <signal name="XLXN_20" />
        <signal name="XLXN_40" />
        <signal name="XLXN_41" />
        <signal name="XLXN_43" />
        <port polarity="Input" name="S" />
        <port polarity="Input" name="I1" />
        <port polarity="Input" name="I0" />
        <port polarity="Input" name="E" />
        <port polarity="Output" name="Z" />
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
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
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
        <block symbolname="and2" name="XLXI_1">
            <blockpin signalname="I0" name="I0" />
            <blockpin signalname="XLXN_3" name="I1" />
            <blockpin signalname="XLXN_1" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_2">
            <blockpin signalname="S" name="I0" />
            <blockpin signalname="I1" name="I1" />
            <blockpin signalname="XLXN_2" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_4">
            <blockpin signalname="I1" name="I0" />
            <blockpin signalname="XLXN_1" name="I1" />
            <blockpin signalname="XLXN_19" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_5">
            <blockpin signalname="XLXN_2" name="I0" />
            <blockpin signalname="I0" name="I1" />
            <blockpin signalname="XLXN_20" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_6">
            <blockpin signalname="S" name="I" />
            <blockpin signalname="XLXN_3" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_13">
            <blockpin signalname="XLXN_20" name="I0" />
            <blockpin signalname="E" name="I1" />
            <blockpin signalname="XLXN_19" name="I2" />
            <blockpin signalname="Z" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="XLXN_1">
            <wire x2="1440" y1="464" y2="464" x1="1424" />
            <wire x2="1440" y1="464" y2="496" x1="1440" />
            <wire x2="1456" y1="496" y2="496" x1="1440" />
        </branch>
        <branch name="Z">
            <wire x2="2000" y1="656" y2="656" x1="1984" />
        </branch>
        <branch name="E">
            <wire x2="1712" y1="656" y2="656" x1="800" />
            <wire x2="1728" y1="656" y2="656" x1="1712" />
        </branch>
        <instance x="1728" y="784" name="XLXI_13" orien="R0" />
        <iomarker fontsize="28" x="2000" y="656" name="Z" orien="R0" />
        <branch name="XLXN_19">
            <wire x2="1728" y1="528" y2="528" x1="1712" />
            <wire x2="1728" y1="528" y2="592" x1="1728" />
        </branch>
        <branch name="XLXN_2">
            <wire x2="1440" y1="848" y2="848" x1="1424" />
            <wire x2="1456" y1="816" y2="816" x1="1440" />
            <wire x2="1440" y1="816" y2="848" x1="1440" />
        </branch>
        <instance x="1456" y="880" name="XLXI_5" orien="R0" />
        <branch name="XLXN_20">
            <wire x2="1728" y1="784" y2="784" x1="1712" />
            <wire x2="1728" y1="720" y2="784" x1="1728" />
        </branch>
        <instance x="1456" y="624" name="XLXI_4" orien="R0" />
        <branch name="I0">
            <wire x2="1104" y1="496" y2="496" x1="800" />
            <wire x2="1104" y1="496" y2="720" x1="1104" />
            <wire x2="1456" y1="720" y2="720" x1="1104" />
            <wire x2="1456" y1="720" y2="752" x1="1456" />
            <wire x2="1168" y1="496" y2="496" x1="1104" />
        </branch>
        <instance x="1168" y="944" name="XLXI_2" orien="R0" />
        <instance x="1168" y="560" name="XLXI_1" orien="R0" />
        <branch name="XLXN_3">
            <wire x2="1168" y1="432" y2="432" x1="1136" />
        </branch>
        <instance x="912" y="464" name="XLXI_6" orien="R0" />
        <branch name="S">
            <wire x2="880" y1="880" y2="880" x1="800" />
            <wire x2="1168" y1="880" y2="880" x1="880" />
            <wire x2="912" y1="432" y2="432" x1="880" />
            <wire x2="880" y1="432" y2="880" x1="880" />
        </branch>
        <branch name="I1">
            <wire x2="1024" y1="816" y2="816" x1="800" />
            <wire x2="1168" y1="816" y2="816" x1="1024" />
            <wire x2="1456" y1="592" y2="592" x1="1024" />
            <wire x2="1024" y1="592" y2="816" x1="1024" />
            <wire x2="1456" y1="560" y2="592" x1="1456" />
        </branch>
        <iomarker fontsize="28" x="800" y="880" name="S" orien="R180" />
        <iomarker fontsize="28" x="800" y="496" name="I0" orien="R180" />
        <iomarker fontsize="28" x="800" y="816" name="I1" orien="R180" />
        <iomarker fontsize="28" x="800" y="656" name="E" orien="R180" />
    </sheet>
</drawing>