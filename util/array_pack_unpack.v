`ifndef ARRAY_PACK_UNPACK_V
`ifdef PACK_ARRAY
$finish; // macro PACK_ARRAY already exists. refusing to redefine.
`endif
`ifdef UNPACK_ARRAY
$finish; // macro UNPACK_ARRAY already exists. refusing to redefine.
`endif

`define ARRAY_PACK_UNPACK_V 1
`define PACK_ARRAY(PK_WIDTH,PK_LEN,PK_SRC,PK_DEST) genvar pk_idx; generate for (pk_idx=0; pk_idx<(PK_LEN); pk_idx=pk_idx+1) begin : id1 assign PK_DEST[((PK_WIDTH)*pk_idx+((PK_WIDTH)-1)):((PK_WIDTH)*pk_idx)] = PK_SRC[pk_idx][((PK_WIDTH)-1):0]; end endgenerate
`define UNPACK_ARRAY(PK_WIDTH,PK_LEN,PK_DEST,PK_SRC) genvar unpk_idx; generate for (unpk_idx=0; unpk_idx<(PK_LEN); unpk_idx=unpk_idx+1) begin : id2 assign PK_DEST[unpk_idx][((PK_WIDTH)-1):0] = PK_SRC[((PK_WIDTH)*unpk_idx+(PK_WIDTH-1)):((PK_WIDTH)*unpk_idx)]; end endgenerate


`define UNPACK_ARRAY1(PK_WIDTH,PK_LEN,PK_DEST,PK_SRC) genvar unpk_idx1; generate for (unpk_idx1=0; unpk_idx1<(PK_LEN); unpk_idx1=unpk_idx1+1) begin : id21 assign PK_DEST[unpk_idx1][((PK_WIDTH)-1):0] = PK_SRC[((PK_WIDTH)*unpk_idx1+(PK_WIDTH-1)):((PK_WIDTH)*unpk_idx1)]; end endgenerate
`define UNPACK_ARRAY2(PK_WIDTH,PK_LEN,PK_DEST,PK_SRC) genvar unpk_idx2; generate for (unpk_idx2=0; unpk_idx2<(PK_LEN); unpk_idx2=unpk_idx2+1) begin : id22 assign PK_DEST[unpk_idx2][((PK_WIDTH)-1):0] = PK_SRC[((PK_WIDTH)*unpk_idx2+(PK_WIDTH-1)):((PK_WIDTH)*unpk_idx2)]; end endgenerate
`define UNPACK_ARRAY3(PK_WIDTH,PK_LEN,PK_DEST,PK_SRC) genvar unpk_idx3; generate for (unpk_idx3=0; unpk_idx3<(PK_LEN); unpk_idx3=unpk_idx3+1) begin : id23 assign PK_DEST[unpk_idx3][((PK_WIDTH)-1):0] = PK_SRC[((PK_WIDTH)*unpk_idx3+(PK_WIDTH-1)):((PK_WIDTH)*unpk_idx3)]; end endgenerate
`define UNPACK_ARRAY4(PK_WIDTH,PK_LEN,PK_DEST,PK_SRC) genvar unpk_idx4; generate for (unpk_idx4=0; unpk_idx4<(PK_LEN); unpk_idx4=unpk_idx4+1) begin : id24 assign PK_DEST[unpk_idx4][((PK_WIDTH)-1):0] = PK_SRC[((PK_WIDTH)*unpk_idx4+(PK_WIDTH-1)):((PK_WIDTH)*unpk_idx4)]; end endgenerate
`define UNPACK_ARRAY5(PK_WIDTH,PK_LEN,PK_DEST,PK_SRC) genvar unpk_idx5; generate for (unpk_idx5=0; unpk_idx5<(PK_LEN); unpk_idx5=unpk_idx5+1) begin : id25 assign PK_DEST[unpk_idx5][((PK_WIDTH)-1):0] = PK_SRC[((PK_WIDTH)*unpk_idx5+(PK_WIDTH-1)):((PK_WIDTH)*unpk_idx5)]; end endgenerate
`define UNPACK_ARRAY6(PK_WIDTH,PK_LEN,PK_DEST,PK_SRC) genvar unpk_idx6; generate for (unpk_idx6=0; unpk_idx6<(PK_LEN); unpk_idx6=unpk_idx6+1) begin : id26 assign PK_DEST[unpk_idx6][((PK_WIDTH)-1):0] = PK_SRC[((PK_WIDTH)*unpk_idx6+(PK_WIDTH-1)):((PK_WIDTH)*unpk_idx6)]; end endgenerate
`define UNPACK_ARRAY7(PK_WIDTH,PK_LEN,PK_DEST,PK_SRC) genvar unpk_idx7; generate for (unpk_idx7=0; unpk_idx7<(PK_LEN); unpk_idx7=unpk_idx7+1) begin : id27 assign PK_DEST[unpk_idx7][((PK_WIDTH)-1):0] = PK_SRC[((PK_WIDTH)*unpk_idx7+(PK_WIDTH-1)):((PK_WIDTH)*unpk_idx7)]; end endgenerate
`define UNPACK_ARRAY8(PK_WIDTH,PK_LEN,PK_DEST,PK_SRC) genvar unpk_idx8; generate for (unpk_idx8=0; unpk_idx8<(PK_LEN); unpk_idx8=unpk_idx8+1) begin : id28 assign PK_DEST[unpk_idx8][((PK_WIDTH)-1):0] = PK_SRC[((PK_WIDTH)*unpk_idx8+(PK_WIDTH-1)):((PK_WIDTH)*unpk_idx8)]; end endgenerate
`define UNPACK_ARRAY9(PK_WIDTH,PK_LEN,PK_DEST,PK_SRC) genvar unpk_idx9; generate for (unpk_idx9=0; unpk_idx9<(PK_LEN); unpk_idx9=unpk_idx9+1) begin : id29 assign PK_DEST[unpk_idx9][((PK_WIDTH)-1):0] = PK_SRC[((PK_WIDTH)*unpk_idx9+(PK_WIDTH-1)):((PK_WIDTH)*unpk_idx9)]; end endgenerate
`define UNPACK_ARRAY10(PK_WIDTH,PK_LEN,PK_DEST,PK_SRC) genvar unpk_idx10; generate for (unpk_idx10=0; unpk_idx10<(PK_LEN); unpk_idx10=unpk_idx10+1) begin : id210 assign PK_DEST[unpk_idx10][((PK_WIDTH)-1):0] = PK_SRC[((PK_WIDTH)*unpk_idx10+(PK_WIDTH-1)):((PK_WIDTH)*unpk_idx10)]; end endgenerate

`endif