----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2018/10/07 15:07:49
-- Design Name: 
-- Module Name: prefixadder16version2 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity prefixadder16version2 is
    Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           CIN : in STD_LOGIC;
           SUM : out STD_LOGIC_VECTOR (15 downto 0);
           COUT : out STD_LOGIC);
end prefixadder16version2;

architecture Behavioral of prefixadder16version2 is
 signal g: STD_LOGIC_VECTOR(15 DOWNTO 0);
 signal p: STD_LOGIC_VECTOR(15 DOWNTO 0); 
 signal p0,p2_1,p4_3,p6_5,p8_7,p10_9,p12_11,p14_13: STD_LOGIC;
 signal g0,g2_1,g4_3,g6_5,g8_7,g10_9,g12_11,g14_13: STD_LOGIC;
 signal p1,p2,p5_3,p6_3,p9_7,p10_7,p13_11,p14_11: STD_LOGIC;
 signal g1,g2,g5_3,g6_3,g9_7,g10_7,g13_11,g14_11: STD_LOGIC;
 signal p3,p4,p5,p6,p11_7,p12_7,p13_7,p14_7: STD_LOGIC;
 signal g3,g4,g5,g6,g11_7,g12_7,g13_7,g14_7: STD_LOGIC;
 signal p7,p8,p9,p10,p11,p12,p13,p14: STD_LOGIC;
 signal g7,g8,g9,g10,g11,g12,g13,g14: STD_LOGIC;

begin
 prefixersgen: 
 for i in 0 to 15 generate
 g(i)<=A(i) and B(i);
 p(i)<=A(i) or B(i);
 end generate;
 --first group
 p0<=p(0) and CIN;
 p2_1<=p(1) and p(2);
 p4_3<=p(3) and p(4);
 p6_5<=p(5) and p(6);
 p8_7<=p(7) and p(8);
 p10_9<=p(9) and p(10);
 p12_11<=p(11) and p(12);
 p14_13<=p(13) and p(14);
 
 g0<=g(0) or (p(0) and CIN);
 g2_1<=g(2) or (p(2) and g(1));
 g4_3<=g(4) or (p(4) and g(3));
 g6_5<=g(6) or (p(6) and g(5));
 g8_7<=g(8) or (p(8) and g(7));
 g10_9<=g(10) or (p(10) and g(9));
 g12_11<=g(12) or (p(12) and g(11));
 g14_13<=g(14) or (p(14) and g(13));

--second group
 p1<= p(1) and p0;
 p2<= p2_1 and p0;
 p5_3<= p(5) and p4_3;
 p6_3<= p6_5 and p4_3;
 p9_7<= p(9) and p8_7;
 p10_7<=p10_9 and p8_7;
 p13_11<=p(13) and p12_11;
 p14_11<= p14_13 and p12_11;
 
 g1<=g(1) or (p(1) and g0);
 g2<=g2_1 or (p2_1 and g0);
 g5_3<=g(5) or (p(5) and g4_3);
 g6_3<=g6_5 or (p6_5 and g4_3);
 g9_7<=g(9) or (p(9) and g8_7);
 g10_7<=g10_9 or (p10_9 and g8_7);
 g13_11<=g(13) or (p(13) and g12_11);
 g14_11<=g14_13 or (p14_13 and g12_11);

--third group
 
 p3<= p(3) and p2;
 p4<= p4_3 and p2;
 p5<= p5_3 and p2;
 p6<= p6_3 and p2;
 p11_7<= p(11) and p10_7;
 p12_7<= p12_11 and p10_7;
 p13_7<= p13_11 and p10_7;
 p14_7<= p14_11 and p10_7;
 
 g3<= g(3) or (p(3) and g2);
 g4<= g4_3 or (p4_3 and g2);
 g5<= g5_3 or (p5_3 and g2);
 g6<=g6_3 or (p6_3 and g2);
 g11_7<= g(11) or (p(11) and g10_7);
 g12_7<= g12_11 or (p12_11 and g10_7);
 g13_7<= g13_11 or (p13_11 and g10_7);
 g14_7<= g14_11 or (p14_11 and g10_7);

--fourth group
 p7<= p(7) and p6;
 p8<= p8_7 and p6;
 p9<= p9_7 and p6;
 p10<= p10_7 and p6;
 p11<= p11_7 and p6;
 p12<= p12_7 and p6;
 p13<= p13_7 and p6;
 p14<= p14_7 and p6;
 
 g7<= g(7) or (p(7) and g6);
 g8<= g8_7 or (p8_7 and g6);
 g9<= g9_7 or (p9_7 and g6);
 g10<= g10_7 or (p10_7 and g6);
 g11<= g11_7 or (p11_7 and g6);
 g12<= g12_7 or (p12_7 and g6);
 g13<= g13_7 or (p13_7 and g6);
 g14<= g14_7 or (p14_7 and g6);








 
 SUM(0)<=A(0) XOR B(0) XOR CIN;
 SUM(1)<=A(1) XOR B(1) XOR g0;
 SUM(2)<=A(2) XOR B(2) XOR g1;
 SUM(3)<=A(3) XOR B(3) XOR g2;
 SUM(4)<=A(4) XOR B(4) XOR g3;
 SUM(5)<=A(5) XOR B(5) XOR g4;
 SUM(6)<=A(6) XOR B(6) XOR g5;
 SUM(7)<=A(7) XOR B(7) XOR g6;
 SUM(8)<=A(8) XOR B(8) XOR g7;
 SUM(9)<=A(9) XOR B(9) XOR g8;
 SUM(10)<=A(10) XOR B(10) XOR g9;
 SUM(11)<=A(11) XOR B(11) XOR g10;
 SUM(12)<=A(12) XOR B(12) XOR g11;
 SUM(13)<=A(13) XOR B(13) XOR g12;
 SUM(14)<=A(14) XOR B(14) XOR g13;
 SUM(15)<=A(15) XOR B(15) XOR g14;
 COUT<= g(15) or (p(15) and g14) ;
 
 
 
end Behavioral;
