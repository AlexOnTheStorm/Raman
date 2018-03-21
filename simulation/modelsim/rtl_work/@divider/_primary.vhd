library verilog;
use verilog.vl_types.all;
entity Divider is
    generic(
        N               : integer := 64
    );
    port(
        clk             : in     vl_logic;
        start           : in     vl_logic;
        divident        : in     vl_logic_vector;
        divider         : in     vl_logic_vector;
        quotient        : out    vl_logic_vector;
        reminder        : out    vl_logic_vector;
        ready           : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of N : constant is 1;
end Divider;
