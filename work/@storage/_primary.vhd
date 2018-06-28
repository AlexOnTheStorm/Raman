library verilog;
use verilog.vl_types.all;
entity Storage is
    port(
        clk             : in     vl_logic;
        cnt_point       : in     vl_logic_vector(10 downto 0);
        POINTS          : in     vl_logic_vector(10 downto 0);
        cnt_save        : in     vl_logic_vector(3 downto 0);
        ratio_enable    : in     vl_logic;
        wr_address      : out    vl_logic_vector(14 downto 0);
        rd_address      : out    vl_logic_vector(14 downto 0);
        cnt_ratio       : in     vl_logic_vector(10 downto 0);
        div_enable      : in     vl_logic;
        wren            : out    vl_logic;
        cnt_div         : in     vl_logic_vector(10 downto 0)
    );
end Storage;
