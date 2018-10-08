----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2018/10/08 17:03:29
-- Design Name: 
-- Module Name: carrylookaheadadder16bits - Behavioral
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

entity carrylookaheadadder16bits is
    Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           CIN : in STD_LOGIC;
           SUM : out STD_LOGIC_VECTOR (15 downto 0);
           COUT : out STD_LOGIC);
end carrylookaheadadder16bits;

architecture Behavioral of carrylookaheadadder16bits is
signal g: STD_LOGIC_VECTOR(15 DOWNTO 0);
signal p: STD_LOGIC_VECTOR(15 DOWNTO 0);
signal ctmp: STD_LOGIC_VECTOR(16 DOWNTO 0);
signal hs: STD_LOGIC_VECTOR(15 DOWNTO 0);
begin
 ctmp(0)<=CIN;
 addercarryaheadgen: 
 for i in 0 to 15 generate
 g(i)<=A(i) and B(i);
 p(i)<=A(i) OR B(i);
 ctmp(i+1)<=g(i) or (p(i)and ctmp(i));--此处为产生进位或者传递进位且上一步有进位 
 hs(i)<=A(i) xor B(i);
 SUM(i)<= hs(i) xor ctmp(i);
 end generate;
  COUT<=ctmp(16);

end Behavioral;
