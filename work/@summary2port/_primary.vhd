library verilog;
use verilog.vl_types.all;
entity Summary2port is
    port(
        aclr            : in     vl_logic;
        clock           : in     vl_logic;
        data            : in     vl_logic_vector(28 downto 0);
        rdaddress       : in     vl_logic_vector(10 downto 0);
        wraddress       : in     vl_logic_vector(10 downto 0);
        wren            : in     vl_logic;
        q               : out    vl_logic_vector(28 downto 0)
    );
end Summary2port;
