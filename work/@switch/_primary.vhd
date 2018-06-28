library verilog;
use verilog.vl_types.all;
entity Switch is
    port(
        clk             : in     vl_logic;
        cnt_measure     : in     vl_logic_vector(16 downto 0);
        cnt_point       : in     vl_logic_vector(10 downto 0);
        POINTS          : in     vl_logic_vector(10 downto 0);
        MEASURES        : in     vl_logic_vector(16 downto 0);
        switch          : out    vl_logic
    );
end Switch;
