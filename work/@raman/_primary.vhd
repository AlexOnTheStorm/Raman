library verilog;
use verilog.vl_types.all;
entity Raman is
    generic(
        POINTS          : integer := 10;
        MEASURES        : integer := 100
    );
    port(
        clock           : in     vl_logic;
        data            : in     vl_logic_vector(11 downto 0);
        rdreq           : out    vl_logic;
        wrreq           : out    vl_logic;
        q               : out    vl_logic_vector(11 downto 0);
        cnt_point       : out    vl_logic_vector(10 downto 0);
        cnt_measure     : out    vl_logic_vector(16 downto 0);
        cnt_save        : out    vl_logic_vector(3 downto 0);
        cnt_div         : out    vl_logic_vector(10 downto 0);
        enable          : in     vl_logic;
        switch          : out    vl_logic;
        ready           : out    vl_logic;
        div_en          : out    vl_logic;
        sum1            : out    vl_logic_vector(11 downto 0);
        sum2            : out    vl_logic_vector(11 downto 0);
        sum3            : out    vl_logic_vector(11 downto 0);
        sum5            : out    vl_logic_vector(11 downto 0);
        sum6            : out    vl_logic_vector(11 downto 0);
        cnt_ratio       : out    vl_logic_vector(10 downto 0);
        ratio_en        : out    vl_logic;
        ready_ratio     : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of POINTS : constant is 1;
    attribute mti_svvh_generic_type of MEASURES : constant is 1;
end Raman;
