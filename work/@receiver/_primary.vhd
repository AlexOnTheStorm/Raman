library verilog;
use verilog.vl_types.all;
entity Receiver is
    port(
        data_plus       : in     vl_logic_vector(11 downto 0);
        data_minus      : in     vl_logic_vector(11 downto 0);
        data_in         : out    vl_logic_vector(11 downto 0)
    );
end Receiver;
