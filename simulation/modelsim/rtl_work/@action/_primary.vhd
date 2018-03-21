library verilog;
use verilog.vl_types.all;
entity Action is
    generic(
        POINTS          : vl_notype;
        MEASURES        : vl_notype
    );
    port(
        enable          : in     vl_logic;
        wrreq           : out    vl_logic;
        rdreq           : out    vl_logic;
        clk             : in     vl_logic;
        cnt_point       : out    vl_logic_vector(10 downto 0);
        cnt_measure     : out    vl_logic_vector(16 downto 0);
        cnt_save        : out    vl_logic_vector(3 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of POINTS : constant is 5;
    attribute mti_svvh_generic_type of MEASURES : constant is 5;
end Action;
