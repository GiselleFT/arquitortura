library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity control is
    Port ( CLR : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           INI : in  STD_LOGIC;
           Z   : in  STD_LOGIC;
           A0  : in  STD_LOGIC;
           LA  : out  STD_LOGIC;
           SH  : out  STD_LOGIC;
           LB  : out  STD_LOGIC;
           IB  : out  STD_LOGIC;
           SD  : out  STD_LOGIC);
end control;

architecture unidad of control is
TYPE ESTADOS IS (A, B, C);
SIGNAL EDO_ACT, EDO_SGTE: ESTADOS;
begin

	AUTOMATA: PROCESS (EDO_ACT, INI, Z, A0)
	BEGIN
		LA<='0';
		SH<='0';
		LB<='0';
		IB<='0';
		SD<='0';
		CASE EDO_ACT IS
			WHEN A => LB <='1';--LAS SALIDAS MOORE, SUS ASIGNACIONES VAN DESPUES DE LA FLECHA
				IF(INI='0')THEN
					LA <= '1';
					EDO_SGTE <= A;
				ELSE
					EDO_SGTE <= B;
				END IF;
				
				WHEN B => SH <='1';--LAS SALIDAS MOORE, SUS ASIGNACIONES VAN DESPUES DE LA FLECHA
				IF(Z='1')THEN
					EDO_SGTE <= C;
				ELSE
					IF(A0='1') THEN
						IB<='1';
						EDO_SGTE <= B;
					ELSE
						EDO_SGTE <= B;
					END IF;
				END IF;
				
				WHEN C =>SD<= '1';
				IF(INI='0')THEN
					EDO_SGTE <= A;
				ELSE
					EDO_SGTE <= C;
				END IF;
		END CASE;
	END PROCESS AUTOMATA;
	
	TRANSICION: PROCESS(CLK, CLR)
	BEGIN
		IF(CLR='1')THEN
			EDO_ACT <=A;
		ELSIF(RISING_EDGE(CLK))THEN
			EDO_ACT<=EDO_SGTE;
		END IF;
	END PROCESS TRANSICION;
	
end unidad;

