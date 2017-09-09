--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:29:53 09/09/2017
-- Design Name:   
-- Module Name:   C:/Users/reymy/Documents/quinto/arquitortura/ALU/ALU_PRUEBA_TB.vhd
-- Project Name:  ALU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALUpractica
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ALU_PRUEBA_TB IS
END ALU_PRUEBA_TB;
 
ARCHITECTURE behavior OF ALU_PRUEBA_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALUpractica
    PORT(
         CN : OUT  std_logic;
         BINVERT : IN  std_logic;
         AINVERT : IN  std_logic;
         OP : IN  std_logic_vector(1 downto 0);
         RES : INOUT  std_logic_vector(3 downto 0);
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         BZ : OUT  std_logic;
         BC : OUT  std_logic;
         BN : OUT  std_logic;
         BOV : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal BINVERT : std_logic := '0';
   signal AINVERT : std_logic := '0';
   signal OP : std_logic_vector(1 downto 0) := (others => '0');
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');

	--BiDirs
   signal RES : std_logic_vector(3 downto 0);

 	--Outputs
   signal CN : std_logic;
   signal BZ : std_logic;
   signal BC : std_logic;
   signal BN : std_logic;
   signal BOV : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALUpractica PORT MAP (
          CN => CN,
          BINVERT => BINVERT,
          AINVERT => AINVERT,
          OP => OP,
          RES => RES,
          A => A,
          B => B,
          BZ => BZ,
          BC => BC,
          BN => BN,
          BOV => BOV
        );

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		OP<="11";
		AINVERT<='0';
		BINVERT<='0';
		A<="1110";
		B<="1111";
		wait for 100 ns;
      --wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
