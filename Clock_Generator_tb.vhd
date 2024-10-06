library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Clock_Generator_tb is
end;

architecture bench of Clock_Generator_tb is

  component Clock_Generator
      Port ( clk_in : in STD_LOGIC;
             reset : in STD_LOGIC;
             clk_out : out STD_LOGIC);
  end component;

  signal clk_in: STD_LOGIC;
  signal reset: STD_LOGIC;
  signal clk_out: STD_LOGIC;

  constant clock_period: time := 8 ns;
  signal stop_the_clock: boolean;

begin

  uut: Clock_Generator port map ( clk_in  => clk_in,
                                reset   => reset,
                                clk_out => clk_out );

  stimulus: process
  begin
  
    -- Put initialisation code here

    reset <= '0';
    wait for 5 ns;
    reset <= '1';
    wait for 5 ns;

    -- Put test bench stimulus code here

    wait for 100 us;
    stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      clk_in <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;
