library verilog;
use verilog.vl_types.all;
entity Ratio is
    port(
        clk             : in     vl_logic;
        cnt_measure     : in     vl_logic_vector(16 downto 0);
        cnt_point       : in     vl_logic_vector(10 downto 0);
        switch          : in     vl_logic;
        POINTS          : in     vl_logic_vector(10 downto 0);
        cnt_ratio       : out    vl_logic_vector(10 downto 0);
        ready           : out    vl_logic;
        ratio_enable    : out    vl_logic;
        quotient        : out    vl_logic_vector(11 downto 0);
        start           : out    vl_logic;
        tentimes        : out    vl_logic_vector(15 downto 0);
        qmem            : in     vl_logic_vector(11 downto 0);
        wren            : out    vl_logic
    );
end Ratio;
