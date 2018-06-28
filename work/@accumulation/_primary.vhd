library verilog;
use verilog.vl_types.all;
entity Accumulation is
    port(
        clk             : in     vl_logic;
        q               : in     vl_logic_vector(11 downto 0);
        qmem            : in     vl_logic_vector(28 downto 0);
        datamem         : out    vl_logic_vector(28 downto 0);
        POINTS          : in     vl_logic_vector(10 downto 0);
        MEASURES        : in     vl_logic_vector(16 downto 0);
        cnt_point       : in     vl_logic_vector(10 downto 0);
        cnt_measure     : in     vl_logic_vector(16 downto 0);
        aclr            : out    vl_logic;
        cnt_point_read  : out    vl_logic_vector(10 downto 0);
        wren            : out    vl_logic;
        rdreq           : in     vl_logic
    );
end Accumulation;
