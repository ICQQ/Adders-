----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2018/10/08 16:18:19
-- Design Name: 
-- Module Name: serialadder16bits - archserialadder16bits
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

entity serialadder16bits is
    Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           CIN : in STD_LOGIC;
           SUM : out STD_LOGIC_VECTOR (15 downto 0);
           COUT : out STD_LOGIC);
end serialadder16bits;

architecture archserialadder16bits of serialadder16bits is
 component halfadder 
    Port( A : in STD_LOGIC;
           B : in STD_LOGIC;
            CIN: in STD_LOGIC;
            SUM : out STD_LOGIC;
            COUT : out STD_LOGIC);  
 end component;
  signal COUTtmp: STD_LOGIC_vector(15 downto 0);
begin
  adderuut0: halfadder 
  port map ( A =>A(0),
             B =>B(0),
              CIN=>CIN,
              SUM =>SUM(0),
              COUT =>COUTtmp(0)); 
  addergen:
              for i in 1 to 15 generate
              adderuut: halfadder port map
                   (    A =>A(i),
                         B=>B(i),
                         CIN=>COUTtmp(i-1),
                         SUM =>SUM(i),
                         COUT =>COUTtmp(i));
              end generate;
              COUT<=COUTtmp(15);




end archserialadder16bits;
