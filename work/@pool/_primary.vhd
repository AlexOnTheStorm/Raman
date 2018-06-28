library verilog;
use verilog.vl_types.all;
entity Pool is
    port(
        clk             : in     vl_logic;
        cnt_measure     : in     vl_logic_vector(16 downto 0);
        cnt_point       : in     vl_logic_vector(10 downto 0);
        MEASURES        : in     vl_logic_vector(16 downto 0);
        POINTS          : in     vl_logic_vector(10 downto 0);
        cnt_save        : out    vl_logic_vector(3 downto 0);
        cnt_div         : out    vl_logic_vector(10 downto 0);
        div_enable      : out    vl_logic;
        switch          : in     vl_logic;
        address         : out    vl_logic_vector(10 downto 0);
        start           : out    vl_logic;
        qstokes         : in     vl_logic_vector(28 downto 0);
        qantistokes     : in     vl_logic_vector(28 downto 0);
        ready           : out    vl_logic;
        quotient        : out    vl_logic_vector(11 downto 0);
        wren_stokes     : out    vl_logic;
        wren_antistokes : out    vl_logic
    );
end Pool;
