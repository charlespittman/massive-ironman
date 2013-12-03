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
        <signal name="XLXN_5" />
        <signal name="XLXN_6" />
        <signal name="XLXN_7" />
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
        <block symbolname="or3" name="XLXI_4">
            <blockpin signalname="XLXN_3" name="I0" />
            <blockpin signalname="XLXN_2" name="I1" />
            <blockpin signalname="XLXN_1" name="I2" />
            <blockpin name="O" />
        </block>
        <block symbolname="and3" name="XLXI_1">
            <blockpin signalname="XLXN_5" name="I0" />
            <blockpin signalname="XLXN_4" name="I1" />
            <blockpin name="I2" />
            <blockpin signalname="XLXN_1" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_2">
            <blockpin signalname="XLXN_6" name="I0" />
            <blockpin name="I1" />
            <blockpin name="I2" />
            <blockpin signalname="XLXN_2" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_3">
            <blockpin signalname="XLXN_7" name="I0" />
            <blockpin name="I1" />
            <blockpin name="I2" />
            <blockpin signalname="XLXN_3" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_14">
            <blockpin name="I" />
            <blockpin signalname="XLXN_4" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_15">
            <blockpin name="I" />
            <blockpin signalname="XLXN_5" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_16">
            <blockpin name="I" />
            <blockpin signalname="XLXN_6" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_17">
            <blockpin name="I" />
            <blockpin signalname="XLXN_7" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1104" y="1840" name="XLXI_3" orien="R0" />
        <instance x="1696" y="1424" name="XLXI_4" orien="R0" />
        <instance x="1056" y="1152" name="XLXI_1" orien="R0" />
        <branch name="XLXN_1">
            <wire x2="1696" y1="1024" y2="1024" x1="1312" />
            <wire x2="1696" y1="1024" y2="1232" x1="1696" />
        </branch>
        <branch name="XLXN_2">
            <wire x2="1696" y1="1296" y2="1296" x1="1344" />
        </branch>
        <branch name="XLXN_3">
            <wire x2="1696" y1="1712" y2="1712" x1="1360" />
            <wire x2="1696" y1="1360" y2="1712" x1="1696" />
        </branch>
        <instance x="1088" y="1424" name="XLXI_2" orien="R0" />
        <branch name="XLXN_4">
            <wire x2="1056" y1="1024" y2="1024" x1="1024" />
        </branch>
        <instance x="800" y="1056" name="XLXI_14" orien="R0" />
        <branch name="XLXN_5">
            <wire x2="1056" y1="1088" y2="1088" x1="1024" />
        </branch>
        <instance x="800" y="1120" name="XLXI_15" orien="R0" />
        <branch name="XLXN_6">
            <wire x2="1088" y1="1360" y2="1360" x1="1056" />
        </branch>
        <instance x="832" y="1392" name="XLXI_16" orien="R0" />
        <branch name="XLXN_7">
            <wire x2="1104" y1="1776" y2="1776" x1="1072" />
        </branch>
        <instance x="848" y="1808" name="XLXI_17" orien="R0" />
    </sheet>
</drawing>