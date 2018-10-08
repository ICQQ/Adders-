----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2018/10/05 21:01:10
-- Design Name: 
-- Module Name: halfadder - archhalfadder
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

entity halfadder is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           CIN: in STD_LOGIC;
           SUM : out STD_LOGIC;
           COUT : out STD_LOGIC);
end halfadder;

architecture archhalfadder of halfadder is

begin
 process(A,B,CIN)--敏感列表很重要，不写仿真陷入死循环，写不全仿真出错。
 begin
 SUM <= A XOR B XOR CIN;
 COUT <= (A AND B) or (A AND CIN) or (B AND CIN);
 
 end process;

end archhalfadder;
