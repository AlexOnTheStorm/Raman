library verilog;
use verilog.vl_types.all;
entity Raman is
    port(
        enable          : in     vl_logic;
        clk             : in     vl_logic;
        data            : in     vl_logic_vector(11 downto 0);
        switch          : out    vl_logic;
        eight           : out    vl_logic_vector(11 downto 0);
        nine            : out    vl_logic_vector(11 downto 0);
        one             : out    vl_logic_vector(11 downto 0);
        ten             : out    vl_logic_vector(11 downto 0);
        three           : out    vl_logic_vector(11 downto 0);
        two             : out    vl_logic_vector(11 downto 0)
    );
end Raman;
