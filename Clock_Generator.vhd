--LIBRARY IEEE;
--USE IEEE.STD_LOGIC_1164.ALL;

--entity Clock_Generator is
--    port (
--        clk : in std_logic;
--        clk_out : out std_logic
--    );
--end Clock_Generator;

--architecture Behavioral of Clock_Generator is
--    signal count : integer := 0;
--    signal temp : std_logic := '0';
--begin
--    process(clk) 
--    begin
--        if rising_edge(clk) then
--            count <= count + 1;
--            if count = 125 then
--                temp <= not temp;
--                count <= 0;
--            end if;
--        end if;
--    end process;

--    clk_out <= temp;
--end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;

entity Clock_Generator is
    Port ( clk_in : in STD_LOGIC;
           reset : in STD_LOGIC;
           clk_out : out STD_LOGIC);
end Clock_Generator;

architecture Behavioral of Clock_Generator is
begin
    process (clk_in, reset)
    variable cntval: integer range 0 to 65;
    variable temp: std_logic;
    begin
        if reset = '0' then
            cntval :=0;
            temp := '0';
        elsif rising_edge(clk_in) then
            if cntval = 62 then  -- 124 in binary
                temp := not temp;
                cntval := 0;
            else
                cntval := cntval + 1;
            end if;
        end if;
clk_out <= temp;
    end process;
end Behavioral;

