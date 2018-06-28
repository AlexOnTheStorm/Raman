-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- PROGRAM		"Quartus II 64-Bit"
-- VERSION		"Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"
-- CREATED		"Sat Mar 24 23:46:42 2018"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY Raman IS 
	PORT
	(
		enable :  IN  STD_LOGIC;
		clk :  IN  STD_LOGIC;
		data :  IN  STD_LOGIC_VECTOR(11 DOWNTO 0);
		switch :  OUT  STD_LOGIC;
		eight :  OUT  STD_LOGIC_VECTOR(11 DOWNTO 0);
		nine :  OUT  STD_LOGIC_VECTOR(11 DOWNTO 0);
		one :  OUT  STD_LOGIC_VECTOR(11 DOWNTO 0);
		presum :  OUT  STD_LOGIC_VECTOR(14 DOWNTO 0);
		ten :  OUT  STD_LOGIC_VECTOR(11 DOWNTO 0);
		three :  OUT  STD_LOGIC_VECTOR(11 DOWNTO 0);
		two :  OUT  STD_LOGIC_VECTOR(11 DOWNTO 0)
	);
END Raman;

ARCHITECTURE bdf_type OF Raman IS 

COMPONENT fiforam
	PORT(aclr : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 rdreq : IN STD_LOGIC;
		 sclr : IN STD_LOGIC;
		 wrreq : IN STD_LOGIC;
		 data : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
		 empty : OUT STD_LOGIC;
		 full : OUT STD_LOGIC;
		 q : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
		 usedw : OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
	);
END COMPONENT;

COMPONENT action
GENERIC (MEASURES : INTEGER;
			POINTS : INTEGER
			);
	PORT(enable : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 wrreq : OUT STD_LOGIC;
		 rdreq : OUT STD_LOGIC;
		 cnt_measure : OUT STD_LOGIC_VECTOR(16 DOWNTO 0);
		 cnt_point : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
		 cnt_save : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT accumulation
GENERIC (MEASURES : INTEGER;
			POINTS : INTEGER
			);
	PORT(clk : IN STD_LOGIC;
		 rdreq : IN STD_LOGIC;
		 cnt_measure : IN STD_LOGIC_VECTOR(16 DOWNTO 0);
		 cnt_point : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
		 q : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
		 presum : OUT STD_LOGIC_VECTOR(14 DOWNTO 0);
		 sum : OUT STD_LOGIC_VECTOR(289 DOWNTO 0)
	);
END COMPONENT;

COMPONENT pool
GENERIC (MEASURES : INTEGER;
			POINTS : INTEGER
			);
	PORT(clk : IN STD_LOGIC;
		 switch : IN STD_LOGIC;
		 cnt_measure : IN STD_LOGIC_VECTOR(16 DOWNTO 0);
		 cnt_point : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
		 cnt_save : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 sum : IN STD_LOGIC_VECTOR(289 DOWNTO 0);
		 ready : OUT STD_LOGIC;
		 div_en : OUT STD_LOGIC;
		 cnt_div : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
		 prestore : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
		 store : OUT STD_LOGIC_VECTOR(119 DOWNTO 0)
	);
END COMPONENT;

COMPONENT storage
GENERIC (MEASURES : INTEGER;
			POINTS : INTEGER
			);
	PORT(clk : IN STD_LOGIC;
		 switch : IN STD_LOGIC;
		 cnt_measure : IN STD_LOGIC_VECTOR(16 DOWNTO 0);
		 cnt_point : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
		 cnt_save : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 store : IN STD_LOGIC_VECTOR(119 DOWNTO 0);
		 storage : OUT STD_LOGIC_VECTOR(1199 DOWNTO 0)
	);
END COMPONENT;

COMPONENT ratio
GENERIC (MEASURES : INTEGER;
			POINTS : INTEGER
			);
	PORT(clk : IN STD_LOGIC;
		 switch : IN STD_LOGIC;
		 cnt_measure : IN STD_LOGIC_VECTOR(16 DOWNTO 0);
		 cnt_point : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
		 storage : IN STD_LOGIC_VECTOR(1199 DOWNTO 0);
		 ready_ratio : OUT STD_LOGIC;
		 ratio_en : OUT STD_LOGIC;
		 cnt_ratio : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
		 eight : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
		 nine : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
		 one : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
		 ratio : OUT STD_LOGIC_VECTOR(119 DOWNTO 0);
		 ten : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
		 three : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
		 two : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
	);
END COMPONENT;

COMPONENT switch
GENERIC (MEASURES : INTEGER;
			POINTS : INTEGER
			);
	PORT(clk : IN STD_LOGIC;
		 cnt_measure : IN STD_LOGIC_VECTOR(16 DOWNTO 0);
		 cnt_point : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
		 cnt_save : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 switch : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_20 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_21 :  STD_LOGIC_VECTOR(16 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_22 :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC_VECTOR(11 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_23 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC_VECTOR(289 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC_VECTOR(119 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_17 :  STD_LOGIC_VECTOR(1199 DOWNTO 0);


BEGIN 
switch <= SYNTHESIZED_WIRE_23;



b2v_inst : fiforam
PORT MAP(clock => clk,
		 rdreq => SYNTHESIZED_WIRE_20,
		 wrreq => SYNTHESIZED_WIRE_1,
		 data => data,
		 q => SYNTHESIZED_WIRE_5);


b2v_inst2 : action
GENERIC MAP(MEASURES => 100,
			POINTS => 10
			)
PORT MAP(enable => enable,
		 clk => clk,
		 wrreq => SYNTHESIZED_WIRE_1,
		 rdreq => SYNTHESIZED_WIRE_20,
		 cnt_measure => SYNTHESIZED_WIRE_21,
		 cnt_point => SYNTHESIZED_WIRE_22);


b2v_inst3 : accumulation
GENERIC MAP(MEASURES => 100,
			POINTS => 10
			)
PORT MAP(clk => clk,
		 rdreq => SYNTHESIZED_WIRE_20,
		 cnt_measure => SYNTHESIZED_WIRE_21,
		 cnt_point => SYNTHESIZED_WIRE_22,
		 q => SYNTHESIZED_WIRE_5,
		 sum => SYNTHESIZED_WIRE_9);


b2v_inst4 : pool
GENERIC MAP(MEASURES => 100,
			POINTS => 10
			)
PORT MAP(clk => clk,
		 switch => SYNTHESIZED_WIRE_23,
		 cnt_measure => SYNTHESIZED_WIRE_21,
		 cnt_point => SYNTHESIZED_WIRE_22,
		 sum => SYNTHESIZED_WIRE_9,
		 store => SYNTHESIZED_WIRE_13);


b2v_inst5 : storage
GENERIC MAP(MEASURES => 100,
			POINTS => 10
			)
PORT MAP(clk => clk,
		 switch => SYNTHESIZED_WIRE_23,
		 cnt_measure => SYNTHESIZED_WIRE_21,
		 cnt_point => SYNTHESIZED_WIRE_22,
		 store => SYNTHESIZED_WIRE_13,
		 storage => SYNTHESIZED_WIRE_17);


b2v_inst6 : ratio
GENERIC MAP(MEASURES => 100,
			POINTS => 10
			)
PORT MAP(clk => clk,
		 switch => SYNTHESIZED_WIRE_23,
		 cnt_measure => SYNTHESIZED_WIRE_21,
		 cnt_point => SYNTHESIZED_WIRE_22,
		 storage => SYNTHESIZED_WIRE_17,
		 eight => eight,
		 nine => nine,
		 one => one,
		 ten => ten,
		 three => three,
		 two => two);


b2v_inst7 : switch
GENERIC MAP(MEASURES => 100,
			POINTS => 10
			)
PORT MAP(clk => clk,
		 cnt_measure => SYNTHESIZED_WIRE_21,
		 cnt_point => SYNTHESIZED_WIRE_22,
		 switch => SYNTHESIZED_WIRE_23);


END bdf_type;