library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Adder_p2 is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           saladder : out  STD_LOGIC_VECTOR (31 downto 0));
end Adder_p2;

architecture Behavioral of Adder_p2 is

begin

saladder <= STD_LOGIC_VECTOR(SIGNED(A)+SIGNED(B));

end Behavioral;

