library verilog;
use verilog.vl_types.all;
entity Ratio is
    generic(
        POINTS          : vl_notype;
        MEASURES        : vl_notype
    );
    port(
        clk             : in     vl_logic;
        cnt_measure     : in     vl_logic_vector(16 downto 0);
        cnt_point       : in     vl_logic_vector(10 downto 0);
        storage         : in     vl_logic_vector;
        switch          : in     vl_logic;
        cnt_ratio       : out    vl_logic_vector(10 downto 0);
        ready_ratio     : out    vl_logic;
        ratio_en        : out    vl_logic;
        ratio           : out    vl_logic_vector;
        quotient        : out    vl_logic_vector(11 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of POINTS : constant is 5;
    attribute mti_svvh_generic_type of MEASURES : constant is 5;
end Ratio;
