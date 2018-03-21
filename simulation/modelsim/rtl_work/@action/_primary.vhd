library verilog;
use verilog.vl_types.all;
entity Action is
    port(
        enable          : in     vl_logic;
        wrreq           : out    vl_logic;
        rdreq           : out    vl_logic;
        clk             : in     vl_logic;
        cnt_point       : out    vl_logic_vector(10 downto 0);
        cnt_measure     : out    vl_logic_vector(16 downto 0)
    );
end Action;
