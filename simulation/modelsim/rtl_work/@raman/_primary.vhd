library verilog;
use verilog.vl_types.all;
entity Raman is
    port(
        clock           : in     vl_logic;
        data            : in     vl_logic_vector(11 downto 0);
        rdreq           : out    vl_logic;
        wrreq           : out    vl_logic;
        q               : out    vl_logic_vector(11 downto 0);
        cnt_point       : out    vl_logic_vector(10 downto 0);
        cnt_measure     : out    vl_logic_vector(16 downto 0);
        enable          : in     vl_logic
    );
end Raman;
