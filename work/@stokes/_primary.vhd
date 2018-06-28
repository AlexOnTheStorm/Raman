library verilog;
use verilog.vl_types.all;
entity Stokes is
    port(
        address         : in     vl_logic_vector(10 downto 0);
        clock           : in     vl_logic;
        data            : in     vl_logic_vector(28 downto 0);
        wren            : in     vl_logic;
        q               : out    vl_logic_vector(28 downto 0)
    );
end Stokes;
