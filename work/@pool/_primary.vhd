library verilog;
use verilog.vl_types.all;
entity Pool is
    generic(
        POINTS          : vl_notype;
        MEASURES        : vl_notype
    );
    port(
        clk             : in     vl_logic;
        cnt_measure     : in     vl_logic_vector(16 downto 0);
        cnt_point       : in     vl_logic_vector(10 downto 0);
        cnt_save        : in     vl_logic_vector(3 downto 0);
        sum             : in     vl_logic_vector;
        store           : out    vl_logic_vector;
        ready           : out    vl_logic;
        cnt_div         : out    vl_logic_vector(10 downto 0);
        div_en          : out    vl_logic;
        switch          : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of POINTS : constant is 5;
    attribute mti_svvh_generic_type of MEASURES : constant is 5;
end Pool;
