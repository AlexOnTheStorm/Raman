library verilog;
use verilog.vl_types.all;
entity Accumulation is
    generic(
        POINTS          : vl_notype;
        MEASURES        : vl_notype
    );
    port(
        clk             : in     vl_logic;
        rdreq           : in     vl_logic;
        q               : in     vl_logic_vector(11 downto 0);
        cnt_point       : in     vl_logic_vector(10 downto 0);
        cnt_measure     : in     vl_logic_vector(16 downto 0);
        sum             : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of POINTS : constant is 5;
    attribute mti_svvh_generic_type of MEASURES : constant is 5;
end Accumulation;
