library verilog;
use verilog.vl_types.all;
entity Ratio is
    generic(
        POINTS          : integer := 10;
        MEASURES        : integer := 100
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
        one             : out    vl_logic_vector(11 downto 0);
        two             : out    vl_logic_vector(11 downto 0);
        three           : out    vl_logic_vector(11 downto 0);
        eight           : out    vl_logic_vector(11 downto 0);
        nine            : out    vl_logic_vector(11 downto 0);
        ten             : out    vl_logic_vector(11 downto 0);
        quotient        : out    vl_logic_vector(11 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of POINTS : constant is 1;
    attribute mti_svvh_generic_type of MEASURES : constant is 1;
end Ratio;
