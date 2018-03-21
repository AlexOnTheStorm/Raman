library verilog;
use verilog.vl_types.all;
entity Raman is
    port(
        aclr            : in     vl_logic;
        clock           : in     vl_logic;
        data            : in     vl_logic_vector(11 downto 0);
        rdreq           : in     vl_logic;
        sclr            : in     vl_logic;
        wrreq           : in     vl_logic;
        empty           : out    vl_logic;
        full            : out    vl_logic;
        q               : out    vl_logic_vector(11 downto 0);
        usedw           : out    vl_logic_vector(10 downto 0)
    );
end Raman;
