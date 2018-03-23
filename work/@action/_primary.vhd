library verilog;
use verilog.vl_types.all;
entity Action is
    generic(
        POINTS          : integer := 10;
        MEASURES        : integer := 100
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
    attribute mti_svvh_generic_type of POINTS : constant is 1;
    attribute mti_svvh_generic_type of MEASURES : constant is 1;
end Action;
